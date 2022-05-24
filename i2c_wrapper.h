#ifndef I2C_WRAPPER_H
#define I2C_WRAPPER_H

#define OLED_ADDR (0x3c << 1)

// https://www.avrfreaks.net/comment/2390341#comment-2390341

static inline void I2C_WRAPPER_init() {
	TWI0.MBAUD = 3;	        // set MBAUD register for 400kHz (?)
	TWI0.MCTRLA = 1 << TWI_ENABLE_bp			/* Enable TWI Master: enabled */
	| 0 << TWI_QCEN_bp					/* Quick Command Enable: disabled */
	| 0 << TWI_RIEN_bp					/* Read Interrupt Enable: disabled */
	| 1 << TWI_SMEN_bp					/* Smart Mode Enable: enabled */
	| TWI_TIMEOUT_DISABLED_gc				/* Bus Timeout Disabled */
	| 0 << TWI_WIEN_bp;					/* Write Interrupt Enable: disabled */

	TWI0.MCTRLB |= TWI_FLUSH_bm ;				/* Purge MADDR and MDATA */
	TWI0.MSTATUS |= TWI_BUSSTATE_IDLE_gc ;		        //Force TWI state machine into IDLE state
	TWI0.MSTATUS |= (TWI_RIF_bm | TWI_WIF_bm) ;
}

void I2C_WRAPPER_beginTransmission() {
	if ((TWI0.MSTATUS & TWI_BUSSTATE_gm) != TWI_BUSSTATE_BUSY_gc)		//Verify Bus is not busy
	{
		TWI0.MCTRLB &= ~(1 << TWI_ACKACT_bp);
		TWI0.MADDR = OLED_ADDR ;
		if (OLED_ADDR&0x01)	{while(!(TWI0.MSTATUS & TWI_RIF_bm));}  //si addressRead
		else			{while(!(TWI0.MSTATUS & TWI_WIF_bm));}  //si addressWrite
	}
}

void I2C_WRAPPER_write(unsigned char data) {
	if ((TWI0.MSTATUS&TWI_BUSSTATE_gm) == TWI_BUSSTATE_OWNER_gc)			                //Verify Master owns the bus
	{
		TWI0.MDATA = data;
		while (!((TWI0.MSTATUS & TWI_WIF_bm) | (TWI0.MSTATUS & TWI_RXACK_bm))) ;		//Wait until WIF set and RXACK cleared
	}
}

void I2C_WRAPPER_endTransmission() {
	TWI0.MCTRLB |= TWI_ACKACT_NACK_gc;
	TWI0.MCTRLB |= TWI_MCMD_STOP_gc;
}

#endif
