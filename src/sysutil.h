#ifndef _SYSUTIL
#define _SYSUTIL

#define PROTECTED_WRITE _PROTECTED_WRITE

#include <stdint.h>

void sys_init();
void sys_sleep();
void sys_delay(uint8_t ms);
void sys_cpu_clock_fast();
void sys_cpu_clock_slow();
char nibble_to_hex(uint8_t nibble);
uint8_t get_month_length(uint8_t month, uint8_t year);

#endif

