/*
 * udiv8
 * 
 * An extremely crude way of performing division (subtract till it's done),
 * but it's *tiny*, so the miniscule performance penalty is worth it here.
 * 
 * params: r19 = dividend
 *         r17 = divisor
 * returns: r16 = result
 *          r19 = remainder
 * destroys: none
 */

#define _PARAM_DIVIDEND r19
#define _PARAM_DIVISOR r17
#define _RETURN_RESULT r16
#define _RETURN_REMAINDER r19

udiv8:
	// Init result to 0xFF (which will be turned to zero immediately)

	ldi _RETURN_RESULT, 0xFF

udiv8_loop:
	// Increment the result

	inc _RETURN_RESULT

	// Subtract the given dividend by the divisor - if the result overflows, we're done

	sub _PARAM_DIVIDEND, _PARAM_DIVISOR
	brcc udiv8_loop

	// The result overflown, so add the divisor back to the remainder to make it positive again

	add _RETURN_REMAINDER, _PARAM_DIVISOR
	ret

#undef _PARAM_DIVIDEND
#undef _PARAM_DIVISOR
#undef _RETURN_RESULT
#undef _RESULT_REMAINDER

/*
 * delay_ms
 * 
 * 1 ms sleep at 5 MHz, generated with http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html
 * 
 * params: r16 = ms (if 0 is pass, then it will actually wait for 256 ms)
 * returns: none
 * destroys: r16 (= 0)
 *           r17 (= 0)
 *           r18 (= 0)
 */
 
delay_ms:
    ldi r17, 7
    ldi r18, 125

delay_ms_loop:
	dec r18
    brne delay_ms_loop
    dec r17
    brne delay_ms_loop

	dec r16
	brne delay_ms
	ret

/*
 * slowsysclk
 * 
 * params: none
 * returns: none
 * destroys: r16 (= CLKCTRL_PDIV_64X_gc | CLKCTRL_PEN_bm)
 */

slowsysclk:
	set_protected CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_64X_gc | CLKCTRL_PEN_bm
	ret

/*
 * fastsysclk
 * 
 * params: none
 * returns: none
 * destroys: r16 (= CLKCTRL_PDIV_4X_gc | CLKCTRL_PEN_bm)
 */

fastsysclk:
	set_protected CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_4X_gc | CLKCTRL_PEN_bm
	ret

/*
 * write_eeur_byte
 * 
 * Might be inspired by avr-gcc's output.
 * 
 * params: r16 = data value
 *         r17 = EEPROM user row address (0-31)
 * returns: r17 incremented by 1
 * destroys: r16 (= NVMCTRL_CMD_PAGEERASEWRITE_gc)
 *           r18 (= *NVMCTRL_STATUS)
 *           Z (= NVMCTRL_base)
 */
/*
write_eeur_byte:
	ldz NVMCTRL_base

write_eeur_byte_wait_loop:
	// Wait until the NVM controller is ready

	ldd r18, Z+NVMCTRL_STATUS_offset
	sbrc r18, NVMCTRL_EEBUSY_bp
		rjmp write_eeur_byte_wait_loop

	// Write the byte

	ldi ZH, HIGH(USERROW_USERROW0)
	mov ZL, r17
	st Z, r16

	// Tell the NVM controller to write the byte

	set_protected NVMCTRL_CTRLA, NVMCTRL_CMD_PAGEERASEWRITE_gc

	// Increment the address for further writes

	inc r17
	ret
*/