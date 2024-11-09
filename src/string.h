#ifndef _STRING
#define _STRING

#include <stdint.h>

char *string_read_from_eeprom(uint8_t key);
char *string_format(char *fmt, ...);

#endif

