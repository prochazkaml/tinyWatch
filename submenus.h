uint8_t pressed[6] = { 0 };

void update_buttons() {
	for(uint8_t b = 0; b < 3; b++) {
		if(!(VPORTA_IN & _BV(b + 5))) {
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

	int8_t needsrefresh = 1, done = 0, cursor = 0, selected = 0;

	for(uint8_t i = 0; i < 4; i++) {
		buf[3 - i] = val & 0xF;

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
				drawchar(EEBYTE(EE_hexlist + buf[i]), 64 - 5 * 4 - 3 + i * 5, 33);
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
				buf[cursor]--;
				if(buf[cursor] < 0) buf[cursor] = 0xF;
				needsrefresh = 1;
			}

			if(pressed[2]) {
				buf[cursor]++;
				if(buf[cursor] > 0xF) buf[cursor] = 0;
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
		val |= buf[i];
	}

	RTC.CNT = 0;
	RTC.PER = val;
	wakeuptimeout = WUT_MAXTIMEOUT;
	eeprom_write_word((uint16_t *)(&USERROW.USERROW0 - 0x1400), val);
}

void waitforrelease(uint8_t mask) {
	while((VPORTA_IN & mask) != mask);

	delay_ms(200 / 16);

	fastsysclk();
}
