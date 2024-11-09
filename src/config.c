#include "config.h"
#include <stdint.h>
#include <avr/io.h>
#include <avr/eeprom.h>

uint16_t config_read_rtc_calibration() {
	return USERROW.USERROW0 | (USERROW.USERROW1 << 8);
}

void config_save_rtc_calibration(uint16_t val) {
	eeprom_write_word((uint16_t *)(&USERROW.USERROW0 - 0x1400), val);
}

