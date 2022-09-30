/*
 * sprintf
 * 
 * An sprintf-like function. Who would have guessed?
 * 
 * Supported specifiers:
 *   0x01 = like %s - pointer to a string in memory (2 bytes)
 *   0x02 = like %d - 8-bit signed decimal number (1 byte)
 *   0x03 = like %s, but from EEPROM - pointer to the EEPROM's pointer table (1 byte)
 *   0x04 = like %c - character (1 byte)
 * 
 * The data specified by the specifiers is read sequentially from the SPRINTFINPUT_ADDR array.
 * 
 * params: Y = format string
 * returns: Z = pointer to the output buffer, ready for use with gfx_draw_string
 * destroys: Y (= end of the format string)
 *           r16 (= 0)
 *           r18 only if 0x01, 0x02 or 0x03 used (= undeterminate)
 *           r16, r17, r19 only if 0x02 used (r17 = 10, others undeterminate)
 */

#define _DATA r16
#define _CTR r18
#define _NUMBER r19
#define _DIVISOR r17
#define _DIV_REMAINDER r19
#define _DIV_RESULT r16

sprintf:
	push XL
	push XH

	ldx SPRINTFINPUT_ADDR

	// Point to the start of the string buffer

	ldz STRINGBUFFER_ADDR

sprintf_process_loop:
	// Read a byte

	ld _DATA, Y+

	// If the byte is a reserved specifier, process it accordingly

	cpi _DATA, 1
	breq sprintf_01

	cpi _DATA, 2
	breq sprintf_02

	cpi _DATA, 3
	breq sprintf_03

	cpi _DATA, 4
	breq sprintf_04

	// Not a specifier, output the byte as-is

sprintf_write_and_loop:
	st Z+, _DATA

	// Process the string until we hit the terminator

	cpi _DATA, 0
	brne sprintf_process_loop

	// Return the start of the string buffer for immediate use with gfx_draw_string

	ldz STRINGBUFFER_ADDR
	pop XH
	pop XL
	ret

sprintf_01:
	// %s - string from memory

	push YL
	push YH

	// Read the pointer

	ld YL, X+
	ld YH, X+

	// String length: max

	ldi _CTR, 0xFF

	// Copy the string (the following code is shared between the 0x01 and 0x03 specifiers)

sprintf_01_03_loop:
	ld _DATA, Y+

	// If we have reached a zero terminator, stop immediately

	cpi _DATA, 0
	breq sprintf_01_03_end

	st Z+, _DATA

	// Run until the counter reaches zero

	dec _CTR
	brne sprintf_01_03_loop

sprintf_01_03_end:
	pop YH
	pop YL
	rjmp sprintf_process_loop

sprintf_02:
	// %d - 8-bit signed number

	ld _NUMBER, X+

	// Is the number negative?

	sbrs _NUMBER, 7
		rjmp sprintf_02_already_positive

	// Write the minus sign and make the number positive

	ldi _DATA, '-'
	st Z+, _DATA

	neg _NUMBER

sprintf_02_already_positive:
	// Divide the number by 10 until the result is 0

	ldi _DIVISOR, 10
	ldi _CTR, 0

sprintf_02_conv_loop:
	rcall udiv8

	// Push the remainder onto the stack

	push _DIV_REMAINDER
	inc _CTR

	// If the result is 0, stop

	cpi _DIV_RESULT, 0
	breq sprintf_02_write_loop

	// Otherwise divide the result further

	mov _NUMBER, _DIV_RESULT
	rjmp sprintf_02_conv_loop

sprintf_02_write_loop:
	// Now write the results to the output string in reverse order

	pop _DATA
	addi _DATA, '0'
	st Z+, _DATA

	// Keep track of how many digits there are to process

	dec _CTR
	brne sprintf_02_write_loop

	rjmp sprintf_process_loop

sprintf_03:
	// %s - string from EEPROM

	push YL
	push YH

	// Get the pointer to the EEPROM pointer table

	ldi YH, HIGH(EEPROM_START)
	ld YL, X+

	// Load the actual string pointer from the pointer table

	ld _DATA, Y+
	ld _CTR, Y

	// EEPROM strings do not contain any terminators, so we have to specify the length

	mov YL, _DATA // String pointer (only need to modify the low byte, as the EEPROM only has 256 bytes)
	sub _CTR, _DATA // String length

	rjmp sprintf_01_03_loop

sprintf_04:
	// %c - read a character and write it

	ld _DATA, X+
	rjmp sprintf_write_and_loop

#undef _DATA
#undef _CTR
#undef _NUMBER
#undef _DIVISOR
#undef _DIV_REMAINDER
#undef _DIV_RESULT
