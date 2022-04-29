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

#define wakeuptimeout GPIO_GPIOR0
#define clockupdated GPIO_GPIOR1

// The ATtiny1614 doesn't even have PORTC, so we can just abuse these registers

#define second VPORTC_DIR
#define minute VPORTC_OUT

#define hour GPIO_GPIOR2
#define weekday GPIO_GPIOR3

#define EEBYTE(addr) (*((uint8_t *)(0x1400 + (addr))))

#define EE_hexlist 0x00
#define EE_monthlengths 0x10
#define EE_daylist 0x1C
#define EE_monthlist 0x23
#define EE_setuplist 0x2F

char buf[64];

volatile uint8_t year, month, day;

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

void delay_ms(uint8_t ms) {
	while(ms--) {
		_delay_us(995); // 2 bytes smaller than _delay_ms(1) :)
	}
}

void fastsysclk() {
	_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_6X_gc | CLKCTRL_PEN_bm);
}

void slowsysclk() {
	_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_64X_gc | CLKCTRL_PEN_bm);
}

uint8_t eeprom_read_table_string(uint8_t key, char *dest) {
	uint8_t start = EEBYTE(key), len = 0;

	char c;

	while(c = EEBYTE(start++)) {
		*dest++ = c;
		len++;
	}

	*dest = 0;

	return len;
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

				case 'e':
					dest += eeprom_read_table_string(va_arg(ap, int), dest);
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

				if(day > ((month == 1 && !(year & 3)) ? 29 : (EEBYTE(EE_monthlengths + month)))) {
					day = 1;
					month++;

					if(month >= 12) {
						month = 0;
						year++;
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
	clockupdated |= 1;
}

uint8_t pressed[6] = { 0 };

void update_buttons() {
	for(uint8_t b = 0; b < 3; b++) {
		if(!(PORTA.IN & _BV(b + 5))) {
			if(!pressed[b + 3])
				pressed[b] = 1;
			else
				pressed[b] = 0;

			pressed[b + 3] = 30;
		} else {
			if(pressed[b + 3]) pressed[b + 3]--;
			pressed[b] = 0;
		}
	}

	delay_ms(1);
}

typedef struct {
	volatile uint8_t *val;
	uint8_t min, max, special;
} setupdata_t;

const setupdata_t setupdata[] = {
	{ &hour, 0, 23, 0 },
	{ &minute, 0, 59, 0 },
	{ &second, 0, 59, 0 },
	{ &weekday, 0, 6, 1 },
	{ &day, 1, 31, 0 },
	{ &month, 0, 11, 2 },
	{ &year, 0, 99, 0 }
};

static inline void setup_menu() {
	RTC.CTRLA &= ~RTC_RTCEN_bm;

	int8_t needsrefresh, done, currentval;

	for(uint8_t i = 0; i < 7; i++) {
		needsrefresh = 1;
		done = 0;
		currentval = *setupdata[i].val;

		while(!done) {
			if(needsrefresh) {
				cls();

				eeprom_read_table_string(EE_setuplist + i, buf);
				drawstr(buf, STR_CENTER, 0);

				for(uint8_t p = 0; p < 128; p++) {
					buffer[p + 128] = 0x02;
				}

				switch(setupdata[i].special) {
					case 1:
						eeprom_read_table_string(EE_daylist + currentval, buf);
						drawstr(buf, STR_CENTER, 33);
						break;

					case 2:
						eeprom_read_table_string(EE_monthlist + currentval, buf);
						drawstr(buf, STR_CENTER, 33);
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
	clockupdated |= 1;

	RTC.CTRLA |= RTC_RTCEN_bm;
	wakeuptimeout = WUT_MAXTIMEOUT;
}

static inline void calibration_menu() {
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
				drawchar(EEBYTE(EE_hexlist + nibbles[i]), 64 - 5 * 4 - 3 + i * 5, 33);
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

	RTC.CNT = 0;
	RTC.PER = val;
	wakeuptimeout = WUT_MAXTIMEOUT;
	eeprom_write_word((uint16_t *)(&USERROW.USERROW0 - 0x1400), val);
}

void waitforrelease(uint8_t mask) {
	while(!(PORTA.IN & mask));

	delay_ms(100 / 10);

	fastsysclk();
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

	day = 3;
	month = 0;
	year = 22;
	
	RTC.CLKSEL = RTC_CLKSEL_INT32K_gc;
	RTC.INTCTRL = RTC_OVF_bm;

    RTC.PER = USERROW.USERROW0 | (USERROW.USERROW1 << 8);
    RTC.CTRLA = RTC_PRESCALER_DIV1_gc | RTC_RTCEN_bm | RTC_RUNSTDBY_bm;

	// Divide the CPU clock

	sei();

	wakeuptimeout = WUT_JUSTWOKEUP;
	clockupdated |= 1;

	while(1) {
		slowsysclk();

		if(wakeuptimeout == WUT_JUSTWOKEUP) {
			// Turn on the display

			PORTB.DIRCLR = 0x03;
			PORTB.PIN0CTRL |= PORT_PULLUPEN_bm;
			PORTB.PIN1CTRL |= PORT_PULLUPEN_bm;
			
			PORTA.DIRSET = 0x02;
			PORTA.OUTSET = 0x02;

			delay_ms(150 / 10);

			fastsysclk();
			
			oled_init();

			wakeuptimeout = WUT_MAXTIMEOUT;

			slowsysclk();
		}
		
		if(!wakeuptimeout) {
			// After a certain cutoff period, turn off the display

			PORTA.OUTCLR = 0x02;

			PORTB.PIN0CTRL &= ~PORT_PULLUPEN_bm;
			PORTB.PIN1CTRL &= ~PORT_PULLUPEN_bm;
	
			PORTB.OUTCLR = 0x03;
			PORTB.DIRSET = 0x03;

			// Enter standby mode

			SLPCTRL.CTRLA = SLPCTRL_SEN_bm | SLPCTRL_SMODE_STDBY_gc;
			sleep_cpu();
		} else {
			if(!(PORTA.IN & (_BV(5) | _BV(7)))) {
				waitforrelease(_BV(5) | _BV(7));

				setup_menu();
			}

			if(!(PORTA.IN & (_BV(5) | _BV(6)))) {
				waitforrelease(_BV(5) | _BV(6));

				calibration_menu();
			}

			if(clockupdated & 1) {
				fastsysclk();
				
				cls();

				drawclock(hour, minute, second, CLOCK_Y);

				min_sprintf(buf, "%e, %d %e", EE_daylist + weekday, day, EE_monthlist + month, year); 

				drawstr(buf, STR_CENTER, 44);

				refresh();

				clockupdated &= ~1;
			}
		}
	}
}
