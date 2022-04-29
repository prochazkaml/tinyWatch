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

void min_sprintf(char *dest, char *fmt, ...) {
	va_list ap;
	va_start(ap, fmt);

	char c, p;
	
	while(c = *fmt++) {
		if(c == '%') {
			switch (p = *fmt++) {
				case 's':
					char *s = va_arg(ap, char *);

					while(p = *s++) {
						*dest++ = p;
					}

					break;

				case 'd':
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

				case 'e':
					dest += eeprom_read_table_string(va_arg(ap, int), dest);
					break;

/*				case 'c':
					char c = (char) va_arg(ap, int);
					printf("char %c\n", c);
					break;*/

				default:
					*dest++ = p;
			}
		} else {
			*dest++ = c;
		}
	}

	*dest = 0;
}