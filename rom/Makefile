ELF_NAME := main

export CROSS_PREFIX ?= riscv64-unknown-elf-
export RISCV_GCC ?= $(CROSS_PREFIX)gcc
export RISCV_OBJDUMP ?= $(CROSS_PREFIX)objdump -xsd
export RISCV_OBJCOPY ?= $(CROSS_PREFIX)objcopy -O verilog

INCDIR  := ../include/
LDFILE  := link.ld
CFLAGS  := -O2 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -march=rv64imac_zifencei_zicsr -mabi=lp64 -I$(INCDIR)
LDFLAGS := -O2 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -march=rv64imac_zifencei_zicsr -mabi=lp64 -T$(LDFILE) -lgcc


SRC_C   := $(wildcard *.c)
OBJ_C   := $(patsubst %.c,%.o,$(SRC_C))
SRC_S   := $(wildcard *.S)
OBJ_S   := $(patsubst %.S,%.o,$(SRC_S))
DTS     := $(wildcard *.dts)
OBJ_DTS := $(patsubst %.dts,%.o,$(DTS))
SRC     := $(SRC_C) $(SRC_S)
OBJ     := $(OBJ_C) $(OBJ_S) $(OBJ_DTS)

ifneq ($(def),)
DEFINE  := -D$(subst +, -D,$(def))
else
DEFINE := 
endif

.SUFFIXES: .o .S .c

.PHONY: all

all: build_elf build_log build_hex

build_elf: $(OBJ) | $(LDFILE)
	$(RISCV_GCC) $^ $(LDFLAGS) -o $(ELF_NAME)

build_log: $(ELF_NAME)
	$(RISCV_OBJDUMP) $< > $(ELF_NAME).log

build_hex: $(ELF_NAME)
	$(RISCV_OBJCOPY) $< -i 4 -b 0 rom_0.hex
	$(RISCV_OBJCOPY) $< -i 4 -b 1 rom_1.hex
	$(RISCV_OBJCOPY) $< -i 4 -b 2 rom_2.hex
	$(RISCV_OBJCOPY) $< -i 4 -b 3 rom_3.hex
	$(CROSS_PREFIX)objcopy -O binary $< rom.bin

%.o: %.dts
	@dtc -I dts -O dtb $^ > tmp
	$(RISCV_OBJCOPY) -I binary -O elf64-littleriscv -B riscv:rv64 tmp $@

%.o: %.S
	$(RISCV_GCC) -c $(CFLAGS) $^ $(DEFINE)

%.o: %.c
	$(RISCV_GCC) -c $(CFLAGS) $^ $(DEFINE)

auto-format:
	@if [ "${SRC_H}" != "" ] || [ "${SRC_C}" != "" ] || [ "${SRC_CPP}" != "" ]; then \
	    clang-format -i ${SRC_H} ${SRC_C} ${SRC_CPP}; \
    fi

.PHONY: clean

clean:
	rm -rf $(ELF_NAME) $(ELF_NAME).log *.hex *.o .*.swp .*.swo
