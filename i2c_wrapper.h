#ifndef I2C_WRAPPER_H
#define I2C_WRAPPER_H

#define OLED_ADDR (0x3c << 1)

// https://www.avrfreaks.net/comment/2390341#comment-2390341

static inline void I2C_WRAPPER_init() {
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

void I2C_WRAPPER_beginTransmission() {
	TWI0.MCTRLB &= ~TWI_ACKACT_bm;
	TWI0.MADDR = OLED_ADDR;

	while(!(TWI0.MSTATUS & TWI_WIF_bm));
}

void I2C_WRAPPER_write(unsigned char data) {
	TWI0.MDATA = data;

	while(!(TWI0.MSTATUS & (TWI_WIF_bm | TWI_RXACK_bm)));
}

static inline void I2C_WRAPPER_endTransmission() {
	TWI0.MCTRLB = TWI_ACKACT_NACK_gc | TWI_MCMD_STOP_gc;
}

#endif
