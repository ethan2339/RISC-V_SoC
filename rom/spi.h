#ifndef __SPI_H__
#define __SPI_H__

#define __SPI_CR1_CPHA_BIT       ( 0)
#define __SPI_CR1_CPOL_BIT       ( 1)
#define __SPI_CR1_MSTR_BIT       ( 2)
#define __SPI_CR1_BR_BIT         ( 3)
#define __SPI_CR1_SPE_BIT        ( 6)
#define __SPI_CR1_LSBFIRST_BIT   ( 7)
#define __SPI_CR1_DFF_BIT        (11)
#define __SPI_CR1_DEL_BIT        (16)
#define __SPI_CR2_SSOE           ( 2)

#define __CS_DISABLE() do { *SPI_CR2_32P &= ~(1 << __SPI_CR2_SSOE); } while (0);
#define __CS_ENABLE()  do { *SPI_CR2_32P |=  (1 << __SPI_CR2_SSOE); } while (0);

#define __STAT_UNKNOWN 0
#define __STAT_NO_INIT 1
#define __STAT_INIT_OK 2

#define __SD_V1   0
#define __SD_MMC  1
#define __SD_SDSC 2
#define __SD_SDHC 3

#define __CMD0   0
#define __CMD8   8
#define __CMD16  16
#define __CMD17  17
#define __CMD55  55
#define __CMD58  58
#define __CMD59  59
#define __ACMD41 41

#define __DUMMY_DATA 0xff

#define DMA_TYPE_FIXED 0
#define DMA_TYPE_INCR  1
#define DMA_TYPE_CONST 2

#define DMA_SIZE_BYTE  0
#define DMA_SIZE_HWORD 1
#define DMA_SIZE_WORD  2
#define DMA_SIZE_DWORD 3 // no support

#define __dma_spi2buf(__BUFF__, __LEN__) do {                    \
    __dma_cfg(0xffffffff, (__U32) (__BUFF__), (__U32) (__LEN__), \
              0,                                                 \
              DMA_TYPE_CONST, DMA_TYPE_INCR,                     \
              DMA_SIZE_WORD, DMA_SIZE_WORD);                     \
    while (__dma_busy());                                        \
} while(0)

#define __dma_memcpy(__BUFF1__, __BUFF2__, __LEN__) do { \
    __dma_cfg((__U32) (__BUFF2__), (__U32) (__BUFF1__),  \
              (__U32) (__LEN__), 1,                      \
              DMA_TYPE_INCR, DMA_TYPE_INCR,              \
              DMA_SIZE_WORD, DMA_SIZE_WORD);             \
    while (__dma_busy());                                \
} while(0)

#define __dma_memfill(__BUFF1__, __BUFF2__, __LEN__) do { \
    __dma_cfg((__U32) (__BUFF2__), (__U32) (__BUFF1__),   \
              (__U32) (__LEN__), 1,                       \
              DMA_TYPE_CONST, DMA_TYPE_INCR,              \
              DMA_SIZE_WORD,  DMA_SIZE_WORD);             \
    while (__dma_busy());                                 \
} while(0)

void __dma_cfg(__U32 src, __U32 dest, __U32 len, __U8 spi_bypass,
               __U8 src_btype, __U8 dest_btype,
               __U8 src_size,  __U8 dest_size);
__U32 __dma_busy();
__U8 __spi_init(__U32 __br);
__U8 __spi_rwbyte(__U8 __byte);
__U8 __sd_getresp(__U8P buff, __U32 n);
__U8 __sd_sendcmd(__U8 cmd, __U32 arg, __U8 crc);
__U8 __sd_rcvdata(__U8P buff, __U32 size, __U8 release);
__U8 __sd_readblk(__U32 sector, __U8P buff);
__U8 __sd_init(__U8P __sd_type);

#endif
