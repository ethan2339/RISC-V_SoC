module ifu (
    input                             clk,
    input                             rstn,
    input        [       `XLEN - 1:0] bootvec,

    input                             ic_flush,

    // Extension flag
    input                             misa_c_ext,
    input        [               1:0] misa_mxl,

    // Branch
    input                             irq_en,
    input        [`IM_ADDR_LEN - 1:0] irq_vec,
    input                             eret_en,
    input        [`IM_ADDR_LEN - 1:0] ret_epc,
    input                             pc_jump_en,
    input        [`IM_ADDR_LEN - 1:0] pc_jump,
    input                             pc_alu_en,
    input        [`IM_ADDR_LEN - 1:0] pc_alu,
    input                             pipe_restart_en,
    input        [`IM_ADDR_LEN - 1:0] pipe_restart,
    output logic                      id_jump_fault,
    output logic                      exe_jump_fault,
    output logic                      jump_token,

    // Insn Memory
    output logic                      imem_req,
    output logic [`IM_ADDR_LEN - 1:0] imem_addr,
    input        [       `XLEN - 1:0] imem_rdata,
    input        [               1:0] imem_bad,
    input                             imem_busy,

    input        [`IM_ADDR_LEN - 1:0] id_pc,
    input        [`IM_ADDR_LEN - 1:0] exe_pc,
    output logic [`IM_ADDR_LEN - 1:0] pc,
    output logic [`IM_DATA_LEN - 1:0] insn,
    output logic                      insn_valid,
    output logic [`IM_ADDR_LEN - 1:0] misaligned_epc,
    output logic                      misaligned,
    output logic                      page_fault,
    output logic                      xes_fault,
    output logic [`IM_ADDR_LEN - 1:0] badaddr,
    input                             flush,
    input                             stall,
    input                             attach,
    input                             dbg_exec,
    input        [`IM_DATA_LEN - 1:0] dbg_insn
);

logic                      jump_in_id;
logic                      jump_in_exe;
logic                      jump_in_mr;
logic                      jump;
logic [`IM_ADDR_LEN - 1:0] jump_addr;
logic [`IM_ADDR_LEN - 1:0] jump_addr_post;
logic [`IM_ADDR_LEN - 1:0] pc_nxt;
logic [`IM_ADDR_LEN - 1:0] insn_len;
logic                      insn_latch_valid;
logic [`IM_DATA_LEN - 1:0] insn_latch;
logic [               1:0] bad_latch;
logic                      imem_req_latch;
logic                      ifu_req_tmp;
logic                      misaligned_tmp;

logic                      pfu_pop;
logic [  `IM_ADDR_LEN-1:0] pfu_pc;
logic [  `IM_DATA_LEN-1:0] pfu_insn;
logic [               1:0] pfu_bad;
logic [  `IM_ADDR_LEN-1:0] pfu_badaddr;
logic                      pfu_empty;

assign jump_in_id  = pc_jump_en;
assign jump_in_exe = irq_en | pc_alu_en | eret_en;
assign jump_in_mr  = pipe_restart_en;
assign jump        = jump_in_id | jump_in_exe | jump_in_mr;
assign jump_addr   = pipe_restart_en ? pipe_restart:
                     eret_en         ? {ret_epc[`IM_ADDR_LEN-1:2], ret_epc[1] & misa_c_ext, 1'b0}:
                     irq_en          ? {irq_vec[`IM_ADDR_LEN-1:1], 1'b0}:
                     pc_alu_en       ? {pc_alu [`IM_ADDR_LEN-1:1], 1'b0}:
                                       {pc_jump[`IM_ADDR_LEN-1:1], 1'b0};

`ifdef RV32
assign jump_addr_post = jump_addr;
`else
assign jump_addr_post = {`IM_ADDR_LEN{misa_mxl == `MISA_MXL_XLEN_32}} & {{32{jump_addr[31]}}, jump_addr[0+:32]}|
                        {`IM_ADDR_LEN{misa_mxl == `MISA_MXL_XLEN_64}} & jump_addr;
`endif

// avoid for jar misaligned and write rd
assign id_jump_fault  = jump_in_id  & pc_jump[1] & ~misa_c_ext;
assign exe_jump_fault = pc_alu_en   & pc_alu[1]  & ~misa_c_ext;

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        misaligned_epc <= {`IM_ADDR_LEN{1'b0}};
    end
    else begin
        if (jump_in_exe) begin
            misaligned_epc <= exe_pc;
        end
        else if (jump_in_id) begin
            misaligned_epc <= id_pc;
        end
    end
end

always_ff @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        misaligned <= 1'b0;
    end
    else begin
        misaligned <= misaligned_tmp && jump;
    end
end

assign misaligned_tmp = jump_addr[1] && ~misa_c_ext;

assign pfu_pop        = ~stall & ~attach;

assign insn_valid     = attach ? dbg_exec :
                                 (pfu_pop && ~pfu_empty) || misaligned;

assign insn           = attach ? dbg_insn:
                                 pfu_insn;

assign pc             = pfu_pc;

assign {xes_fault, page_fault} = pfu_bad;
assign badaddr                 = misaligned ? pfu_pc : pfu_badaddr;

pfu u_pfu (
    .clk           ( clk                         ),
    .rstn          ( rstn                        ),
    .bootvec       ( bootvec                     ),
    .flush         ( ic_flush | eret_en | irq_en ),
    .jump          ( jump                        ),
    .jump_addr     ( jump_addr_post              ),
    .pop           ( pfu_pop                     ),
    .jump_token    ( jump_token                  ),
    .pc            ( pfu_pc                      ),
    .insn          ( pfu_insn                    ),
    .bad           ( pfu_bad                     ),
    .badaddr       ( pfu_badaddr                 ),
    .empty         ( pfu_empty                   ),

    // insn Memory
    .imem_req      ( imem_req                    ),
    .imem_addr     ( imem_addr                   ),
    .imem_rdata    ( imem_rdata                  ),
    .imem_bad      ( imem_bad                    ),
    .imem_busy     ( imem_busy                   ),
    
    // for btb
    .btb_wr        ( pc_jump_en                  ),
    .btb_addr_in   ( id_pc                       ),
    .btb_target_in ( pc_jump                     )
);

endmodule
