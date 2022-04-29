#define F_CPU (20000000/6)

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

#define STR_CENTER 255

#define CLOCK_X ((128 - 112 + 3) / 2)
#define CLOCK_Y 12

#define WUT_MAXTIMEOUT 8
#define WUT_JUSTWOKEUP 0xFF

EEMEM uint16_t RTC_PER_calibrated;

volatile uint8_t wakeuptimeout = WUT_MAXTIMEOUT, clockupdated = 1, year = 22, month = 3, day = 23, weekday = 5, hour = 14, minute = 40, second = 0;

const char hex[16] = "0123456789ABCDEF";

uint8_t charlen(char c) {
	return smallfont[(c - 32) * 6];
}

uint8_t drawchar(char c, uint8_t x, uint8_t y) {
	const uint8_t *addr = smallfont + (c - 32) * 6;

	uint8_t w = *addr++;

	for(uint8_t i = 0; i < w; i++) {
		uint8_t b = addr[i];

		for(uint8_t j = 0; j < 8; j++) {
			if(b & 1) set(x + i, y + j);
			b >>= 1;
		}
	}

	return w;
}

uint8_t strdrawlen(const char *c) {
	uint8_t x = 0;

	while(*c != 0) {
		x += charlen(*c++) + 1;
	}

	return x - 1;
}

void drawstr(const char *c, uint8_t x, uint8_t y) {
	if(x == STR_CENTER) x = 64 - (strdrawlen(c) >> 1);

	while(*c != 0) {
		x += drawchar(*c++, x, y) + 1;
	}
}

void drawbigchar(char c, uint8_t x, uint8_t y) {
	const uint8_t *addr = bigfont + c * 45;

	for(uint8_t i = 0; i < 15; i++) {
		for(uint8_t i2 = 0; i2 < 3; i2++) {
			uint8_t b = addr[i * 3 + i2];

			for(uint8_t j = 0; j < 8; j++) {
				if(b & 1) set(x + i, y + j + (i2 << 3));
				b >>= 1;
			}
		}
	}
}

void drawclock(uint8_t h, uint8_t m, uint8_t s, uint8_t y) {
	drawbigchar(h / 10, CLOCK_X + 0, y);
	drawbigchar(h % 10, CLOCK_X + 16, y);
	if(!(s & 1)) drawbigchar(10, CLOCK_X + 32, y);
	drawbigchar(m / 10, CLOCK_X + 40, y);
	drawbigchar(m % 10, CLOCK_X + 56, y);
	if(!(s & 1)) drawbigchar(10, CLOCK_X + 72, y);
	drawbigchar(s / 10, CLOCK_X + 80, y);
	drawbigchar(s % 10, CLOCK_X + 96, y);
}

const char *weekdays[7] = {
	"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
};

const char *months[12] = {
	"January", "February", "March", "April",
	"May", "June", "July", "August",
	"September", "October", "November", "December"
};

volatile uint8_t monthlengths[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

void updateleapyear() {
	if(year % 4) {
		monthlengths[1] = 28;
	} else {
		monthlengths[1] = 29;

//		if(!(year % 100) && (year % 400)) monthlengths[1] = 28; // Not necessary, I'm gonna be dead by that time anyway
	}
}

void min_sprintf(char *dest, char *fmt, ...) {
	va_list ap;
	va_start(ap, fmt);

	char c, p;
	
	while(c = *fmt++) {
		if(c == '%') {
			switch (p = *fmt++) {
				case 's':
					char *s = va_arg(ap, char *);

					while(p = *s++) {
						*dest++ = p;
					}

					break;

				case 'd':
					int d = va_arg(ap, int);

					if(d < 0) {
						*dest++ = '-';
						d *= (-1);
					}

					char buf[6];

					buf[0] = '0';
					char max = 0;

					while(d > 0) {
						buf[max++] = '0' + d % 10;

						d /= 10;
					}

					if(!max) max = 1;

					for(char i = max - 1; i >= 0; i--) {
						*dest++ = buf[i];
					}

					break;

/*				case 'c':
					char c = (char) va_arg(ap, int);
					printf("char %c\n", c);
					break;*/

				default:
					*dest++ = p;
			}
		} else {
			*dest++ = c;
		}
	}

	*dest = 0;
}

ISR(RTC_CNT_vect) {
	second++;

	if(second >= 60) {
		second = 0;
		minute++;

		if(minute >= 60) {
			minute = 0;
			hour++;

			if(hour >= 24) {
				hour = 0;
				day++;
				weekday++;

				if(weekday >= 7) weekday = 0;

				if(day > monthlengths[month]) {
					day = 1;
					month++;

					if(month >= 12) {
						month = 0;
						year++;

						updateleapyear();
					}
				}
			}
		}
	}

	if(wakeuptimeout <= WUT_MAXTIMEOUT && wakeuptimeout) wakeuptimeout--;

	if((PORTA.IN & (_BV(5) | _BV(6) | _BV(7))) != (_BV(5) | _BV(6) | _BV(7))) {
		if(wakeuptimeout)
			wakeuptimeout = WUT_MAXTIMEOUT;
		else
			wakeuptimeout = WUT_JUSTWOKEUP;
	}

	RTC.INTFLAGS |= RTC_OVF_bm;
	clockupdated = 1;
}

void wake_up_display() {
	// Turn on the display

	PORTB.DIRCLR = 0x03;
	PORTB.PIN0CTRL |= PORT_PULLUPEN_bm;
	PORTB.PIN1CTRL |= PORT_PULLUPEN_bm;
	
	PORTA.DIRSET = 0x02;
	PORTA.OUTSET = 0x02;

	_delay_ms(150);

	oled_init();
}

uint8_t debounce[3] = { 0 }, pressed[3] = { 0 };

void update_buttons() {
	for(uint8_t b = 0; b < 3; b++) {
		if(!(PORTA.IN & _BV(b + 5))) {
			if(!debounce[b])
				pressed[b] = 1;
			else
				pressed[b] = 0;

			debounce[b] = 30;
		} else {
			if(debounce[b]) debounce[b]--;
			pressed[b] = 0;
		}
	}

	_delay_ms(1);
}

const char *setupsteps[7] = {
	"Hours", "Minutes", "Seconds", "Weekday", "Day", "Month", "Year"
};

typedef struct {
	volatile uint8_t *val;
	uint8_t min, max, special;
} setupdata_t;

setupdata_t setupdata[] = {
	{ &hour, 0, 23, 0 },
	{ &minute, 0, 59, 0 },
	{ &second, 0, 59, 0 },
	{ &weekday, 0, 6, 1 },
	{ &day, 1, 31, 0 },
	{ &month, 0, 11, 2 },
	{ &year, 0, 99, 0 }
};

void setup_menu() {
	RTC.CTRLA &= ~RTC_RTCEN_bm;

	int8_t needsrefresh, done, currentval;

	for(uint8_t i = 0; i < 7; i++) {
		needsrefresh = 1;
		done = 0;
		currentval = *setupdata[i].val;

		while(!done) {
			if(needsrefresh) {
				cls();

				drawstr(setupsteps[i], STR_CENTER, 0);

				for(uint8_t p = 0; p < 128; p++) {
					buffer[p + 128] = 0x02;
				}

				switch(setupdata[i].special) {
					case 1:
						drawstr(weekdays[currentval], STR_CENTER, 33);
						break;

					case 2:
						drawstr(months[currentval], STR_CENTER, 33);
						break;

					default:
						drawbigchar(currentval / 10, CLOCK_X + 40, 25);
						drawbigchar(currentval % 10, CLOCK_X + 56, 25);
						break;
				}

				refresh();
				needsrefresh = 0;
			}

			update_buttons();

			if(pressed[0]) {
				currentval--;
				needsrefresh = 1;

				if(currentval < setupdata[i].min) currentval = setupdata[i].max;

			}

			if(pressed[2]) {
				currentval++;
				needsrefresh = 1;

				if(currentval > setupdata[i].max) currentval = setupdata[i].min;
			}

			if(pressed[1]) {
				*setupdata[i].val = currentval;
				break;
			}
		}
	}

	RTC.CNT = 0;
	clockupdated = 1;

	RTC.CTRLA |= RTC_RTCEN_bm;
	wakeuptimeout = WUT_MAXTIMEOUT;
}

void calibration_menu() {
	uint16_t val = RTC.PER;

	int8_t needsrefresh = 1, done = 0, cursor = 0, selected = 0, nibbles[4];

	for(uint8_t i = 0; i < 4; i++) {
		nibbles[3 - i] = val & 0xF;

		val >>= 4;
	}

	while(!done) {
		if(needsrefresh) {
			cls();

			drawstr("Oscillator calibration", STR_CENTER, 0);

			for(uint8_t p = 0; p < 128; p++) {
				buffer[p + 128] = 0x02;
			}

			uint16_t tmpval = val;

			for(uint8_t i = 0; i < 4; i++) {
				drawchar(hex[nibbles[i]], 64 - 5 * 4 - 3 + i * 5, 33);
			}

			drawstr("Done", 64 + 3, 33);

			if(cursor < 4) {
				for(uint8_t y = (selected ? 33 - 3 : 33 + 9); y <= 33 + 9; y += 12) {
					for(uint8_t i = 0; i < 4; i++) {
						set(64 - 5 * 4 - 3 + cursor * 5 + i, y);
					}
				}
			} else {
				for(uint8_t i = 0; i < 4 * 4 + 3; i++) {
					set(64 + 3 + i, 33 + 9);
				}
			}

			refresh();
			needsrefresh = 0;
		}

		update_buttons();

		if(selected) {
			if(pressed[0]) {
				nibbles[cursor]--;
				if(nibbles[cursor] < 0) nibbles[cursor] = 0xF;
				needsrefresh = 1;
			}

			if(pressed[2]) {
				nibbles[cursor]++;
				if(nibbles[cursor] > 0xF) nibbles[cursor] = 0;
				needsrefresh = 1;
			}

			if(pressed[1]) {
				selected = 0;
				needsrefresh = 1;
			}
		} else {
			if(pressed[0]) {
				cursor--;
				if(cursor < 0) cursor = 4;
				needsrefresh = 1;
			}

			if(pressed[2]) {
				cursor++;
				if(cursor > 4) cursor = 0;
				needsrefresh = 1;
			}

			if(pressed[1]) {
				if(cursor == 4) break;

				selected = 1;				
				needsrefresh = 1;
			}
		}
	}

	val = 0;

	for(uint8_t i = 0; i < 4; i++) {
		val <<= 4;
		val |= nibbles[i];
	}

	RTC.PER = val;
	wakeuptimeout = WUT_MAXTIMEOUT;
	eeprom_update_word(&RTC_PER_calibrated, val);
}

int main() {
	// Set correct interrupt location

	_PROTECTED_WRITE(CPUINT_CTRLA, CPUINT_IVSEL_bm);

	// Set pullups on all pins, otherwise they will oscillate → consume power

	PORTA.DIRCLR = 0xFF;
	PORTB.DIRCLR = 0xFF;

	for(uint8_t i = 0; i < 8; i++) {
		*((uint8_t *)&PORTA + 0x10 + i) |= PORT_PULLUPEN_bm;
		*((uint8_t *)&PORTB + 0x10 + i) |= PORT_PULLUPEN_bm;
	}

	// Enable the 32.786 kHz clock when in standby

	_PROTECTED_WRITE(CLKCTRL_OSC32KCTRLA, CLKCTRL_RUNSTDBY_bm);

	// Set up RTC
	
	RTC.CLKSEL = RTC_CLKSEL_INT32K_gc;
	RTC.INTCTRL = RTC_OVF_bm;

    RTC.PER = eeprom_read_word(&RTC_PER_calibrated);
//    RTC.PER = 0x8000;
    RTC.CTRLA = RTC_PRESCALER_DIV1_gc | RTC_RTCEN_bm | RTC_RUNSTDBY_bm;

	// Divide the CPU clock

	sei();

	wake_up_display();

	updateleapyear();

	char buf[64];

	while(1) {
		if(wakeuptimeout == WUT_JUSTWOKEUP) {
			wake_up_display();
			wakeuptimeout = WUT_MAXTIMEOUT;
		}
		
		if(!wakeuptimeout) {
			// After a certain cutoff period, turn off the display

			PORTA.OUTCLR = 0x02;

			PORTB.PIN0CTRL &= ~PORT_PULLUPEN_bm;
			PORTB.PIN1CTRL &= ~PORT_PULLUPEN_bm;
	
			PORTB.OUTCLR = 0x03;
			PORTB.DIRSET = 0x03;

			// Enter standby mode

			_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_6X_gc | CLKCTRL_PEN_bm);

			SLPCTRL.CTRLA = SLPCTRL_SEN_bm | SLPCTRL_SMODE_STDBY_gc;
			sleep_cpu();
		} else {
			if(!(PORTA.IN & _BV(5)) && !(PORTA.IN & _BV(7))) {
				while(!(PORTA.IN & _BV(5)) || !(PORTA.IN & _BV(7)));

				_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_6X_gc | CLKCTRL_PEN_bm);

				_delay_ms(100);

				setup_menu();
			}

			if(!(PORTA.IN & _BV(5)) && !(PORTA.IN & _BV(6))) {
				while(!(PORTA.IN & _BV(5)) || !(PORTA.IN & _BV(6)));

				_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_6X_gc | CLKCTRL_PEN_bm);

				_delay_ms(100);

				calibration_menu();
			}

			if(clockupdated) {
				_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_6X_gc | CLKCTRL_PEN_bm);

				cls();

				drawclock(hour, minute, second, CLOCK_Y);

				min_sprintf(buf, "%s, %d %s", weekdays[weekday], day, months[month], year); 

				drawstr(buf, STR_CENTER, 44);

//				min_sprintf(buf, "%d %d %d", PORTA.IN & (_BV(5) | _BV(6) | _BV(7)), (_BV(5) | _BV(6) | _BV(7)), wakeuptimeout);

//				drawstr(buf, STR_CENTER, 56);

				refresh();

				clockupdated = 0;

				_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_64X_gc | CLKCTRL_PEN_bm);
			}
		}
	}
}
