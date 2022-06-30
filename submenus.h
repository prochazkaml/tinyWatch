uint8_t pressed[3] = { 0 };

void update_buttons() {
	asm volatile (
		"ldi r18, (1 << 5)\n" // Bit mask

		"update_buttons_loop:\n"
			"in r19, %[REG_PRESSEDMATRIX]\n" // Read the button status
			"com r18\n" // Automatically assume this button is not freshly pressed
			"and r19, r18\n"
			"com r18\n"

			// Read from the I/O port & mask our requested bit off
			"in r24, %[REG_INPUT]\n"
			"and r24, r18\n"

			"ld r24, Z\n" // Pre-load the current debounce counter value, it is going to be useful later

			"brne update_buttons_depressed\n"

			"tst r24\n" // Is the button freshly pressed (i.e. has the debounce counter timed out)?
			"brne update_buttons_no_set_bit\n"

			"or r19, r18\n" // It is freshly pressed!

		"update_buttons_no_set_bit:\n"
			"ldi r24, 30\n" // Reset the button debounce counter

		"update_buttons_depressed:\n"
			"dec r24\n" // Pre-decrement the value

			"sbrc r24, 7\n" // If the number has gone negative, reset it to 0
			"clr r24\n"

			"st Z+, r24\n" // Write the updated debounce counter

			"out %[REG_PRESSEDMATRIX], r19\n" // Store the new button status

			"lsl r18\n" // Shift to the next bit, run again if necessary
			"brne update_buttons_loop\n"
		::
		"z" (pressed),
		[REG_PRESSEDMATRIX] "i" (&pressed_matrix),
		[REG_INPUT] "i" (&VPORTA_IN)
	);

	delay_ms(1);
}

typedef struct {
	volatile uint8_t *val;
	uint8_t min, max;
} setupdata_t;

const setupdata_t setupdata[] = {
	{ &hour, 0, 23 },
	{ &minute, 0, 59 },
	{ &second, 0, 59 },
	{ &weekday, 0, 6 },
	{ &day, 1, 31 },
	{ &month, 0, 11 },
	{ &year, 0, 99 }
};

static inline void setup_menu() {
	asm volatile ("inline_setup_menu:\n");

	RTC.CTRLA &= ~RTC_RTCEN_bm;

	int8_t needsrefresh, currentval, min, max;

	for(uint8_t i = 0; i < 7; i++) {
		needsrefresh = 1;
		currentval = *setupdata[i].val;
		min = setupdata[i].min;
		max = setupdata[i].max;

		while(1) {
			if(needsrefresh) {
				cls();

				eeprom_read_table_string(EE_setuplist + i, buf);
				drawstr(buf, STR_CENTER, 0);

				for(uint8_t p = 0; p < 128; p++) {
					buffer[p + 128] = 0x02;
				}

				switch(i) {
					case 3: // Weekday selection
						eeprom_read_table_string(EE_daylist + currentval, buf);
						drawstr(buf, STR_CENTER, 33);
						break;

					case 5: // Month selection
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

			if(ispressed(0)) {
				currentval--;
				needsrefresh = 1;

				if(currentval < min) currentval = max;
			}

			if(ispressed(2)) {
				currentval++;
				needsrefresh = 1;

				if(currentval > max) currentval = min;
			}

			if(ispressed(1)) {
				*setupdata[i].val = currentval;
				break;
			}
		}
	}

	RTC.CNT = 0;
	clockupdated |= 1;

	RTC.CTRLA |= RTC_RTCEN_bm;
	wakeuptimeout = WUT_MAXTIMEOUT;

	asm volatile ("inline_setup_menu_end:\n");
}

static inline void calibration_menu() {
	asm volatile ("inline_calibration_menu:\n");
	uint16_t val = RTC.PER;

	int8_t needsrefresh = 1, cursor = 0, selected = 0;

	for(uint8_t i = 0; i < 4; i++) {
		buf[3 - i] = val & 0xF;

		val >>= 4;
	}

	while(1) {
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
			if(ispressed(0)) {
				buf[cursor]--;
				if(buf[cursor] < 0) buf[cursor] = 0xF;
				needsrefresh = 1;
			}

			if(ispressed(2)) {
				buf[cursor]++;
				if(buf[cursor] > 0xF) buf[cursor] = 0;
				needsrefresh = 1;
			}

			if(ispressed(1)) {
				selected = 0;
				needsrefresh = 1;
			}
		} else {
			if(ispressed(0)) {
				cursor--;
				if(cursor < 0) cursor = 4;
				needsrefresh = 1;
			}

			if(ispressed(2)) {
				cursor++;
				if(cursor > 4) cursor = 0;
				needsrefresh = 1;
			}

			if(ispressed(1)) {
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

	asm volatile ("inline_calibration_menu_end:\n");
}

void waitforrelease(uint8_t mask) {
	while((VPORTA_IN & mask) != mask);

	delay_ms(200 / 16);

	fastsysclk();
}
