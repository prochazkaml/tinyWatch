#ifndef _CONFIG
#define _CONFIG

#include <stdint.h>

uint16_t config_read_rtc_calibration();
void config_save_rtc_calibration(uint16_t val);

#endif

