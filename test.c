#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>

volatile int8_t year = 22, month = 0, day = 1, weekday = 1, hour = 12, minute = 0, second = 0;

const char *weekdays[7] = {
	"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
};

const char *months[12] = {
	"January", "February", "March", "April",
	"May", "June", "July", "August",
	"September", "October", "November", "December"
};

int min_sprintf(char *dest, char *fmt, ...) {
    char *og_dest = dest;
	
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

/*				case 'c':
					char c = (char) va_arg(ap, int);
					printf("char %c\n", c);
					break;*/

				default:
					*dest++ = p;
			}

//			*dest++ = c;
		} else {
			*dest++ = c;
		}
	}

	*dest = 0;

	return *dest - *og_dest;
}

int main() {
	char buf[64];

	min_sprintf(buf, "%s, %d %s", weekdays[weekday], day, months[month], year); 

	printf("%s\n", buf);
}