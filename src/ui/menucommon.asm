/*
 * init_menu_screen
 * 
 * params: r16 = pointer to EEPROM pointer table
 * returns: none
 * destroys: r16, r17, r18, X, Y, Z
 */

#define _EEPROM_PTR r16

init_menu_screen:
	// Draw the title string

	ldi XH, 0
	rcall draw_eeprom_string_centered

	// Draw the line below the title

	ldi XL, 0
	ldi XH, 9
	ldi r16, 0x80
	rjmp gfx_draw_horiz_line

#undef _EEPROM_PTR

/*
 * draw_eeprom_string_centered
 * 
 * params: r16 = pointer to EEPROM pointer table
 *         XH = Y position
 * returns: none
 * destroys: r16, r17, r18, XL, Y, Z
 */

draw_eeprom_string_centered:
	ldi XL, DRAWSTRING_CENTER_ALIGN

	// Fall right into the next function

/*
 * draw_eeprom_string
 * 
 * params: r16 = pointer to EEPROM pointer table
 *         XL = X position
 *         XH = Y position
 * returns: none
 * destroys: r16, r17, r18, XL, Y, Z
 */

#define _EEPROM_PTR r16

draw_eeprom_string:
	ldy SPRINTFINPUT_ADDR
	st Y, _EEPROM_PTR

	ldy PGM(draw_eeprom_string_fmt)
	rcall sprintf

	rjmp gfx_draw_string

draw_eeprom_string_fmt: .db 3, 0 // Read string from EEPROM

#undef _EEPROM_PTR

/*
 * finish_setup_menu
 * 
 * params: none
 * returns: none
 * destroys: r16
 */

finish_setup_menu:
	// Reset the RTC CNT register

	sts RTC_CNTL, ZERO
	sts RTC_CNTH, ZERO

	// Force a screen clock update

	sbi STATUS_IO_REG, STATUS_BIT_CLOCK_UPDATED

	// Reset the wake up timeout

	ldi WAKEUPTIMEOUT, WUT_MAXTIMEOUT
	
	ret

/*
 * check_if_pressed
 * 
 * params: r16 = button combinations to check (bits 5, 6, 7)
 * returns: none
 * destroys: r16, r17, r18 (values undeterminate)
 */

#define _REQUESTED_BUTTONS r16
#define _BUTT_FIELD r17

check_if_pressed:
	// Check if all of the requested buttons are pressed
	
	in _BUTT_FIELD, VPORTA_IN
	and _BUTT_FIELD, _REQUESTED_BUTTONS

	// All bits must be low to continue

	breq check_if_pressed_true

	// Some/all of the requested buttons are not pressed, exit

	cbi STATUS_IO_REG, STATUS_BIT_KEY_COMBO_MATCH
	ret

check_if_pressed_true:
	// Condition was met, wait until all of the buttons are released

	in _BUTT_FIELD, VPORTA_IN
	and _BUTT_FIELD, _REQUESTED_BUTTONS
	cp _BUTT_FIELD, _REQUESTED_BUTTONS
	brne check_if_pressed_true

	// Wait for a bit (debounce reasons)

	ldi r16, 200 / 16
	rcall delay_ms

	// Enable the fast system clock & indicate that the condition was met

	sbi STATUS_IO_REG, STATUS_BIT_KEY_COMBO_MATCH
	rjmp fastsysclk

#undef _REQUESTED_BUTTONS
#undef _BUTT_MATRIX
