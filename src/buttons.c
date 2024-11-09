#include "buttons.h"
#include "sysutil.h"
#include <avr/io.h>
#include <stdint.h>

uint8_t button_pressed_timers[3] = { 0 };

void buttons_update() {
	for(uint8_t b = 0; b < 3; b++) {
		if(!(VPORTA_IN & _BV(b + 5))) {
			if(!button_pressed_timers[b])
				pressed_matrix |= _BV(b + 5);
			else
				pressed_matrix &= ~(_BV(b + 5));
			button_pressed_timers[b] = 30;
		} else {
			if(button_pressed_timers[b]) button_pressed_timers[b]--;
			pressed_matrix &= ~(_BV(b + 5));
		}
	}

	sys_delay(1);
}

