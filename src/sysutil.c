#include "sysutil.h"
#include <stdint.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <util/delay.h>

#if REVISION == 1001
	#warning You probably do not have revision 1001. It was only used during the development of revision 2.
#endif

void sys_delay(uint8_t ms) {
	while(ms--) {
		_delay_us(997); // 2 bytes smaller than _delay_ms(1) :)
	}
}

void sys_cpu_clock_fast() {
	PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_4X_gc | CLKCTRL_PEN_bm);
}

void sys_cpu_clock_slow() {
	PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_64X_gc | CLKCTRL_PEN_bm);
}

void sys_init() {
	// Set correct interrupt location

	PROTECTED_WRITE(CPUINT_CTRLA, CPUINT_IVSEL_bm);

	// Set pullups on all pins, otherwise they will oscillate → consume power

	VPORTA_DIR = 0;
	VPORTB_DIR = 0;

	for(uint8_t i = 0; i < 8; i++) {
		*(&PORTA_PIN0CTRL + i) = PORT_PULLUPEN_bm;
		*(&PORTB_PIN0CTRL + i) = PORT_PULLUPEN_bm;
	}
}

void sys_sleep() {
	// Enter standby mode

	SLPCTRL.CTRLA = SLPCTRL_SEN_bm | SLPCTRL_SMODE_STDBY_gc;
	sleep_cpu();
}

char nibble_to_hex(uint8_t nibble) {
	if(nibble < 10) return nibble + '0';

	return nibble + 'A' - 10;
}

const uint8_t month_lengths[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

uint8_t get_month_length(uint8_t month, uint8_t year) {
	if(month < 0 || month > 11) return 0;

	uint8_t retval = month_lengths[month];

	if(month != 1) return retval;

	if(!(year & 3)) retval++;

	return retval;
}

