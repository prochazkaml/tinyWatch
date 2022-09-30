.dseg
.org INTERNAL_SRAM_START
FRAMEBUFFER_ADDR: .byte 1024 // DO NOT MOVE THIS ANYWHERE ELSE!!!
RTC_AREA_ADDR: .byte 14 // DO NOT MOVE THIS ANYWHERE ELSE AS WELL!!!
STRINGBUFFER_ADDR: .byte 64
PRESSEDMATRIX_ADDR: .byte 3
SPRINTFINPUT_ADDR: .byte 32

#define RTC_SECOND_OFFSET 0
#define RTC_MINUTE_OFFSET 1
#define RTC_HOUR_OFFSET 2
#define RTC_WEEKDAY_OFFSET 3
#define RTC_DAY_OFFSET 4
#define RTC_MONTH_OFFSET 5
#define RTC_DUMMY_OFFSET 6

#define RTC_MAX_VAL_OFFSET 7
#define RTC_MAX_SECOND_OFFSET 7
#define RTC_MAX_MINUTE_OFFSET 8
#define RTC_MAX_HOUR_OFFSET 9
#define RTC_MAX_WEEKDAY_OFFSET 10
#define RTC_MAX_DAY_OFFSET 11
#define RTC_MAX_MONTH_OFFSET 12
#define RTC_MAX_DUMMY_OFFSET 13

#define CCP_FLAG_REG r4
#define ZERO r2
#define THREE r6

#define FRAMEBUFFER_L r2
#define FRAMEBUFFER_H r3

#define WAKEUPTIMEOUT r21
#define BUTTONFIELD r5

#define STATUS_IO_REG GPIO_GPIOR0
#define STATUS_BIT_CLOCK_UPDATED 0
#define STATUS_BIT_KEY_COMBO_MATCH 1
#define STATUS_BIT_CURSOR_SELECTED 2

#define WUT_JUSTWOKEUP 0xFF
#define WUT_MAXTIMEOUT 8

//#define EEUR_OSC_CALIB_L 0
//#define EEUR_OSC_CALIB_H 1

.macro set_protected
	.if (@1) == 0
		out CPU_CCP, CCP_FLAG_REG
		sts @0, ZERO
	.else
		.if (@1) == 3
			out CPU_CCP, CCP_FLAG_REG
			sts @0, THREE
		.else
			ldi r16, @1
			out CPU_CCP, CCP_FLAG_REG
			sts @0, r16
		.endif
	.endif
.endmacro

.macro mem_imm
	.if (@1) == 0
		sts @0, ZERO
	.else
		.if (@1) == 3
			sts @0, THREE
		.else
			ldi r16, @1
			sts @0, r16
		.endif
	.endif
.endmacro

.macro mem_setbits
	lds r16, @0
	ori r16, @1
	sts @0, r16
.endmacro

.macro mem_clrbits
	lds r16, @0
	andi r16, ~(@1)
	sts @0, r16
.endmacro

.macro mem_xfer
	lds r16, @1
	sts @0, r16
.endmacro

.macro mem_wait_bits_clr
	lds r16, @0
	andi r16, @1
	breq @2
.endmacro

.macro ldi_lower
	.if (@1) == 0
		clr @0
	.else
		.if (@1) == 3
			mov @0, THREE
		.else
			ldi r16, @1
			mov @0, r16
		.endif
	.endif
.endmacro

.macro ldx
	ldi XL, LOW(@0)
	ldi XH, HIGH(@0)
.endmacro

.macro ldy
	ldi YL, LOW(@0)
	ldi YH, HIGH(@0)
.endmacro

.macro ldz
	ldi ZL, LOW(@0)
	ldi ZH, HIGH(@0)
.endmacro

.macro addi
	subi @0, -(@1)
.endmacro

#define PGM(addr) (MAPPED_PROGMEM_START + (2 * (addr)))
#define EE(addr) (EEPROM_START + (addr))
//#define EEUR(addr) (USERROW_USERROW0 + (addr))

.cseg
