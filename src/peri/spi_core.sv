module spi_core(
    input               clk,
    input               rstn,
    apb_intf.slave      s_apb_intf,

    // SPI interface
    // inout               sclk,
    // inout               nss,
    // inout               mosi,
    // inout               miso
    output              sclk,
    output              nss,
    output              mosi,
    input               miso,

    // DMA signal
    axi_intf.master     m_axi_intf,

    // Interrupt
    output logic        irq_out
);

apb_intf spi_apb();
apb_intf dma_apb();

logic        spi_dff;
logic        dma_rxreq;
logic        dma_rxne;
logic [15:0] dma_rxbuff;
logic        dma_txreq;
logic        dma_txe;
logic [15:0] dma_txbuff;
logic        spi_irq;
logic        dma_irq;

assign irq_out = spi_irq | dma_irq;

spi_core_apb_conn u_spi_core_apb_conn (
    .spi_core_apb ( s_apb_intf     ),
    .spi_apb      ( spi_apb.master ),
    .dma_apb      ( dma_apb.master )
);

spi u_spi (
    .clk        ( clk           ),
    .rstn       ( rstn          ),
    .s_apb_intf ( spi_apb.slave ),

    // SPI interface
    .sclk       ( sclk          ),
    .nss        ( nss           ),
    .mosi       ( mosi          ),
    .miso       ( miso          ),

    // DMA signal
    .dma_rxreq  ( dma_rxreq     ),
    .dma_rxne   ( dma_rxne      ),
    .dma_rxbuff ( dma_rxbuff    ),
    .dma_txreq  ( dma_txreq     ),
    .dma_txe    ( dma_txe       ),
    .dma_txbuff ( dma_txbuff    ),

    .spi_dff    ( spi_dff       ),

    // Interrupt
    .irq_out    ( spi_irq       )
);

dma u_dma (
    .clk        ( clk           ),
    .rstn       ( rstn          ),
                               
    .spi_dff    ( spi_dff       ),

    .dma_rxreq  ( dma_rxreq     ),
    .dma_rxne   ( dma_rxne      ),
    .dma_rxbuff ( dma_rxbuff    ),
    .dma_txreq  ( dma_txreq     ),
    .dma_txe    ( dma_txe       ),
    .dma_txbuff ( dma_txbuff    ),
    
    .irq_out    ( dma_irq       ),
                               
    .m_axi_intf ( m_axi_intf    ),
    .s_apb_intf ( dma_apb.slave )
);

endmodule
