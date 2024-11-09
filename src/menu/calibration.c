#include "calibration.h"
#include "../oled.h"
#include "../chargen.h"
#include "../sysutil.h"
#include "../buttons.h"
#include "../config.h"
#include "../rtc.h"
#include <avr/io.h>
#include <avr/eeprom.h>
#include <stdint.h>

void menu_calibration() {
	rtc_pause();

	uint16_t val = config_read_rtc_calibration();

	int8_t needsrefresh = 1, cursor = 0, selected = 0;
	uint8_t buf[4];

	for(uint8_t i = 0; i < 4; i++) {
		buf[3 - i] = val & 0xF;

		val >>= 4;
	}

	while(1) {
		if(needsrefresh) {
			oled_clear_framebuffer();

			char_string_draw("Oscillator calibration", STR_CENTER, 0);

			for(uint8_t p = 0; p < 128; p++) {
				oled_set_pixel(p, 9);
			}

			uint16_t tmpval = val;

			for(uint8_t i = 0; i < 4; i++) {
				char_draw(EEBYTE(EE_hexlist + buf[i]), 64 - 5 * 4 - 3 + i * 5, 33);
			}

			char_string_draw("Done", 64 + 3, 33);

			if(cursor < 4) {
				for(uint8_t y = (selected ? 33 - 3 : 33 + 9); y <= 33 + 9; y += 12) {
					for(uint8_t i = 0; i < 4; i++) {
						oled_set_pixel(64 - 5 * 4 - 3 + cursor * 5 + i, y);
					}
				}
			} else {
				for(uint8_t i = 0; i < 4 * 4 + 3; i++) {
					oled_set_pixel(64 + 3 + i, 33 + 9);
				}
			}

			oled_refresh();
			needsrefresh = 0;
		}

		buttons_update();

		if(selected) {
			if(button_is_pressed(0)) {
				buf[cursor]--;
				if(buf[cursor] < 0) buf[cursor] = 0xF;
				needsrefresh = 1;
			}

			if(button_is_pressed(2)) {
				buf[cursor]++;
				if(buf[cursor] > 0xF) buf[cursor] = 0;
				needsrefresh = 1;
			}

			if(button_is_pressed(1)) {
				selected = 0;
				needsrefresh = 1;
			}
		} else {
			if(button_is_pressed(0)) {
				cursor--;
				if(cursor < 0) cursor = 4;
				needsrefresh = 1;
			}

			if(button_is_pressed(2)) {
				cursor++;
				if(cursor > 4) cursor = 0;
				needsrefresh = 1;
			}

			if(button_is_pressed(1)) {
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

	config_save_rtc_calibration(val);

	rtc_reload_config();
	rtc_resume();
	rtc_reset_sleep_counter();
}

