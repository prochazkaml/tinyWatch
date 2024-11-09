#ifndef _SYSUTIL
#define _SYSUTIL

#define EEBYTE(addr) (*((uint8_t *)(0x1400 + (addr))))
#define PROTECTED_WRITE _PROTECTED_WRITE

#define EE_hexlist 0x00
#define EE_monthlengths 0x10
#define EE_daylist 0x1C
#define EE_monthlist 0x23
#define EE_setuplist 0x2F

#include <stdint.h>

void sys_init();
void sys_sleep();
void sys_delay(uint8_t ms);
void sys_cpu_clock_fast();
void sys_cpu_clock_slow();

#endif

