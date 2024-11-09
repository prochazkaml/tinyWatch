#include "string.h"
#include "sysutil.h"
#include <stdint.h>
#include <stdarg.h>

char eepbuf[64];

char *string_read_from_eeprom(uint8_t key) {
	char *dest = eepbuf;

	uint8_t start = EEBYTE(key), len = 0;

	char c;

	while((c = EEBYTE(start++))) {
		*dest++ = c;
		len++;
	}

	*dest = 0;

	return eepbuf;
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

			case '\x03': // %s from EEPROM
				s = string_read_from_eeprom(va_arg(ap, int));
				
				while((p = *s++)) {
					*dest++ = p;
				}

				break;

			case '\x04': // %c
				*dest++ = (char)va_arg(ap, int);
				break;

			default:
				*dest++ = c;
		}
	}

	*dest = 0;

	return buf;
}

