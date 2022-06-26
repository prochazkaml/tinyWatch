uint8_t eeprom_read_table_string(uint8_t key, char *dest) {
	uint8_t start = EEBYTE(key), len = 0;

	char c;

	while(c = EEBYTE(start++)) {
		*dest++ = c;
		len++;
	}

	*dest = 0;

	return len;
}

void min_sprintf(char *fmt, ...) {
	char *dest = buf;

	va_list ap;
	va_start(ap, fmt);

	char c, p;
	
	while(c = *fmt++) {
		switch(c) {
			case '\x01': // %s
				char *s = va_arg(ap, char *);

				while(p = *s++) {
					*dest++ = p;
				}

				break;

			case '\x02': // %d
				int d = va_arg(ap, int);

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
				dest += eeprom_read_table_string(va_arg(ap, int), dest);
				break;

			case '\x04': // %c
				*dest++ = (char)va_arg(ap, int);
				break;

			default:
				*dest++ = c;
		}
	}

	*dest = 0;
}
