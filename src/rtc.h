#ifndef _RTC
#define _RTC

#include <stdint.h>
#include <stdbool.h>

extern volatile uint8_t year, month, day, weekday, hour, minute, second;

void rtc_init();
void rtc_pause();
void rtc_resume();
void rtc_reload_config();
bool rtc_updated();
void rtc_reset_sleep_counter();
bool rtc_just_woke_up();
bool rtc_should_go_to_sleep();

#endif

