/*
 * calibration_setup
 * 
 * params: none
 * returns: none
 * destroys: r0, r1, r14-r20, r24, r25, X, Y, Z (values don't even matter here)
 */

#define _CURSOR r20
#define _VAL_L r14
#define _VAL_H r15
#define _TMP_L r24
#define _TMP_H r25

calibration_setup:
	// Set up the on-screen cursor

	clr _CURSOR
	cbi STATUS_IO_REG, STATUS_BIT_CURSOR_SELECTED

	// Load the value

	lds _VAL_L, RTC_PERL
	lds _VAL_H, RTC_PERH

calibration_setup_refresh:
	// Draw the header

	ldi r16, EE_misc + 1
	rcall init_menu_screen

	// Draw the 4-digit hex value

	ldi ZL, 4

	ldi XL, 64 - 5 * 4 - 3
	ldi XH, 33

	clr r19

calibration_setup_refresh_digit_loop:
	// Get the digit from _VAL
	
	rcall calibsetup_extract_digit

	// Draw the shifted digit as hex

	ldi YH, HIGH(EEPROM_START)
	mov YL, r16 // Automatically points to the hex digit list

	ld r16, Y

	push XL
	rcall gfx_draw_char
	pop XL
	addi XL, 5

	inc r19
	cpi r19, 4
	brne calibration_setup_refresh_digit_loop

	// Draw the "Done" button

	ldi r16, EE_misc + 2
	ldi XL, 64 + 3
	push XL
	rcall draw_eeprom_string
	pop XL

	// Prepare for drawing the cursor

	ldi XH, 33+9

	rcall calibsetup_draw_cursor

	// Draw the top cursor if it is active

	ldi XH, 33-3

	sbic STATUS_IO_REG, STATUS_BIT_CURSOR_SELECTED
		rcall calibsetup_draw_cursor

	rcall oled_refresh

calibration_setup_input_loop:
	// Check for user input

	rcall update_buttons

	sbrc BUTTONFIELD, 5
		rjmp calibration_setup_left_button_pressed

	sbrc BUTTONFIELD, 7
		rjmp calibration_setup_right_button_pressed

	// If the middle button is not pressed, check again

	sbrs BUTTONFIELD, 6
		rjmp calibration_setup_input_loop

	// If the cursor is under the "Done" button, exit

	cpi _CURSOR, 4
	breq calibration_setup_exit

	// Otherwise invert the selection

	in r16, STATUS_IO_REG
	ldi r17, 1 << STATUS_BIT_CURSOR_SELECTED
	eor r16, r17
	out STATUS_IO_REG, r16

	rjmp calibration_setup_refresh

calibration_setup_left_button_pressed:
	// If a digit is selected, then decrement the current digit

	sbic STATUS_IO_REG, STATUS_BIT_CURSOR_SELECTED
		rjmp calibration_setup_decrement_digit

	// Otherwise decrement the cursor position

	subi _CURSOR, 1
	brcc calibration_setup_refresh

	ldi _CURSOR, 4
	rjmp calibration_setup_refresh

calibration_setup_decrement_digit:
	// Extract the digit

	mov r19, _CURSOR
	rcall calibsetup_extract_digit

	// Decrement the digit

	dec r16
	sbrc r16, 7 // Overflow = last bit set
		ldi r16, 15

	// Write the digit back

	rcall calibsetup_write_digit
	rjmp calibration_setup_refresh

calibration_setup_right_button_pressed:
	// If a digit is selected, then increment the current digit

	sbic STATUS_IO_REG, STATUS_BIT_CURSOR_SELECTED
		rjmp calibration_setup_increment_digit

	// Otherwise increment the cursor position

	inc _CURSOR
	cpi _CURSOR, 5
	brne calibration_setup_refresh

	clr _CURSOR
	rjmp calibration_setup_refresh

calibration_setup_increment_digit:
	// Extract the digit

	mov r19, _CURSOR
	rcall calibsetup_extract_digit

	// Increment the digit

	inc r16
	sbrc r16, 4 // Overflow = bit 4 set (0x10)
		clr r16

	// Write the digit back

	rcall calibsetup_write_digit
	rjmp calibration_setup_refresh

calibration_setup_exit:
/*	mov r16, _VAL_L
	ldi r17, EEUR_OSC_CALIB_L
	rcall write_eeur_byte

	mov r16, _VAL_H
	rcall write_eeur_byte*/

	sts RTC_PERL, _VAL_L
	sts RTC_PERH, _VAL_H

	rjmp finish_setup_menu

// Subroutine for drawing the cursor (input: _CURSOR, XH for Y coordinate)

calibsetup_draw_cursor:
	// Check if the cursor is under the "Done" button

	cpi _CURSOR, 4
	brne calibsetup_draw_cursor_digit

	// If so, draw a line under it using the coordinates from before

	ldi r16, 4 * 4 + 3
	rjmp gfx_draw_horiz_line

calibsetup_draw_cursor_digit:
	// Draw a cursor under the digit

	ldi XL, 64 - 5 * 4 - 3

	// Calculate the correct cursor position

	ldi r16, 5
	mul r16, _CURSOR

	// Add the result back to the X coordinate & draw the cursor

	add XL, r0
	ldi r16, 4
	rjmp gfx_draw_horiz_line

// Subroutine for extracting a hex digit from _VAL (input: _VAL, r19 = digit position (0-3); output: r16)

calibsetup_extract_digit:
	push r19
	inc r19
	movw _TMP_L, _VAL_L

calibsetup_extract_digit_select_loop:
	// Shift 4 bits from _TMP's top onto r16
	
	ldi r17, 4
	clr r16

calibsetup_extract_digit_shift_loop:
	lsl _TMP_L
	rol _TMP_H

	rol r16

	dec r17
	brne calibsetup_extract_digit_shift_loop

	dec r19
	brne calibsetup_extract_digit_select_loop

	pop r19
	ret

// Subroutine for writing a hex digit to _VAL (input _VAL, r16 = digit, r19 = digit position (0-3))

calibsetup_write_digit:
	swap r16 // We want to shift bits from the top
	clr r18
	clr _TMP_L
	clr _TMP_H

calibsetup_write_digit_select_loop:
	ldi r17, 4

calibsetup_write_digit_shift_loop:
	// Shift the original value's top bit

	lsl _VAL_L
	rol _VAL_H

	// If this is our desired digit, replace the bit with our own

	cpse r18, r19
		rjmp calibsetup_write_digit_no_replace

	rol r16

calibsetup_write_digit_no_replace:
	// Shift the bit onto the bottom of the destination value

	rol _TMP_L
	rol _TMP_H

	dec r17
	brne calibsetup_write_digit_shift_loop

	// Repeat all of the 4 digits

	inc r18
	cpi r18, 4
	brne calibsetup_write_digit_select_loop

	movw _VAL_L, _TMP_L
	ret

#undef _CURSOR
#undef _VAL_L
#undef _VAL_H
#undef _TMP_L
#undef _TMP_H
