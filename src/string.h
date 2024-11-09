#ifndef _STRING
#define _STRING

#include <stdint.h>

const char *string_get_day_of_week(int day);
const char *string_get_month(int month);
char *string_format(char *fmt, ...);

#endif

