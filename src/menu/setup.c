#include "setup.h"
#include "../rtc.h"
#include "../oled.h"
#include "../chargen.h"
#include "../buttons.h"
#include "../string.h"
#include "../clock.h"
#include "../sysutil.h"
#include <stdint.h>

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

void menu_setup() {
	rtc_pause();

	int8_t needsrefresh, currentval, min, max;

	for(uint8_t i = 0; i < 7; i++) {
		needsrefresh = 1;
		currentval = *setupdata[i].val;
		min = setupdata[i].min;
		max = setupdata[i].max;

		while(1) {
			if(needsrefresh) {
				oled_clear_framebuffer();

				char_string_draw(string_read_from_eeprom(EE_setuplist + i), STR_CENTER, 0);

				for(uint8_t p = 0; p < 128; p++) {
					oled_set_pixel(p, 9);
				}

				switch(i) {
					case 3: // Weekday selection
						char_string_draw(string_read_from_eeprom(EE_daylist + currentval), STR_CENTER, 33);
						break;

					case 5: // Month selection
						char_string_draw(string_read_from_eeprom(EE_monthlist + currentval), STR_CENTER, 33);
						break;

					default:
						char_draw_large(currentval / 10, CLOCK_X + 40, 25);
						char_draw_large(currentval % 10, CLOCK_X + 56, 25);
						break;
				}

				oled_refresh();
				needsrefresh = 0;
			}

			buttons_update();

			if(button_is_pressed(0)) {
				currentval--;
				needsrefresh = 1;

				if(currentval < min) currentval = max;
			}

			if(button_is_pressed(2)) {
				currentval++;
				needsrefresh = 1;

				if(currentval > max) currentval = min;
			}

			if(button_is_pressed(1)) {
				*setupdata[i].val = currentval;
				break;
			}
		}
	}

	rtc_resume();
	rtc_reset_sleep_counter();
}


