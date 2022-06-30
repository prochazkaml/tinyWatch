#!/bin/bash

avr-gcc -Os -mmcu=attiny1614 -c -o main.o main.c
avr-gcc -Os -mmcu=attiny1614 -o main.elf crtattiny1614.o main.o -Wl,-Tavrxmega3.x -Wl,--relax,--gc-sections -nostartfiles

if [ -f main.elf ]; then
	avr-size main.elf
	avrdude -C avrdude.conf -c jtag2updi -p attiny1614 -b 115200 -P /dev/ttyUSB0 -U flash:w:main.elf:e
else
	echo "Sorry, but something went horribly wrong."
fi

# Dump .data: avr-objdump -s -j .data main.elf
# Dump .rodata: avr-objdump -s -j .rodata main.elf
# List symbols: avr-objdump -t main.elf
# Disassemble: avr-objdump -S main.elf
