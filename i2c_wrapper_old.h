#ifndef I2C_WRAPPER_H
#define I2C_WRAPPER_H

#define OLED_ADDR (0x3c << 1)

#define TWI0_BAUD(F_SCL) ((((float)F_CPU / (float)F_SCL)) - 10 )

// https://www.avrfreaks.net/comment/2390341#comment-2390341

static inline void I2C_WRAPPER_init() {
	PORTB.PIN0CTRL = PORT_PULLUPEN_bm;
	PORTB.PIN1CTRL = PORT_PULLUPEN_bm;
	
	TWI0.MBAUD = 17;	// Probably 400 kHz
	TWI0.MCTRLB = 0;
	TWI0.MCTRLA = TWI_ENABLE_bm;					// TWI Enabled
	TWI0.MSTATUS = TWI_BUSSTATE_IDLE_gc;           // Set the BUS state to idle}
}

void I2C_WRAPPER_beginTransmission() {
	while((TWI0.MSTATUS & TWI_BUSSTATE_gm) == TWI_BUSSTATE_BUSY_gc);

	TWI0.MADDR = OLED_ADDR;
}

void I2C_WRAPPER_write(unsigned char data) {
	while ((TWI0.MSTATUS&TWI_BUSSTATE_gm) != TWI_BUSSTATE_OWNER_gc);

	TWI0.MDATA = data;
	while(!(TWI0.MSTATUS&TWI_WIF_bm) | (TWI0.MSTATUS&TWI_RXACK_bm)) ;		//Wait until WIF set and RXACK cleared
}

void I2C_WRAPPER_endTransmission() {
	TWI0.MCTRLB = TWI_MCMD_STOP_gc;
}

#endif
