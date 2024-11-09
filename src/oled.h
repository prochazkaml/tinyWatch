#ifndef _OLED
#define _OLED

#include <stdint.h>

void oled_init();
void oled_deinit();
void oled_refresh();
void oled_write_pixel(uint8_t x, uint8_t y, uint8_t c);
void oled_set_pixel(uint8_t x, uint8_t y);
void oled_clear_pixel(uint8_t x, uint8_t y);
void oled_clear_framebuffer();

#endif

