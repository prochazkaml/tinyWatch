#ifndef _CHARGEN
#define _CHARGEN

#define STR_CENTER 255

#include <stdint.h>

uint8_t char_len(char c);
uint8_t char_draw(char c, uint8_t x, uint8_t y);
uint8_t char_string_len(const char *c);
void char_string_draw(const char *c, uint8_t x, uint8_t y);
void char_draw_large(char c, uint8_t x, uint8_t y);

#endif

