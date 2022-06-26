#include <stdio.h>
#include "thiccfont.h"

int main() {
	int ch, c, i, x, y;

	char buffer[48 * 24];

	for(ch = 0; ch < 11; ch++) {
		c = ch;

		for(i = 0; i < 24 * 48; i++) buffer[i] = '.';

		const uint8_t *addr = bigfont + 11;

		uint8_t w = bigfont[c];

		while(c--) addr += bigfont[c] * 3;

		for(uint8_t i = 0; i < w; i++) {
			for(uint8_t i2 = 0; i2 < 3; i2++) {
				uint8_t b = *addr++;

				for(uint8_t j = 0; j < 8; j++) {
					if(b & 1) {
						buffer[i + (j + (i2 << 3)) * 48] = '#';

						for(x = 0; x < 3; x++) {
							buffer[24 + x + i + (j + (i2 << 3)) * 48] = '#';
						}
					}

					b >>= 1;
				}
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