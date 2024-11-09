#include <avr/io.h>
#include <stdint.h>

#include "buttons.h"
#include "rtc.h"
#include "i2c.h"
#include "oled.h"
#include "clock.h"
#include "string.h"
#include "chargen.h"
#include "sysutil.h"

#include "menu/calibration.h"
#include "menu/setup.h"

int main() {
	sys_init();
	rtc_init();

	while(1) {
		sys_cpu_clock_slow();

		if(rtc_just_woke_up()) {
			sys_cpu_clock_fast();
			i2c_init();
			oled_init();
			continue;
		}
		
		if(rtc_should_go_to_sleep()) {
			oled_deinit();
			i2c_deinit();
			sys_sleep();
			continue;
		}

		bool update = rtc_updated();

		if(button_is_held_down(0) && button_is_held_down(2)) {
			while(button_is_held_down(0) && button_is_held_down(2));
			sys_delay(250 / 16);

			sys_cpu_clock_fast();
			menu_setup();

			update = true;
		}

		if(button_is_held_down(0) && button_is_held_down(1)) {
			while(button_is_held_down(0) && button_is_held_down(1));
			sys_delay(250 / 16);

			sys_cpu_clock_fast();
			menu_calibration();

			update = true;
		}

		if(update) {
			sys_cpu_clock_fast();
			
			oled_clear_framebuffer();

			clock_draw(hour, minute, second, CLOCK_Y);

			char *str = string_format("\x03, \x02 \x03", EE_daylist + weekday, day, EE_monthlist + month); 
			char_string_draw(str, STR_CENTER, 44);

			oled_refresh();
		}
	}
}

