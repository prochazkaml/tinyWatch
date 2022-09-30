/*
 * macro_draw_watch_face
 * 
 * Renders the default digital watch face. 
 * The time is drawn in the nice & large Chicago font,
 * while the date information is drawn using the default small one.
 * 
 * params: none
 * returns: none
 * destroys: r16-r20, X, Y, Z (values don't even matter here)
 */

.macro macro_draw_watch_face
	ldz RTC_AREA_ADDR

	// Draw the time

	ldi XL, ((128 - 112 + 3) / 2)
	ldi XH, 12

	ldd r20, Z+RTC_SECOND_OFFSET

	ldd r19, Z+RTC_HOUR_OFFSET
	rcall gfx_draw_big_number

	ldi r16, 10
	sbrs r20, 0
		rcall gfx_draw_big_char
	addi XL, 8

	ldd r19, Z+RTC_MINUTE_OFFSET
	rcall gfx_draw_big_number

	ldi r16, 10
	sbrs r20, 0
		rcall gfx_draw_big_char
	addi XL, 8

	mov r19, r20
	rcall gfx_draw_big_number

	ldx SPRINTFINPUT_ADDR
	
	ldd r16, Z+RTC_WEEKDAY_OFFSET
	addi r16, EE_daylist
	st X+, r16

	ldd r16, Z+RTC_DAY_OFFSET
	inc r16
	st X+, r16

	ldd r16, Z+RTC_MONTH_OFFSET
	addi r16, EE_monthlist
	st X+, r16

	ldy PGM(watchfacefmt)
	rcall sprintf

	// Draw the date

	ldi XL, DRAWSTRING_CENTER_ALIGN
	ldi XH, 44
	rcall gfx_draw_string
.endmacro

watchfacefmt: .db 3, ", ", 2, " ", 3, 0
