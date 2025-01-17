module mac_rmii_intf (
    // reset
    input                rstn,

    // RMII interface
    input                rmii_refclk,
    input                rmii_crsdv,
    input        [ 1:0]  rmii_rxd,
    output logic         rmii_txen,
    output logic [ 1:0]  rmii_txd,

    output logic         fifo_rx_wr,
    output logic [34:0]  fifo_rx_wdata,
    input                fifo_tx_empty,
    input                fifo_tx_nxt_empty,
    output logic         fifo_tx_rd,
    input        [34:0]  fifo_tx_rdata,

    output logic         rx_busy_o
);

logic        crsdv_d1;
logic        crsdv_d2;
logic [ 1:0] rxd_d1;
logic [31:0] rx_data;
logic        rx_data_nz;
logic        rx_cnt_rst;
logic [ 1:0] rx_cnt;
logic [ 1:0] rx_byte_cnt;
logic [ 1:0] rx_byte_cnt_latch;
logic        rx_crs;
logic        rx_crs_pre;
logic        rx_sfd;
logic        rx_buf_push;
logic        rx_buf_valid;
logic [31:0] rx_buf;
logic        rx_busy;

logic        rx_crc32_ctrl;
logic        rx_crc32_ctrl_d;
logic        rx_crc32_flag;
logic        rx_crc_valid;

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) begin
        crsdv_d1 <= 1'b0;
        crsdv_d2 <= 1'b0;
        rx_data  <= 32'b0;
    end
    else begin
        crsdv_d1 <= rmii_crsdv;
        crsdv_d2 <= crsdv_d1;
        rxd_d1   <= rmii_rxd;
        rx_data  <= {rxd_d1, rx_data[31:2]};
    end
end

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) begin
        rx_cnt <= 2'b0;
    end
    else begin
        if (rx_cnt_rst)
            rx_cnt <= 2'b0;
        else
            rx_cnt <= rx_cnt + 2'b1;
    end
end

assign rx_data_nz = |rx_data[31:30] && |rx_data[29:28] && |rx_data[27:26] && |rx_data[25:24];
assign rx_cnt_rst = (~rx_busy && crsdv_d2 && rx_data_nz) ||
                    ( rx_busy && ~rx_sfd && rx_cnt[0] && rx_data[31:24] == 8'hd5);
assign rx_busy_o  = rx_busy || rx_sfd;

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) rx_busy <= 1'b0;
    else begin
        if (~rx_busy) rx_busy <= crsdv_d2 && rx_data_nz;
        else          rx_busy <= crsdv_d2 || ~rx_cnt[0];
    end
end

assign rx_crs_pre = ~rx_busy || ~rx_cnt[0] ? crsdv_d2 : rx_crs;
always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) rx_crs <= 1'b0;
    else       rx_crs <= rx_crs_pre;
end

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) rx_sfd <= 1'b0;
    else       rx_sfd <= rx_sfd ? rx_busy || ~rx_buf_push : (rx_busy && rx_cnt[0] && rx_data[31:24] == 8'hd5);
end

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) rx_byte_cnt <= 2'b0;
    else       rx_byte_cnt <= ~rx_sfd ? 2'b0:
                                        rx_byte_cnt + {1'b0, rx_sfd && rx_cnt == 2'h3};
end

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) rx_byte_cnt_latch <= 2'b0;
    else       rx_byte_cnt_latch <= ~rx_sfd                          ? 2'b0:
                                    rx_byte_cnt_latch != rx_byte_cnt ? rx_byte_cnt_latch:
                                                                       rx_byte_cnt + {1'b0, rx_busy && rx_cnt == 2'h3};
end

assign rx_buf_push   = rx_sfd && rx_cnt == 2'h3 && rx_byte_cnt == 2'h3; 
always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn)            rx_buf_valid <= 1'b0;
    else if (!rx_sfd)     rx_buf_valid <= 1'b0;
    else if (rx_buf_push) rx_buf_valid <= 1'b1;
end
always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn)            rx_buf <= 32'b0;
    else if (rx_buf_push) rx_buf <= rx_data;
end

assign fifo_rx_wr           = rx_buf_push && rx_buf_valid;
assign fifo_rx_wdata[34:32] = {1'b0, rx_byte_cnt_latch} + {2'b0, rx_busy} | {3{!rx_busy && !rx_crc_valid}};
assign fifo_rx_wdata[31: 0] = rx_buf;

assign rx_crc32_ctrl = rx_sfd && rx_crs_pre;

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) rx_crc32_ctrl_d <= 1'b0;
    else       rx_crc32_ctrl_d <= rx_crc32_ctrl;
end

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) rx_crc_valid <= 1'b0;
    else begin
        if (!rx_crc32_ctrl && rx_crc32_ctrl_d)
            rx_crc_valid <= rx_crc32_flag;
    end
end

mac_crc32 u_rx_mac_crc32 (
    .clk   ( rmii_refclk    ),
    .rstn  ( rstn           ),
    .ctrl  ( rx_crc32_ctrl  ),
    .d_in  ( rx_data[31:30] ),
    .flag  ( rx_crc32_flag  )
);

// ============= TX =============

logic [5:0] tx_sfd_cnt;
logic       tx_cnt_rst;
logic [5:0] tx_cnt;
logic       tx_busy;
logic       tx_crc32_ctrl;
logic [4:0] tx_crc_cnt; 
logic [1:0] tx_crc32_out;
                        
logic       nxt_txen;   
logic [1:0] nxt_txd;    

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) tx_busy <= 1'b0;
    else begin
        if (~tx_busy) tx_busy <= nxt_txen;
        else          tx_busy <= &tx_cnt[3:0] ? !(tx_cnt[5] && fifo_tx_nxt_empty):
                                  tx_cnt[5]   ? fifo_tx_rdata[34:32] > tx_cnt[3:2] + {1'b0, &tx_cnt[1:0]}:
                                                tx_busy;
    end
end

assign tx_cnt_rst = ~nxt_txen;

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) begin
        tx_cnt <= 6'b0;
    end
    else begin
        if (tx_cnt_rst)
            tx_cnt <= 6'b0;
        else 
            tx_cnt <= (tx_cnt + 6'b1) | {tx_cnt[5], 5'b0};
    end
end

assign nxt_txen = /*!(crsdv_d1 || rx_crs) &&*/
                  ((rmii_txen && !fifo_tx_nxt_empty) || (!rmii_txen && !fifo_tx_empty)) || tx_busy;
assign nxt_txd  = ~nxt_txen    ? 2'b0:
                  tx_cnt[5]    ? fifo_tx_rdata[tx_cnt[3:0]*2+:2]:
                  &tx_cnt[4:0] ? 2'h3 : 2'h1;

assign fifo_tx_rd = nxt_txen ? &tx_cnt[3:0] && tx_cnt[5]:
                               |tx_cnt[3:2];

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) begin
        rmii_txen <= 1'b0;
        rmii_txd  <= 2'b0;
    end
    else begin
        rmii_txen <= nxt_txen | (|tx_crc_cnt);
        rmii_txd  <= nxt_txen ? nxt_txd : tx_crc32_out;
    end
end

always_ff @(posedge rmii_refclk or negedge rstn) begin
    if (~rstn) begin
        tx_crc_cnt <= 5'h10;
    end
    else begin
        if (nxt_txen) tx_crc_cnt <= 5'h10;
        else          tx_crc_cnt <= |tx_crc_cnt ? tx_crc_cnt - 5'b1 : tx_crc_cnt;
    end
end

assign tx_crc32_ctrl = nxt_txen & tx_cnt[5];

mac_crc32 u_tx_mac_crc32 (
    .clk   ( rmii_refclk   ),
    .rstn  ( rstn          ),
    .ctrl  ( tx_crc32_ctrl ),
    .d_in  ( nxt_txd       ),
    .d_out ( tx_crc32_out  )
);


endmodule
