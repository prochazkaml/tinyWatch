#include <stdio.h>
#include "thiccfont.h"

int main() {
	int ch, c, i, i2, x, y;

	char buffer[48 * 24];

	for(ch = 0; ch < 11; ch++) {
		c = ch;

		for(i = 0; i < 24 * 48; i++) buffer[i] = '.';

		const uint8_t *addr = bigfont + 11 + bigfont[ch];

		i = 0, i2 = 0;

		uint8_t b, bak, skip = 0;

		while(1) {
			if(skip) {
				skip--;
			} else {
				bak = b = *addr++;

				if(i2 == 2) {
					bak >>= 4;
					b &= 0x0F;
				} else {
					bak = 0;
				}

				for(uint8_t j = 0; j < 8; j++) {
					if(b & 1) {
						buffer[i + (j + (i2 << 3)) * 48] = '#';

						for(x = 0; x < 3; x++) {
							buffer[24 + x + i + (j + (i2 << 3)) * 48] = '#';
						}
					}

					b >>= 1;
				}

				if(bak) {
					if(bak == 0xF) { // Character delimeter
						break;
					} else {
						skip = bak;
					}
				}
			}

			if(++i2 >= 3) {
				i2 = 0;
				i++;
			}
		}

		for(y = 0; y < 24; y++) {
			for(x = 0; x < 48; x++) {
				if(buffer[x + y * 48] == '#') {
					printf("[]");
				} else {
					printf("..");
				}
			}

			putchar('\n');
		}

		printf("---\n");
	}
}