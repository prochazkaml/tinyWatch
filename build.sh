#!/bin/bash

[ $# -ne 2 ] && echo "Usage: $0 projectname mcu" && exit 1

avr-gcc -g -Os -mmcu=attiny1614 -c -o $1.o $1.c
avr-gcc -Os -mmcu=attiny1614 -o $1.elf crtattiny1614.o $1.o -Wl,--relax,--gc-sections -nostartfiles
#avr-objcopy -j .text -j .data -O binary $1.elf $1.bin
#sudo avrdude -U flash:w:$1.elf:e -c usbasp -p $2
if [ -f main.elf ]; then
	avr-size $1.elf
	avrdude -C avrdude.conf -c jtag2updi -p $2 -b 115200 -P /dev/ttyUSB0 -U flash:w:$1.elf:e
else
	echo "Sorry, but something went horribly wrong."
fi

# Dump .data: avr-objdump -s -j .data main.elf
# Dump .rodata: avr-objdump -s -j .rodata main.elf
# Disassemble: avr-objdump -S main.elf
