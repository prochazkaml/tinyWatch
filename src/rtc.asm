// Registers that are not needed to be preserved: r7-r13, r22, r23

#define _RTC_ISR_SREG_BACKUP r7
#define _Y_BACKUP r8
#define _Z_BACKUP r10

.org RTC_CNT_vect

rtc_isr:
	// Back up the CPU status & used regs

	in _RTC_ISR_SREG_BACKUP, CPU_SREG
	movw _Y_BACKUP, YL
	movw _Z_BACKUP, ZL

	ldy RTC_AREA_ADDR

	// Update the max day value from the EEPROM month list

	ldz EE(EE_monthlengths)
	ldd r22, Y+RTC_MONTH_OFFSET
	add ZL, r22

	ld r22, Z
	std Y+RTC_MAX_DAY_OFFSET, r22

rtc_isr_loop:
	// Read the current value, increment it and check if it has overflown

	ld r22, Y
	inc r22

	ldi r23, 60
	ldd r23, Y+RTC_MAX_VAL_OFFSET
	cp r22, r23
	brlo rtc_isr_loop_no_reset

	// The value overflowed its intended limit, so reset it

	clr r22

rtc_isr_loop_no_reset:
	st Y+, r22

	// If we have processed the weekday, unconditionally process the day of month as well

	cpi YL, RTC_WEEKDAY_OFFSET + 1 // We have incremented by writing the value earlier
	breq rtc_isr_loop

	// If the value has been cleared, run again

	cpi r22, 0
	breq rtc_isr_loop

	// Time update has finished! Now update the wake up counter 

	// Decrement the counter if possible (counter is 1..127)

	cpi WAKEUPTIMEOUT, 1
	brlt rtc_isr_no_decrement_timeout

	dec WAKEUPTIMEOUT

rtc_isr_no_decrement_timeout:
	// Check if any button is pressed
	
	in r23, VPORTA_IN
	com r23 // High = released, low = pressed - reverse it
	andi r23, 0b11100000
	breq rtc_isr_no_buttons_pressed

	// Update the timeout counter depending on its status

	cpi WAKEUPTIMEOUT, 0
	breq rtc_isr_wake_up

	// The device is already awake, so make it awake for a bit longer

	ldi WAKEUPTIMEOUT, WUT_MAXTIMEOUT
	rjmp rtc_isr_no_buttons_pressed

rtc_isr_wake_up:
	// The timeout counter was zero, so signal a wake-up

	ldi WAKEUPTIMEOUT, WUT_JUSTWOKEUP

rtc_isr_no_buttons_pressed:
	// Signal that the clock should be updated

	sbi STATUS_IO_REG, STATUS_BIT_CLOCK_UPDATED

	// Signal the end of interrupt

	mem_imm RTC_INTFLAGS, RTC_OVF_bm

	// Restore the backed up regs

	movw ZL, _Z_BACKUP
	movw YL, _Y_BACKUP
	out CPU_SREG, _RTC_ISR_SREG_BACKUP
	reti

time_max_values: .db 60, 60, 24, 7, 69, 12, 255 // This watch can run for up to 255 years (i.e. not my problem) - after that, weird glitchiness will occur
