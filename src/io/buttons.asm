/*
 * update_buttons
 * 
 * params: none
 * returns: r5 = bit field, only bits 5-7 used (if set, the button was just pressed)
 * destroys: r16 (= 0)
 *           r17 (= 0)
 *           r18 (= 0)
 *           Z (= end of the button debounce buffer)
 */

#define _RAW_INPUT r16
#define _BIT_MASK r17
#define _DEBOUNCE_CTR r18

update_buttons:
	clr BUTTONFIELD
	ldz PRESSEDMATRIX_ADDR
	ldi _BIT_MASK, (1 << 5) // Bit mask

update_buttons_loop:
	// Pre-load the current debounce counter value, it is going to be useful later
	
	ld _DEBOUNCE_CTR, Z

	// Read from the I/O port & mask our requested bit off
	
	in _RAW_INPUT, VPORTA_IN
	and _RAW_INPUT, _BIT_MASK

	brne update_buttons_depressed

	// Is the button freshly pressed (i.e. has the debounce counter timed out)?

	cpi _DEBOUNCE_CTR, 0
	brne update_buttons_no_set_bit

	// It is freshly pressed!

	or BUTTONFIELD, _BIT_MASK

update_buttons_no_set_bit:
	// Reset the button debounce counter

	ldi _DEBOUNCE_CTR, 30

update_buttons_depressed:
	// Decrement this button's debounce counter value

	dec _DEBOUNCE_CTR

	// If the number has gone negative, reset it to 0

	sbrc _DEBOUNCE_CTR, 7
		clr _DEBOUNCE_CTR

	// Write the updated debounce counter

	st Z+, _DEBOUNCE_CTR

	// Shift to the next bit, loop until all 3 buttons have been processed

	lsl _BIT_MASK
	brne update_buttons_loop

	ldi r16, 1
	rjmp delay_ms

#undef _RAW_INPUT
#undef _BIT_MASK
#undef _DEBOUNCE_CTR
