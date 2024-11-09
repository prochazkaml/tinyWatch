#include "clock.h"
#include "chargen.h"
#include <stdint.h>

void clock_draw(uint8_t h, uint8_t m, uint8_t s, uint8_t y) {
	char_draw_large(h / 10, CLOCK_X + 0, y);
	char_draw_large(h % 10, CLOCK_X + 16, y);
	if(!(s & 1)) char_draw_large(10, CLOCK_X + 32, y);
	char_draw_large(m / 10, CLOCK_X + 40, y);
	char_draw_large(m % 10, CLOCK_X + 56, y);
	if(!(s & 1)) char_draw_large(10, CLOCK_X + 72, y);
	char_draw_large(s / 10, CLOCK_X + 80, y);
	char_draw_large(s % 10, CLOCK_X + 96, y);
}

