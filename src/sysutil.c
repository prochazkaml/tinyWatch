#include "sysutil.h"
#include <stdint.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <util/delay.h>

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

