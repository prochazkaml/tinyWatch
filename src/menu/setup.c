#include "setup.h"
#include "../rtc.h"
#include "../oled.h"
#include "../chargen.h"
#include "../buttons.h"
#include "../string.h"
#include "../clock.h"
#include <stdint.h>

typedef struct {
	const char *title;
	volatile uint8_t *val;
	uint8_t min, max;
} setupdata_t;

const char string_setup_hour[] = "Hours";
const char string_setup_minutes[] = "Minutes";
const char string_setup_seconds[] = "Seconds";
const char string_setup_weekday[] = "Weekday";
const char string_setup_day[] = "Day";
const char string_setup_month[] = "Month";
const char string_setup_year[] = "Year";

const setupdata_t setupdata[] = {
	{ string_setup_hour, &hour, 0, 23 },
	{ string_setup_minutes, &minute, 0, 59 },
	{ string_setup_seconds, &second, 0, 59 },
	{ string_setup_weekday, &weekday, 0, 6 },
	{ string_setup_day, &day, 1, 31 },
	{ string_setup_month, &month, 0, 11 },
	{ string_setup_year, &year, 0, 99 }
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

				char_string_draw(setupdata[i].title, STR_CENTER, 0);

				for(uint8_t p = 0; p < 128; p++) {
					oled_set_pixel(p, 9);
				}

				switch(i) {
					case 3: // Weekday selection
						char_string_draw(string_get_day_of_week(currentval), STR_CENTER, 33);
						break;

					case 5: // Month selection
						char_string_draw(string_get_month(currentval), STR_CENTER, 33);
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


