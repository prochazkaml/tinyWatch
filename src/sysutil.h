#ifndef _SYSUTIL
#define _SYSUTIL

#define PROTECTED_WRITE _PROTECTED_WRITE

#ifndef REVISION
#define REVISION 1001
#endif

#if REVISION == 1
	#define INT_CRYSTAL
	#define OLED_POWER_PORT_DIR VPORTA_DIR
	#define OLED_POWER_PORT_OUT VPORTA_OUT
	#define OLED_POWER_PORT_MASK 0x02
#elif REVISION == 1001
	#define EXT_CRYSTAL
	#define OLED_POWER_PORT_DIR VPORTA_DIR
	#define OLED_POWER_PORT_OUT VPORTA_OUT
	#define OLED_POWER_PORT_MASK 0x02
#elif REVISION == 2
	#define EXT_CRYSTAL
	#define OLED_POWER_PORT_DIR VPORTA_DIR
	#define OLED_POWER_PORT_OUT VPORTA_OUT
	#define OLED_POWER_PORT_MASK 0x10
#else
	#error This revision does not (yet?) exist.
#endif

#include <stdint.h>

void sys_init();
void sys_sleep();
void sys_delay(uint8_t ms);
void sys_cpu_clock_fast();
void sys_cpu_clock_slow();
char nibble_to_hex(uint8_t nibble);
uint8_t get_month_length(uint8_t month, uint8_t year);

#endif

