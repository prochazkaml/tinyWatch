#define OLED_ADDR (0x3C << 1)

#define oled_init_sequence_length 34
oled_init_sequence:
	.db 0xAE, 0xD5, 0x80, 0xA8, 64 - 1, 0xD3, 0x00, 0x40 | 0, 0x8D, 0x14, 0x20, 0x00, 0xA0 | 0, 0xC0, 0xDA, 0x12, 0x81, 0xCF, 0xD9, 0xF1, 0xDB, 0x40, 0xA4, 0xA6, 0x2E, 0xAF, 0x20, 0x0, 0x21, 0, 127, 0x22, 0, 7

/*
 * macro_init_i2c
 * 
 * params: none
 * returns: none
 * destroys: r16 (= TWI_RIF_bm | TWI_WIF_bm)
 */

.macro macro_init_i2c
	mem_imm TWI0_MBAUD, 3
	mem_imm TWI0_MCTRLA, TWI_ENABLE_bm | TWI_SMEN_bm
	mem_imm TWI0_MCTRLB, TWI_FLUSH_bm

	mem_imm TWI0_MSTATUS, TWI_BUSSTATE_IDLE_gc
	mem_imm TWI0_MSTATUS, TWI_RIF_bm | TWI_WIF_bm
.endmacro

/*
 * i2c_begin_transmission
 * 
 * params: none
 * returns: none
 * destroys: r16 (= *TWI0_MSTATUS)
 */

i2c_begin_transmission:
//	mem_clrbits TWI0_MCTRLB, TWI_ACKACT_bm
	mem_imm TWI0_MADDR, OLED_ADDR

i2c_begin_transmission_loop:
	mem_wait_bits_clr TWI0_MSTATUS, TWI_WIF_bm, i2c_begin_transmission_loop
	ret

/*
 * i2c_write
 * 
 * params: r16 = data
 * returns: none
 * destroys: r16 (= *TWI0_MSTATUS)
 */

#define _PARAM_DATA r16

i2c_write:
	sts TWI0_MDATA, _PARAM_DATA

i2c_write_loop:
	mem_wait_bits_clr TWI0_MSTATUS, TWI_WIF_bm | TWI_RXACK_bm, i2c_write_loop
	ret

#undef _PARAM_DATA

/*
 * macro_i2c_end_transmission
 * 
 * params: none
 * returns: none
 * destroys: r16 (= TWI_ACKACT_NACK_gc | TWI_MCMD_STOP_gc)
 */

.macro macro_i2c_end_transmission
	mem_imm TWI0_MCTRLB, TWI_ACKACT_NACK_gc | TWI_MCMD_STOP_gc
.endmacro

/*
 * macro_init_oled
 * 
 * params: none
 * returns: none
 * destroys: r16 (= last byte of the init sequence)
 *           r17 (= 0)
 *           X (= pointer after the last byte of the init sequence)
 */

#define _DATA r16
#define _CTR r17

.macro macro_init_oled
	ldi _CTR, oled_init_sequence_length
	ldx PGM(oled_init_sequence)

oled_transfer_setup_bytes_loop:
	rcall i2c_begin_transmission

	ldi _DATA, 0x80
	rcall i2c_write

	ld _DATA, X+
	rcall i2c_write
	
	macro_i2c_end_transmission

	dec _CTR
	brne oled_transfer_setup_bytes_loop
.endmacro

#undef _DATA
#undef _CTR

/*
 * oled_refresh
 * 
 * params: none
 * returns: none
 * destroys: r16 (= TWI_ACKACT_NACK_gc | TWI_MCMD_STOP_gc)
 *           r17 (= 0)
 *           X (= 0x3C00)
 */

#define _DATA r16
#define _CTR r17

oled_refresh:
	// Start the copy (64x 16-byte chunks)

	movw XL, FRAMEBUFFER_L

oled_refresh_outer_loop:
	rcall i2c_begin_transmission

	ldi _DATA, 0x40			// OLED data write commmand
	rcall i2c_write

	ldi _CTR, 16

oled_refresh_inner_loop:
	ld _DATA, X				// Read a byte from the buffer...
	st X+, ZERO				// ...and clear it
	rcall i2c_write

	dec _CTR
	brne oled_refresh_inner_loop

	macro_i2c_end_transmission

	cpi XH, HIGH(FRAMEBUFFER_ADDR + 1024)
	brne oled_refresh_outer_loop

	ret

#undef _DATA
#undef _CTR
