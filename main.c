#define F_CPU (20000000/4)

#ifndef __AVR_ATtiny1614__
#define __AVR_ATtiny1614__
#endif

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/eeprom.h>
#include <util/delay.h>
#include <stdint.h>
#include <stdarg.h>
#include <stdlib.h>

#include "i2c_wrapper.h"
#include "ssd1306_minimal.h"

#include "smallfont.h"
#include "thiccfont.h"

#define wakeuptimeout GPIO_GPIOR0
#define clockupdated GPIO_GPIOR1

// The ATtiny1614 doesn't even have PORTC, so we can just abuse these registers

#define second VPORTC_DIR
#define minute VPORTC_OUT
#define hour GPIO_GPIOR2

#define pressed_matrix GPIO_GPIOR3
#define ispressed(bit) (pressed_matrix & _BV(bit + 5))

#define EE_hexlist 0x00
#define EE_monthlengths 0x10
#define EE_daylist 0x1C
#define EE_monthlist 0x23
#define EE_setuplist 0x2F

char buf[64];

volatile uint8_t year, month, day, weekday;

#define STR_CENTER 255

#define CLOCK_X ((128 - 112 + 3) / 2)
#define CLOCK_Y 12

#define WUT_MAXTIMEOUT 8
#define WUT_JUSTWOKEUP 0xFF

#include "sysutil.h"
#include "rtcisr.h"
#include "stringops.h"
#include "chargen.h"
#include "submenus.h"

int main() {
	// Set correct interrupt location

	PROTECTED_WRITE(CPUINT_CTRLA, CPUINT_IVSEL_bm);

	// Set pullups on all pins, otherwise they will oscillate → consume power

	VPORTA_DIR = 0;
	VPORTB_DIR = 0;

	asm volatile(
		"ldi r24, %[PULLUPEN]\n"
		"ldi r25, 8\n"

		"main_pullup_loop:\n"
		"st X+, r24\n"
		"st Y+, r24\n"

		"dec r25\n"
		"brne main_pullup_loop\n"
		::
		"x" (&PORTA_PIN0CTRL),
		"y" (&PORTB_PIN1CTRL),
		[PULLUPEN] "M" (PORT_PULLUPEN_bm)
	);

	// Enable the 32.786 kHz clock when in standby

	PROTECTED_WRITE(CLKCTRL_OSC32KCTRLA, CLKCTRL_RUNSTDBY_bm);

	// Set up RTC

	day = 1;
//	month = 0; // Not needed, as it is cleared by default
	year = 22;
	
	RTC.CLKSEL = RTC_CLKSEL_INT32K_gc;
	RTC.INTCTRL = RTC_OVF_bm;

    RTC.PER = USERROW.USERROW0 | (USERROW.USERROW1 << 8);
    RTC.CTRLA = RTC_PRESCALER_DIV1_gc | RTC_RTCEN_bm | RTC_RUNSTDBY_bm;

	sei();

	wakeuptimeout = WUT_JUSTWOKEUP;
	clockupdated |= 1;

	while(1) {
		asm volatile("main_loop:\n");

		slowsysclk();

		if(wakeuptimeout == WUT_JUSTWOKEUP) {
			asm volatile("recover_from_sleep:\n");

			// Turn on the display

			PORTB.DIRCLR = 0x03;
			PORTB.PIN0CTRL = PORT_PULLUPEN_bm;
			PORTB.PIN1CTRL = PORT_PULLUPEN_bm;
			
			VPORTA_DIR |= 0x02;
			VPORTA_OUT |= 0x02;

			delay_ms(150 / 16);

			fastsysclk();
			
			oled_init();

			slowsysclk();

			wakeuptimeout = WUT_MAXTIMEOUT;
		}
		
		if(!wakeuptimeout) {
			asm volatile("enter_sleep_mode:\n");

			// After a certain cutoff period, turn off the display

			VPORTA_OUT &= ~0x02;

			PORTB.PIN0CTRL = 0;
			PORTB.PIN1CTRL = 0;
	
			PORTB.OUTCLR = 0x03;
			PORTB.DIRSET = 0x03;

			// Enter standby mode

			SLPCTRL.CTRLA = SLPCTRL_SEN_bm | SLPCTRL_SMODE_STDBY_gc;
			sleep_cpu();
		} else {
			asm volatile("process_events:\n");

			if(!(VPORTA_IN & (_BV(5) | _BV(7)))) {
				waitforrelease(_BV(5) | _BV(7));

				setup_menu();
			}

			if(!(VPORTA_IN & (_BV(5) | _BV(6)))) {
				waitforrelease(_BV(5) | _BV(6));

				calibration_menu();
			}

			if(clockupdated & 1) {
				fastsysclk();
				
				cls();

				drawclock(hour, minute, second, CLOCK_Y);

				min_sprintf("\x03, \x02 \x03", EE_daylist + weekday, day, EE_monthlist + month); 

				drawstr(buf, STR_CENTER, 44);

				refresh();

				clockupdated &= ~1;
			}
		}
	}
}
