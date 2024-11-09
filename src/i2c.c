// https://www.avrfreaks.net/comment/2390341#comment-2390341

#include "i2c.h"
#include <stdint.h>
#include <avr/io.h>

void i2c_init() {
	// Set the I2C lines to inputs with internal pullups

	PORTB.DIRCLR = 0x03;
	PORTB.PIN0CTRL = PORT_PULLUPEN_bm;
	PORTB.PIN1CTRL = PORT_PULLUPEN_bm;

	// Around 266 kHz
	TWI0.MBAUD = 3;

	// Enable TWI Master & Smart Mode
	TWI0.MCTRLA = TWI_ENABLE_bm	| TWI_SMEN_bm;
	
	// Purge MADDR & MDATA
	TWI0.MCTRLB = TWI_FLUSH_bm;

	// Force TWI state machine into the IDLE state
	TWI0.MSTATUS = TWI_BUSSTATE_IDLE_gc;
	TWI0.MSTATUS = (TWI_RIF_bm | TWI_WIF_bm);
}

void i2c_deinit() {
	// Disable the I2C lines, drive them low

	PORTB.PIN0CTRL = 0;
	PORTB.PIN1CTRL = 0;

	PORTB.OUTCLR = 0x03;
	PORTB.DIRSET = 0x03;
}

void i2c_begin_transmission(uint8_t addr) {
	TWI0.MCTRLB &= ~TWI_ACKACT_bm;
	TWI0.MADDR = addr;

	while(!(TWI0.MSTATUS & TWI_WIF_bm));
}

void i2c_write_byte(uint8_t data) {
	TWI0.MDATA = data;

	while(!(TWI0.MSTATUS & (TWI_WIF_bm | TWI_RXACK_bm)));
}

void i2c_end_transmission() {
	TWI0.MCTRLB = TWI_ACKACT_NACK_gc | TWI_MCMD_STOP_gc;
}

