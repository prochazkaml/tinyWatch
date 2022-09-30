/*
 * time_setup
 * 
 * params: none
 * returns: none
 * destroys: r16-r20, r24, r25, X, Y, Z (values don't even matter here)
 */

#define _PTR r20
#define _VAL r24
#define _MAX r25

time_setup:
	// Disable the RTC here
	
	mem_imm RTC_CTRLA, RTC_PRESCALER_DIV1_gc | RTC_RUNSTDBY_bm

	// Start from the "most significant" RTC value

	ldi _PTR, RTC_MONTH_OFFSET

time_setup_refresh:
	// Fetch our value

	ldi YH, HIGH(RTC_AREA_ADDR)
	mov YL, _PTR

	ld _VAL, Y

	// Fetch our max value

	ldd _MAX, Y+RTC_MAX_VAL_OFFSET

	// Draw the header

	ldi r16, EE_setuplist
	add r16, _PTR
	rcall init_menu_screen

	// Check if we are editing the month - uses strings from EEPROM

	ldi r16, EE_monthlist

	cpi _PTR, RTC_MONTH_OFFSET
	breq time_setup_draw_eeprom_string

	// Check if we are editing the weekday - uses strings from EEPROM as well

	ldi r16, EE_daylist

	cpi _PTR, RTC_WEEKDAY_OFFSET
	breq time_setup_draw_eeprom_string

	// We are drawing a number, set up the parameter

	mov r19, _VAL

	// Check if we are editing the day, as the param needs to be incremented by 1 in that case

	cpi _PTR, RTC_DAY_OFFSET
	brne time_setup_draw_not_day

	inc r19
	ldi _MAX, 31 // Override the max value from memory

time_setup_draw_not_day:
	ldi XL, ((128 - 32 + 3) / 2)
	ldi XH, 25
	rcall gfx_draw_big_number
	rjmp time_setup_draw_done

time_setup_draw_eeprom_string:
	// Add the current value to the pointer and draw the desired string

	add r16, _VAL
	ldi XH, 33
	rcall draw_eeprom_string_centered

time_setup_draw_done:
	rcall oled_refresh

	// Retreive the pointer again, it will be useful when changes occur

	ldi YH, HIGH(RTC_AREA_ADDR)
	mov YL, _PTR

time_setup_input_loop:
	// Check for user input

	rcall update_buttons

	sbrc BUTTONFIELD, 5
		rjmp time_setup_left_button_pressed

	sbrc BUTTONFIELD, 7
		rjmp time_setup_right_button_pressed

	// If the middle button is not pressed, check again

	sbrs BUTTONFIELD, 6
		rjmp time_setup_input_loop

	// Loop through all 6 (or how many) RTC parameters

	subi _PTR, 1
	brcc time_setup_refresh

	// Enable the RTC again & finish setup

	mem_imm RTC_CTRLA, RTC_PRESCALER_DIV1_gc | RTC_RTCEN_bm | RTC_RUNSTDBY_bm
	rjmp finish_setup_menu

// External jump destinations

time_setup_left_button_pressed:
	// Decrease the value and check if it has underflown

	subi _VAL, 1
	brcc time_setup_left_button_pressed_ok

	// Underflow did occur, so reset it to its max value - 1

	mov _VAL, _MAX
	dec _VAL

time_setup_left_button_pressed_ok:
	rjmp time_setup_update_value

time_setup_right_button_pressed:
	// Increase the value and check if it has overflown

	inc _VAL
	cp _VAL, _MAX
	brlo time_setup_right_button_pressed_ok

	// Overflow did occur, so reset it to 0

	clr _VAL

time_setup_right_button_pressed_ok:
time_setup_update_value:
	st Y, _VAL
	rjmp time_setup_refresh

#undef _PTR
#undef _VAL
#undef _MAX
