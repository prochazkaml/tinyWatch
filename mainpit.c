#define F_CPU (20000000/6)

#ifndef __AVR_ATtiny1614__
#define __AVR_ATtiny1614__
#endif

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>
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

volatile uint8_t wakeuptimeout = WUT_MAXTIMEOUT, needsrefresh = 1, year = 22, month = 3, day = 23, weekday = 5, hour = 14, minute = 40, second = 0;

#ifdef __INTELLISENSE__
#undef pgm_read_byte
uint8_t pgm_read_byte(const uint8_t *addr) {
	return *addr;
}
#endif

uint8_t charlen(char c) {
	return pgm_read_byte(smallfont + (c - 32) * 6);
}

uint8_t drawchar(char c, uint8_t x, uint8_t y) {
	const uint8_t *addr = smallfont + (c - 32) * 6;

	uint8_t w = pgm_read_byte(addr);

	addr++;

	for(uint8_t i = 0; i < w; i++) {
		uint8_t b = pgm_read_byte(addr + i);

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
	if(x = STR_CENTER) x = 64 - (strdrawlen(c) >> 1);

	while(*c != 0) {
		x += drawchar(*c++, x, y) + 1;
	}
}

void drawbigchar(char c, uint8_t x, uint8_t y) {
	const uint8_t *addr = bigfont + c * 45;

	for(uint8_t i = 0; i < 15; i++) {
		for(uint8_t i2 = 0; i2 < 3; i2++) {
			uint8_t b = pgm_read_byte(addr + i * 3 + i2);

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

ISR(RTC_PIT_vect) {
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

    RTC.PITINTFLAGS |= RTC_PI_bm;
}

ISR(PORTA_PORT_vect) {
	if(!wakeuptimeout)
		wakeuptimeout = WUT_JUSTWOKEUP;
	else
		wakeuptimeout = WUT_MAXTIMEOUT;

	PORTA.INTFLAGS = 0xFF;
}

void wake_up_display() {
	// Turn on the display

	PORTB.DIRCLR = 0x03;
	PORTB.PIN0CTRL |= PORT_PULLUPEN_bm;
	PORTB.PIN1CTRL |= PORT_PULLUPEN_bm;
	
	PORTA.DIRSET = 0x02;
	PORTA.OUTSET = 0x02;

	_delay_ms(100);

	oled_init();
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
	RTC.PITCTRLA &= ~RTC_PITEN_bm;

	buffer[32] = 0xFF;

	uint8_t needsrefresh, done, debounce[3] = { 0 }, pressed[3] = { 0 }, currentval;

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

			if(pressed[0]) {
				currentval--;
				needsrefresh = 1;

				if(currentval < setupdata[i].min || currentval > setupdata[i].max) currentval = setupdata[i].max;

			}

			if(pressed[2]) {
				currentval++;
				needsrefresh = 1;

				if(currentval < setupdata[i].min || currentval > setupdata[i].max) currentval = setupdata[i].min;
			}

			if(pressed[1]) {
				*setupdata[i].val = currentval;
				break;
			}

			_delay_ms(1);
		}
	}

	RTC.PITCTRLA |= RTC_PITEN_bm;
	cls();
}

int main() {
	// Set pullups on all pins, otherwise they will oscillate → consume power

	PORTA.DIRCLR = 0xFF;
	PORTB.DIRCLR = 0xFF;

	for(uint8_t i = 0; i < 8; i++) {
		*((uint8_t *)&PORTA + 0x10 + i) |= PORT_PULLUPEN_bm;
		*((uint8_t *)&PORTB + 0x10 + i) |= PORT_PULLUPEN_bm;
	}

	// Enable pin change interrupts on PA5..7

	for(uint8_t i = 5; i <= 7; i++) {
		*((uint8_t *)&PORTA + 0x10 + i) &= ~PORT_ISC_gm;
		*((uint8_t *)&PORTA + 0x10 + i) |= PORT_ISC0_bm;
	}

	// Enable the 32.786 kHz clock when in standby

	_PROTECTED_WRITE(CLKCTRL_OSC32KCTRLA, CLKCTRL_RUNSTDBY_bm);

	// Set up RTC
	
	RTC.CLKSEL = RTC_CLKSEL_INT1K_gc;
	RTC.PITINTCTRL = RTC_PI_bm;
    RTC.PITCTRLA = RTC_PERIOD_CYC1024_gc | RTC_PITEN_bm;

	// Divide the CPU clock

	sei();

	wake_up_display();

	updateleapyear();

	char buf[64];

	uint8_t i;

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
		} else {
			if(!(PORTA.IN & _BV(5)) && !(PORTA.IN & _BV(7))) setup_menu();

			drawclock(hour, minute, second, CLOCK_Y);

			min_sprintf(buf, "%s, %d %s", weekdays[weekday], day, months[month], year); 

			drawstr(buf, STR_CENTER, 44);

			refresh();

			cls();
		}

//		_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_64X_gc | CLKCTRL_PEN_bm);

		SLPCTRL.CTRLA = SLPCTRL_SEN_bm | SLPCTRL_SMODE_PDOWN_gc;
		sleep_cpu();
		
		// Uncomment the following lines to prove that the sleep mode is working
		// Without the sleep mode enabled, the framebuffer will be full of white
		// With the sleep mode enabled, no framebuffer modification will take place and the screen will remain black, because the CPU will be sleeping during this free time

/*		i = 0;
		while(!needsrefresh) buffer[i++] = 0xFF;*/
	}
}
