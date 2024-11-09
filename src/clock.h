#ifndef _CLOCK
#define _CLOCK

#include <stdint.h>

#define CLOCK_X ((128 - 112 + 3) / 2)
#define CLOCK_Y 12

void clock_draw(uint8_t h, uint8_t m, uint8_t s, uint8_t y);

#endif

