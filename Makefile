PROJ_NAME = syscon

BUILD_DIR = build

HW_REV_FILE = $(BUILD_DIR)/rev
HW_REV_FILE_CONTENTS = $(shell cat $(HW_REV_FILE) 2>/dev/null || echo "0")

C_SRC_DIR = src
C_BUILD_DIR = $(BUILD_DIR)/obj
C_SOURCES = $(sort $(shell find $(C_SRC_DIR) -name '*.c'))
C_HEADERS = $(sort $(shell find $(C_SRC_DIR) -name '*.h'))
C_OBJECTS = $(patsubst $(C_SRC_DIR)/%.c,$(C_BUILD_DIR)/%.o,$(C_SOURCES))

ELF_NAME = $(BUILD_DIR)/$(PROJ_NAME).elf

ARCH_PREFIX = avr

CC = $(ARCH_PREFIX)-gcc
LD = $(ARCH_PREFIX)-ld
OBJCOPY = $(ARCH_PREFIX)-objcopy
SIZE = $(ARCH_PREFIX)-size

CC_FLAGS = -Os -mmcu=attiny1614 -DREVISION=$(REVISION) -DF_CPU=20000000/4 -flto -mrelax -g
LINK_FLAGS = -Os -mmcu=attiny1614 -flto -mrelax -g -Wl,--gc-sections

check_rev: 
	@[ "${REVISION}" ] || ( echo "REVISION is not set"; exit 1 )
	@mkdir -p $(BUILD_DIR)

	@if [ "$(REVISION)" -ne "$(HW_REV_FILE_CONTENTS)" ]; then echo -n "$(REVISION)" > $(HW_REV_FILE); fi

all: check_rev .WAIT $(ELF_NAME)

$(C_BUILD_DIR)/%.o: $(C_SRC_DIR)/%.c Makefile $(C_HEADERS) $(HW_REV_FILE)
	@mkdir -p $(@D)
	@echo cc $@
	@$(CC) $(CC_FLAGS) -Isrc/c -c $< -o $@

$(ELF_NAME): $(C_OBJECTS)
	@echo cc $@
	@$(CC) $(LINK_FLAGS) $^ $(LINK_LIBS) -o $@
	@$(SIZE) $@

clean:
	rm -rf $(BUILD_DIR)

run: $(ELF_NAME)
	@echo avrdude $(ELF_NAME)
	@avrdude -c serialupdi -P /dev/ttyUSB0 -p attiny1614 -U flash:w:$<:e

.PHONY: clean check_rev

