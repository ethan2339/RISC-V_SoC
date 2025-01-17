`include "dbgapb_define.h"
`include "dbgapb_mmap.h"

module dbgapb (
    input                       clk,
    input                       rstn,
    apb_intf.slave              apb_intf,

    output logic [       11: 0] addr_out,
    output logic [`XLEN - 1: 0] wdata_out,
    output logic                gpr_rd,
    output logic                gpr_wr,
    input        [`XLEN - 1: 0] gpr_in,
    output logic                csr_rd,
    output logic                csr_wr,
    input        [`XLEN - 1: 0] csr_in,
    input        [`XLEN - 1: 0] pc,
    output logic [       31: 0] insn_out,
    output logic                exec,
    input                       halted,
    output logic                attach
);

logic               dbg_en;
logic [       31:0] dbg_insn;
logic               dbg_insn_wr;
logic [`XLEN - 1:0] dbg_wdata;
logic               dbg_wdata_wr;
logic [`XLEN - 1:0] dbg_rdata;

logic [`XLEN - 1:0] wdata_reg;
logic [`XLEN - 1:0] rdata_reg;
logic [`XLEN - 1:0] status_reg;

logic               rdata_sel;
logic               pc_rd;

logic               nxt_attach;
logic [       31:0] nxt_insn_out;
logic               nxt_exec;
logic               nxt_rdata_sel;
logic               nxt_pc_rd;
logic [       11:0] nxt_addr_out;
logic               nxt_gpr_rd;
logic               nxt_csr_rd;
logic               nxt_gpr_wr;
logic               nxt_csr_wr;

logic [        9:0] nxt_ready_cnt;
logic [        9:0] ready_cnt;

assign status_reg = {{`XLEN-2{1'b0}}, halted, attach};

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        rdata_reg <= `XLEN'b0;
    end
    else if (pc_rd) begin
        rdata_reg <= pc;
    end
    else if (gpr_rd) begin
        rdata_reg <= gpr_in;
    end
    else if (csr_rd) begin
        rdata_reg <= csr_in;
    end
end

assign dbg_rdata = rdata_sel ? status_reg : rdata_reg;

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        wdata_reg <= 32'b0;
    end
    else if (dbg_wdata_wr) begin
        wdata_reg <= dbg_wdata;
    end
end

assign wdata_out = wdata_reg;

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        attach     <= 1'b0;
        insn_out   <= 32'b0;
        exec       <= 1'b0;
        rdata_sel  <= 1'b0;
        pc_rd      <= 1'b0;
        addr_out   <= 12'b0;
        gpr_rd     <= 1'b0;
        csr_rd     <= 1'b0;
        gpr_wr     <= 1'b0;
        csr_wr     <= 1'b0;
    end
    else if (dbg_insn_wr) begin
        attach     <= nxt_attach;
        insn_out   <= nxt_insn_out;
        exec       <= nxt_exec;
        rdata_sel  <= nxt_rdata_sel;
        pc_rd      <= nxt_pc_rd;
        addr_out   <= nxt_addr_out;
        gpr_rd     <= nxt_gpr_rd;
        csr_rd     <= nxt_csr_rd;
        gpr_wr     <= nxt_gpr_wr;
        csr_wr     <= nxt_csr_wr;
    end
    else begin
        exec       <= 1'b0;
        pc_rd      <= 1'b0;
        gpr_rd     <= 1'b0;
        csr_rd     <= 1'b0;
        gpr_wr     <= 1'b0;
        csr_wr     <= 1'b0;
    end
end

always_comb begin
    nxt_attach    = attach;
    nxt_insn_out  = insn_out;
    nxt_exec      = 1'b0;
    nxt_rdata_sel = rdata_sel;
    nxt_pc_rd     = 1'b0;
    nxt_addr_out  = addr_out;
    nxt_gpr_rd    = 1'b0;
    nxt_csr_rd    = 1'b0;
    nxt_gpr_wr    = 1'b0;
    nxt_csr_wr    = 1'b0;
    case (dbg_insn[11:0])
        `INST_ATTACH: begin
            nxt_attach    = 1'b1;
        end
        `INST_RESUME: begin
            nxt_attach    = 1'b0;
        end
        `INST_INSTREG_WR: begin
            nxt_insn_out  = wdata_reg[31:0];
        end
        `INST_EXECUTE: begin
            nxt_exec      = 1'b1;
        end
        `INST_STATUS_RD: begin
            nxt_rdata_sel = 1'b1;
        end
        `INST_PC_RD: begin
            nxt_rdata_sel = 1'b0;
            nxt_pc_rd     = 1'b1;
        end
        `INST_GPR_RD: begin
            nxt_rdata_sel = 1'b0;
            nxt_addr_out  = {4'b0, dbg_insn[23:16]};
            nxt_gpr_rd    = 1'b1;
        end
        `INST_CSR_RD: begin
            nxt_rdata_sel = 1'b0;
            nxt_addr_out  = dbg_insn[27:16];
            nxt_csr_rd    = 1'b1;
        end
        `INST_GPR_WR: begin
            nxt_addr_out  = {7'b0, dbg_insn[20:16]};
            nxt_gpr_wr    = 1'b1;
        end
        `INST_CSR_WR: begin
            nxt_addr_out  = dbg_insn[27:16];
            nxt_csr_wr    = 1'b1;
        end
    endcase
end

logic        apb_wr;
logic        dbgapb_wr;

assign apb_wr    = ~apb_intf.penable && apb_intf.psel && apb_intf.pwrite;
assign dbgapb_wr = dbg_en && apb_wr;

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        dbg_en <= 1'b0;
    end
    else if (apb_wr && apb_intf.paddr[11:0] == `DBGAPB_DBG_EN) begin
        dbg_en <= apb_intf.pwdata[0];
    end
end

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        dbg_insn <= 32'b0;
    end
    else if (dbgapb_wr && apb_intf.paddr[11:0] == `DBGAPB_INST) begin
        dbg_insn <= apb_intf.pwdata;
    end
end

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        dbg_insn_wr <= 1'b0;
    end
    else if (dbgapb_wr && apb_intf.paddr[11:0] == `DBGAPB_INST_WR) begin
        dbg_insn_wr <= 1'b1;
    end
    else begin
        dbg_insn_wr <= 1'b0;
    end
end

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        dbg_wdata <= `XLEN'b0;
    end
    else if (dbgapb_wr && apb_intf.paddr[11:0] == `DBGAPB_WDATA_L) begin
        dbg_wdata[ 0+:32] <= apb_intf.pwdata;
    end
`ifndef RV32
    else if (dbgapb_wr && apb_intf.paddr[11:0] == `DBGAPB_WDATA_H) begin
        dbg_wdata[32+:32] <= apb_intf.pwdata;
    end
`endif
end

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        dbg_wdata_wr <= 1'b0;
    end
    else if (dbgapb_wr && apb_intf.paddr[11:0] == `DBGAPB_WDATA_WR) begin
        dbg_wdata_wr <= 1'b1;
    end
    else begin
        dbg_wdata_wr <= 1'b0;
    end
end

logic [31:0] prdata_t;

always_comb begin
    prdata_t = 32'b0;
    case (apb_intf.paddr[11:0])
        `DBGAPB_DBG_EN  : prdata_t = {31'b0, dbg_en};
        `DBGAPB_INST    : prdata_t = dbg_insn;
        `DBGAPB_INST_WR : prdata_t = {31'b0, dbg_insn_wr};
        `DBGAPB_WDATA_L : prdata_t = dbg_wdata[ 0+:32];
`ifndef RV32
        `DBGAPB_WDATA_H : prdata_t = dbg_wdata[32+:32];
`endif
        `DBGAPB_WDATA_WR: prdata_t = {31'b0, dbg_wdata_wr};
        `DBGAPB_RDATA_L : prdata_t = dbg_rdata[ 0+:32];
`ifndef RV32
        `DBGAPB_RDATA_H : prdata_t = dbg_rdata[32+:32];
`endif
    endcase
end

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        apb_intf.prdata <= 32'b0;
    end
    else begin
        apb_intf.prdata <= dbg_en ? prdata_t : 32'b0;
    end
end

always_comb begin
    nxt_ready_cnt = 10'b0;
    case (apb_intf.paddr[11:0])
        `DBGAPB_INST_WR: begin
            case (dbg_insn[11:0])
                `INST_EXECUTE   : nxt_ready_cnt = 10'h5;
                `INST_STATUS_RD : nxt_ready_cnt = 10'h1;
                `INST_PC_RD     : nxt_ready_cnt = 10'h1;
                `INST_GPR_RD    : nxt_ready_cnt = 10'h1;
                `INST_CSR_RD    : nxt_ready_cnt = 10'h1;
                `INST_GPR_WR    : nxt_ready_cnt = 10'h1;
                `INST_CSR_WR    : nxt_ready_cnt = 10'h2;
            endcase
        end
    endcase
end

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        ready_cnt <= 10'b0;
    end
    else if (apb_wr) begin
        ready_cnt <= nxt_ready_cnt;
    end
    else if (|ready_cnt) begin
        ready_cnt <= ready_cnt - 10'b1;
    end
end

assign apb_intf.pslverr = 1'b0;
assign apb_intf.pready  = ~|ready_cnt;

endmodule
