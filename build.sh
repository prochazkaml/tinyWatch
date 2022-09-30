#!/bin/bash

mkdir -p build

cpp -P -nostdinc src/main.asm > build/main.asm
avra -l build/main.lst build/main.asm

if [ "$1" != "dry" ]; then
	avrdude -C avrdude.conf -c jtag2updi -p attiny1614 -b 115200 -P /dev/ttyUSB0 \
		-U flash:w:build/main.hex:i \
		-U eeprom:w:build/main.eep.hex:i
fi
