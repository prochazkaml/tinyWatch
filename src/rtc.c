#include "rtc.h"
#include "config.h"
#include "sysutil.h"
#include <avr/interrupt.h>
#include <stdint.h>
#include <stdbool.h>

#define wakeuptimeout GPIO_GPIOR0
#define clockupdated GPIO_GPIOR1
#define lastbuttonstate GPIO_GPIOR2

#define WUT_MAXTIMEOUT 8
#define WUT_JUSTWOKEUP 0xFF

volatile uint8_t year, month, day, weekday, hour, minute, second;

#define update_val(varname) { val = varname; val++; varname = val; }

#define EXT_CRYSTAL

ISR(RTC_CNT_vect) {
	uint8_t val;

	update_val(second);

	if(val >= 60) {
		second = 0;
		update_val(minute);

		if(val >= 60) {
			minute = 0;
			update_val(hour);

			if(val >= 24) {
				hour = 0;

				update_val(weekday);
				
				if(val >= 7) weekday = 0;

				update_val(day);

				if(val > EEBYTE(EE_monthlengths + month)) {
					day = 1;
					update_val(month);

					if(val >= 12) {
						month = 0;
						year++;
					}
				}
			}
		}
	}

	val = wakeuptimeout;

	if(val <= WUT_MAXTIMEOUT && val) val--;

	if((VPORTA_IN & (_BV(5) | _BV(6) | _BV(7))) != (_BV(5) | _BV(6) | _BV(7))) {
		if(!lastbuttonstate) {
			if(val)
				val = WUT_MAXTIMEOUT;
			else
				val = WUT_JUSTWOKEUP;

			lastbuttonstate = 1;
		}
	} else {
		lastbuttonstate = 0;
	}

	wakeuptimeout = val;

	RTC.INTFLAGS |= RTC_OVF_bm;
	clockupdated = 1;
}

void rtc_init() {
	// Enable the 32.786 kHz clock when in standby

#ifdef EXT_CRYSTAL
	PROTECTED_WRITE(CLKCTRL_XOSC32KCTRLA, CLKCTRL_ENABLE_bm);
#else
	PROTECTED_WRITE(CLKCTRL_OSC32KCTRLA, CLKCTRL_RUNSTDBY_bm);
#endif

	// Set up RTC

	//weekday = 0; // Not needed, as it is cleared by default
	day = 1;
	//month = 0; // Not needed, as it is cleared by default
	year = 22;
	
#ifdef EXT_CRYSTAL
	RTC.CLKSEL = RTC_CLKSEL_TOSC32K_gc;
#else
	RTC.CLKSEL = RTC_CLKSEL_INT32K_gc;
#endif

	rtc_reload_config();

	RTC.INTCTRL = RTC_OVF_bm;
    RTC.CTRLA = RTC_PRESCALER_DIV1_gc | RTC_RTCEN_bm | RTC_RUNSTDBY_bm;

	clockupdated = 1;
	wakeuptimeout = WUT_JUSTWOKEUP;

	sei();
}

void rtc_pause() {
	RTC.CTRLA &= ~RTC_RTCEN_bm;
}

void rtc_resume() {
	RTC.CNT = 0;
	RTC.CTRLA |= RTC_RTCEN_bm;
}

void rtc_reload_config() {
	RTC.CNT = 0;
    RTC.PER = config_read_rtc_calibration();
}

bool rtc_updated() {
	if(clockupdated) {
		clockupdated = 0;
		return true;
	}

	return false;
}

void rtc_reset_sleep_counter() {
	wakeuptimeout = WUT_MAXTIMEOUT;
}

bool rtc_just_woke_up() {
	if(wakeuptimeout == WUT_JUSTWOKEUP) {
		rtc_reset_sleep_counter();
		return true;
	}

	return false;
}

bool rtc_should_go_to_sleep() {
	return wakeuptimeout == 0;
}

