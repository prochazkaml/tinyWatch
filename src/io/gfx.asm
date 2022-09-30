/*
 * gfx_set_pixel
 * 
 * params: XL = X position
 *         XH = Y position
 * returns: none
 * destroys: none
 */

#define _PARAM_X_POS XL
#define _PARAM_Y_POS XH
#define _SHIFTED_BIT r17
#define _SHIFT_CTR r16
#define _DATA r16

gfx_set_pixel:
	push ZL
	push ZH

	push _SHIFT_CTR
	push _SHIFTED_BIT

	// Z = buffer + (((y & 0x38) << 4) | x);

	mov ZL, _PARAM_Y_POS
	mov ZH, _PARAM_Y_POS

	swap ZL
	swap ZH

	andi ZL, 0x80
	andi ZH, 0x03

	or ZL, _PARAM_X_POS

	add ZL, FRAMEBUFFER_L
	adc ZH, FRAMEBUFFER_H

	// Get a single bit shifted to the right position

	mov _SHIFT_CTR, _PARAM_Y_POS
	andi _SHIFT_CTR, 0x07

	ldi _SHIFTED_BIT, 1

	rjmp gfx_set_pixel_shift_skip

gfx_set_pixel_shift_loop:
	lsl _SHIFTED_BIT

gfx_set_pixel_shift_skip:
	dec _SHIFT_CTR
	brpl gfx_set_pixel_shift_loop

	// Set our shifted bit in the framebuffer

	ld _DATA, Z
	or _DATA, _SHIFTED_BIT
	st Z, _DATA

	pop _SHIFTED_BIT
	pop _SHIFT_CTR

	pop ZH
	pop ZL
	ret

#undef _PARAM_X_POS
#undef _PARAM_Y_POS
#undef _SHIFTED_BIT
#undef _SHIFT_CTR
#undef _DATA

/*
 * gfx_draw_horiz_line
 * 
 * params: XL = start X position
 *         XH = start Y position
 *         r16 = length
 * returns: none
 * destroys: none
 */

#define _PARAM_LENGTH r16

gfx_draw_horiz_line:
	push XL
	push r16

gfx_draw_horiz_line_loop:
	rcall gfx_set_pixel

	inc XL

	dec r16
	brne gfx_draw_horiz_line_loop

	pop r16
	pop XL
	ret

#undef _PARAM_LENGTH

/*
 * gfx_char_len
 * 
 * params: r16 = char - 32
 * returns: r18 = char length
 * destroys: r17 (= r16 >> 1)
 */

#define _PARAM_CHAR r16
#define _RETURN_LENGTH r18
#define _TMP r17

gfx_char_len:
	push XL
	push XH

	mov _TMP, _PARAM_CHAR

	lsr _TMP // 2 characters are packed to each byte of the LUT

	ldx PGM(smallfont)

	add XL, _TMP
	adc XH, ZERO

	ld _RETURN_LENGTH, X

	sbrs _PARAM_CHAR, 0 // If we are looking for an even character, swap the nibbles
		swap _RETURN_LENGTH

	andi _RETURN_LENGTH, 0xF // Extract only the lower nibble

	pop XH
	pop XL
	ret

#undef _PARAM_CHAR
#undef _RETURN_LENGTH
#undef _TMP

/*
 * gfx_draw_8_pixels
 * 
 * params: r17 = 8 bits of pixel data
 *         XL = X position
 *         XH = Y position
 * returns: XL = X position incremented by one
 * destroys: none
 */

#define _PARAM_PIXELS r17
#define _PARAM_X_POS XL
#define _PARAM_Y_POS XH
#define _CTR r18

gfx_draw_8_pixels:
	push _PARAM_PIXELS
	push _CTR

	// Iterate over the Y axis from 0 to 7

	ldi _CTR, 8

gfx_draw_8_pixels_loop:
	sbrc _PARAM_PIXELS, 0 // If the lowest pixel is set, draw the pixel
		rcall gfx_set_pixel

	inc _PARAM_Y_POS // Increment the Y position

	lsr _PARAM_PIXELS // Shift the pixel data

	// Have we reached the last row?

	dec _CTR
	brne gfx_draw_8_pixels_loop

	pop _CTR
	pop _PARAM_PIXELS

	subi _PARAM_Y_POS, 8 // Revert the Y position to its original value
	inc _PARAM_X_POS // Increment the X position
	ret

#undef _PARAM_PIXELS
#undef _PARAM_X_POS
#undef _PARAM_Y_POS
#undef _CTR

/*
 * gfx_draw_char
 * 
 * params: r16 = char
 *         XL = X position
 *         XH = Y position
 * returns: XL = end X position
 * destroys: r16 (= 0)
 *           r17 (= variable, last byte of the character's pixel data)
 *           r18 (= variable, character length of the preceeding character)
 *           Y (= variable, end address after the character's final byte)
 */

#define _PARAM_CHAR r16
#define _PARAM_X_POS XL
#define _PARAM_Y_POS XH
#define _CHAR_WIDTH r16
#define _DATA r17
#define _RETURNED_LENGTH r18

gfx_draw_char:
	ldy PGM(smallfont) + 48 // Start of actual graphics data

	subi _PARAM_CHAR, 32

	// Get this character's width and save it for later

	rcall gfx_char_len
	push _RETURNED_LENGTH

	// Now, find the actual character based on the preceding character's widths

gfx_draw_char_find_loop:
	// If we have reached 0, exit the loop

	cpi _PARAM_CHAR, 0
	breq gfx_draw_char_find_loop_end
	
	// Otherwise get the preceding character's width and add it to our pointer

	dec _PARAM_CHAR
	rcall gfx_char_len

	add YL, _RETURNED_LENGTH
	adc YH, ZERO
	rjmp gfx_draw_char_find_loop

gfx_draw_char_find_loop_end:
	// We now have our pointer & char width, so start drawing

	pop _CHAR_WIDTH // Character width

	// Iterate over the X axis until the character is fully drawn

gfx_draw_char_x_loop:
	ld _DATA, Y+

	rcall gfx_draw_8_pixels

	// Have we reached the last column?

	dec _CHAR_WIDTH
	brne gfx_draw_char_x_loop

	ret

#undef _PARAM_CHAR
#undef _PARAM_X_POS
#undef _PARAM_Y_POS
#undef _CHAR_WIDTH
#undef _DATA
#undef _RETURNED_LENGTH

/*
 * gfx_draw_big_char
 * 
 * params: r16 = char
 *         XL = X position
 *         XH = Y position
 * returns: none
 * destroys: r16 (= 0xF)
 *           r17 (= variable, last byte of the character's pixel data)
 *           r18 (= 0) - used for tracking the temporary Y position in multiples of 8 ("bank")
 *           Y (= variable, end address after the character's final byte)
 */

#define _PARAM_CHAR r16
#define _PARAM_X_POS XL
#define _PARAM_Y_POS XH
#define _SKIP r16
#define _DATA r17
#define _BANK r18

gfx_draw_big_char:
	push _PARAM_X_POS

	// Get the character's address

	ldy PGM(thiccfont)

	add YL, _PARAM_CHAR
	adc YH, ZERO

	ld _DATA, Y

	add YL, _DATA
	adc YH, ZERO

	clr _SKIP

gfx_draw_big_char_reset_bank:
	clr _BANK

gfx_draw_big_char_loop:
	// Have we reached the terminator?

	cpi _SKIP, 0xF
	breq gfx_draw_big_char_end

	// If _SKIP is non-zero, decrement it and skip the current screen byte

	cpi _SKIP, 0
	breq gfx_draw_big_char_render

	dec _SKIP
	rjmp gfx_draw_big_char_advance

gfx_draw_big_char_render:
	// _SKIP is zero, so actually render this byte

	ld _DATA, Y+

	// If this is the bottommost byte, extract its skip value

	cpi _BANK, 16
	brne gfx_draw_big_char_render_not_bottommost

	mov _SKIP, _DATA
	swap _SKIP
	andi _SKIP, 0xF
	andi _DATA, 0xF // So that the rendering routine does not parse the skip value as pixel data

gfx_draw_big_char_render_not_bottommost:
	// Stretch the read pixel data across 3 pixels horizontally

	add _PARAM_Y_POS, _BANK
	rcall gfx_draw_8_pixels
	rcall gfx_draw_8_pixels
	rcall gfx_draw_8_pixels
	sub _PARAM_Y_POS, _BANK

	subi _PARAM_X_POS, 3

gfx_draw_big_char_advance:
	// Advance to the next screen byte

	addi _BANK, 8

	// Have we already rendered/skipped the bottommost byte?

	cpi _BANK, 24
	brlo gfx_draw_big_char_loop

	// If so, reset the byte count and increment the X position

	inc _PARAM_X_POS
	rjmp gfx_draw_big_char_reset_bank

gfx_draw_big_char_end:
	pop _PARAM_X_POS
	ret

#undef _PARAM_CHAR
#undef _PARAM_X_POS
#undef _PARAM_Y_POS
#undef _SKIP
#undef _DATA
#undef _BANK

/*
 * gfx_draw_big_number
 * 
 * Draws a number in the big Chicago font, always will draw 2 digits!
 * 
 * params: r19 = number (0-99! - if more, weird things will start to happen)
 *         XL = X position
 *         XH = Y position
 * returns: XL = input X position + 32
 * destroys: r16 (= 0xF)
 *           r17 (= variable, last byte of the last character's pixel data)
 *           r18 (= 0) - used for tracking the temporary Y position in multiples of 8 ("bank")
 *           r19 (= 0-9, low digit of the input number)
 *           Y (= variable, end address after the last character's final byte)
 */

#define _PARAM_NUM r19
#define _PARAM_X_POS XL
#define _PARAM_Y_POS XH
#define _DIVISOR r17
#define _REMAINDER r19
#define _CHAR r16

gfx_draw_big_number:
	// Divide the input number by 8

	ldi _DIVISOR, 10
	rcall udiv8

	// _CHAR already contains the high digit

	rcall gfx_draw_big_char

	// Then draw the low digit, 16 px to the right

	mov _CHAR, _REMAINDER
	addi _PARAM_X_POS, 16

	rcall gfx_draw_big_char

	// Increment the X position for the next call

	addi _PARAM_X_POS, 16

__parasite_gfx_draw_string_ret:
	ret

#undef _PARAM_NUM
#undef _PARAM_X_POS
#undef _PARAM_Y_POS
#undef _DIVISOR

/*
 * gfx_draw_string
 * 
 * params: Z = string address
 *         XL = X position
 *         XH = Y position
 * returns: XL = end X position
 *          Z = string terminator address
 * destroys: r16 (= 0)
 *           r17 (= variable, last byte of the last character's pixel data)
 *           r18 (= variable, last character's length of its preceeding character)
 *           Y (= variable, end address after the last character's final byte)
 */

#define DRAWSTRING_CENTER_ALIGN 0x80
#define DRAWSTRING_RIGHT_ALIGN 0x80

#define _PARAM_X_POS XL
#define _PARAM_Y_POS XH
#define _DATA r16
#define _RETURNED_LENGTH r18

gfx_draw_string:
	// First of all, check if the string is supposed to have special alignment

	cpi _PARAM_X_POS, DRAWSTRING_RIGHT_ALIGN
	brlo gfx_draw_string_loop

	// Calculate the string length

	push ZL
	push ZH

	ldi YL, 0xFF // Width accumulator

gfx_draw_string_widthcalc_loop:
	ld _DATA, Z+
	cpi _DATA, 0
	breq gfx_draw_string_widthcalc_loop_end

	subi _DATA, 32

	rcall gfx_char_len
	add YL, _RETURNED_LENGTH
	inc YL

	rjmp gfx_draw_string_widthcalc_loop
	
gfx_draw_string_widthcalc_loop_end:
	// We now have the length, check if we are supposed to be centered or not

	cpi _PARAM_X_POS, DRAWSTRING_CENTER_ALIGN
	breq gfx_draw_string_widthcalc_center

	// Right align

	andi _PARAM_X_POS, 0x7F
	sub _PARAM_X_POS, YL
	rjmp gfx_draw_string_widthcalc_end

gfx_draw_string_widthcalc_center:
	// Center align

	ldi _PARAM_X_POS, 64 // Screen center
	lsr YL
	sub _PARAM_X_POS, YL

gfx_draw_string_widthcalc_end:
	pop ZH
	pop ZL

gfx_draw_string_loop:
	ld _DATA, Z+
	cpi _DATA, 0
	breq __parasite_gfx_draw_string_ret

	rcall gfx_draw_char
	inc _PARAM_X_POS
	rjmp gfx_draw_string_loop

#undef _PARAM_X_POS
#undef _PARAM_Y_POS
#undef _DATA
#undef _RETURNED_LENGTH
