#include "string.h"
#include <stdint.h>
#include <stdarg.h>

const char string_err[] = "[ERROR]";

const char string_mon[] = "Monday";
const char string_tue[] = "Tuesday";
const char string_wed[] = "Wednesday";
const char string_thu[] = "Thursday";
const char string_fri[] = "Friday";
const char string_sat[] = "Saturday";
const char string_sun[] = "Sunday";

const char *string_days[] = {
	string_mon,
	string_tue,
	string_wed,
	string_thu,
	string_fri,
	string_sat,
	string_sun,
};

const char string_jan[] = "January";
const char string_feb[] = "February";
const char string_mar[] = "March";
const char string_apr[] = "April";
const char string_may[] = "May";
const char string_jun[] = "June";
const char string_jul[] = "July";
const char string_aug[] = "August";
const char string_sep[] = "September";
const char string_oct[] = "October";
const char string_nov[] = "November";
const char string_dec[] = "December";

const char *string_months[] = {
	string_jan,
	string_feb,
	string_mar,
	string_apr,
	string_may,
	string_jun,
	string_jul,
	string_aug,
	string_sep,
	string_oct,
	string_nov,
	string_dec,
};

const char *string_get_day_of_week(int day) {
	if(day < 0 || day > 6) return string_err;

	return string_days[day];
}

const char *string_get_month(int month) {
	if(month < 0 || month > 11) return string_err;

	return string_months[month];
}

char buf[64];

char *string_format(char *fmt, ...) {
	char *dest = buf;

	va_list ap;
	va_start(ap, fmt);

	char c, p;
	int8_t d;
	char *s;
	
	while((c = *fmt++)) {
		switch(c) {
			case '\x01': // %s
				s = va_arg(ap, char *);

				while((p = *s++)) {
					*dest++ = p;
				}

				break;

			case '\x02': // %d
				d = va_arg(ap, int);

				if(d < 0) {
					*dest++ = '-';
					d *= (-1);
				}

				char buf[6];

				buf[0] = '0';
				char max = 0;

				while(d > 0) {
					buf[max++] = '0' + d % 10;

					d /= 10;
				}

				if(!max) max = 1;

				for(char i = max - 1; i >= 0; i--) {
					*dest++ = buf[i];
				}

				break;

			case '\x03': // %c
				*dest++ = (char)va_arg(ap, int);
				break;

			default:
				*dest++ = c;
		}
	}

	*dest = 0;

	return buf;
}

