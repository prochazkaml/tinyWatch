// tinyWatchOS v1.0
// Copyright (C) Michal Procházka, 2022.

// Disassemble with: avr-objdump -m avr -D main.hex

#include "tn1614def.inc"
#include "defines.asm"

.org 0
	// Set up the CPU & stack

	clr ZERO
	out CPU_SREG, ZERO

	ldi r16, LOW(RAMEND)
	out CPU_SPL, r16
	ldi r16, HIGH(RAMEND)
	out CPU_SPH, r16

	ldi r16, 0xD8 // For CCP writes
	mov CCP_FLAG_REG, r16

	ldi r16, 3 // Quite a common value
	mov THREE, r16

	ldi r16, PORT_PULLUPEN_bm // Save it for later, in the meantime, we have to jump over all of the #includes

	rjmp main

#include "rtc.asm"

#include "sysutil.asm"
#include "sprintf.asm"
#include "io/oled.asm"
#include "io/gfx.asm"
#include "io/buttons.asm"
#include "ui/menucommon.asm"
#include "ui/calibsetup.asm"
#include "ui/timesetup.asm"
#include "ui/watchface.asm"

main:
	// Enable pullups on all pins, otherwise they will oscillate and waste power

	out VPORTA_DIR, ZERO
	out VPORTB_DIR, ZERO

	ldx PORTA_PIN0CTRL
	ldy PORTB_PIN0CTRL

main_pullup_loop:
	st X+, r16
	st Y+, r16

	cpi XL, LOW(PORTA_PIN0CTRL) + 8
	brne main_pullup_loop

	// Initialize the framebuffer address regs

//	ldi_lower FRAMEBUFFER_L, LOW(FRAMEBUFFER_ADDR) // Not necessary, since this register already is zero
	ldi_lower FRAMEBUFFER_H, HIGH(FRAMEBUFFER_ADDR)

	rcall slowsysclk
	ldi r16, 1000 / 16
	rcall delay_ms

	// Clear the SRAM

	movw XL, FRAMEBUFFER_L // Located at the beginning of SRAM

main_clear_loop:
	st X+, ZERO

	cpi XH, HIGH(INTERNAL_SRAM_START + INTERNAL_SRAM_SIZE)
	brne main_clear_loop

	// Initialize RTC max values

	ldx PGM(time_max_values)
	ldy RTC_AREA_ADDR + RTC_MAX_VAL_OFFSET

main_rtc_max_init_loop:
	ld r16, X+
	st Y+, r16

	cpi YL, RTC_MAX_VAL_OFFSET * 2
	brne main_rtc_max_init_loop

	// Enable the 32.768 kHz clock when in standby

//	set_protected CLKCTRL_OSC32KCTRLA, CLKCTRL_RUNSTDBY_bm

	// Set up the RTC

	mem_imm RTC_CLKSEL, RTC_CLKSEL_INT32K_gc
	mem_imm RTC_INTCTRL, RTC_OVF_bm
//	mem_xfer RTC_PERL, EEUR(EEUR_OSC_CALIB_L)
//	mem_xfer RTC_PERH, EEUR(EEUR_OSC_CALIB_H)
	mem_imm RTC_PERL, 0x63
	mem_imm RTC_PERH, 0x81
	mem_imm RTC_CTRLA, RTC_PRESCALER_DIV1_gc | RTC_RTCEN_bm | RTC_RUNSTDBY_bm

	ldi WAKEUPTIMEOUT, WUT_JUSTWOKEUP

	// Set correct interrupt location

	set_protected CPUINT_CTRLA, CPUINT_IVSEL_bm
	sei

	// Force clock redraw

	sbi STATUS_IO_REG, STATUS_BIT_CLOCK_UPDATED

main_loop:
	rcall slowsysclk

	// Check if it's time to power off

	cpi WAKEUPTIMEOUT, 0
	brne main_no_shutdown

	// Cut off OLED VCC

	cbi VPORTA_OUT, 1

	// Disable I2C pullup

	sts PORTB_PIN0CTRL, ZERO
	sts PORTB_PIN1CTRL, ZERO

	// Set the I2C lines to output low

	ldi r16, 3
	sts PORTB_OUTCLR, r16
	sts PORTB_DIRSET, r16

	// Enter standby mode

	mem_imm SLPCTRL_CTRLA, SLPCTRL_SEN_bm | SLPCTRL_SMODE_STDBY_gc
	sleep

	// When we wake up, go back

	rjmp main_loop

main_no_shutdown:
	// Check if we have just woken up

	cpi WAKEUPTIMEOUT, WUT_JUSTWOKEUP
	breq main_just_woke_up

	rjmp main_check_buttons

main_just_woke_up:
	// Set the I2C lines as inputs & enable their pullups

	mem_imm PORTB_DIRCLR, 3

	ldi r16, PORT_PULLUPEN_bm
	sts PORTB_PIN0CTRL, r16
	sts PORTB_PIN1CTRL, r16

	// Enable OLED VCC

	sbi VPORTA_DIR, 1
	sbi VPORTA_OUT, 1

	// Wait for a bit and then initialize the OLED

	ldi r16, 150 / 16
	rcall delay_ms

	rcall fastsysclk

	macro_init_i2c
	macro_init_oled

	rcall slowsysclk

	// Set the default timeout

	ldi_lower WAKEUPTIMEOUT, WUT_MAXTIMEOUT

main_check_buttons:
	// Check if we are meant to enter any menu

	ldi r16, (1 << 5) | (1 << 7) // Time setup combination
	rcall check_if_pressed

	sbic STATUS_IO_REG, STATUS_BIT_KEY_COMBO_MATCH
		rcall time_setup

	ldi r16, (1 << 5) | (1 << 6) // Clock calibration combination
	rcall check_if_pressed

	sbic STATUS_IO_REG, STATUS_BIT_KEY_COMBO_MATCH
		rcall calibration_setup

	// Has the clock updated? If not, do nothing

	sbis STATUS_IO_REG, STATUS_BIT_CLOCK_UPDATED
		rjmp main_loop

	// Draw the time here

	rcall fastsysclk
	macro_draw_watch_face
	rcall oled_refresh
	rcall slowsysclk

	// Signal that the clock should be updated before redrawing

	cbi STATUS_IO_REG, STATUS_BIT_CLOCK_UPDATED

	rjmp main_loop

#include "assets/eeprom.asm"
#include "assets/smallfont.asm"
#include "assets/thiccfont.asm"
