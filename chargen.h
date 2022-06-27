uint8_t charlen(char c) {
	c -= 32;

	if(c & 1)
		return smallfont[c >> 1] & 0xF;
	else
		return smallfont[c >> 1] >> 4;
}

uint8_t drawchar(char c, uint8_t x, uint8_t y) {
	const uint8_t *addr = smallfont + 48;

	uint8_t w = charlen(c);

	while(c-- > 32) addr += charlen(c);

	for(uint8_t i = 0; i < w; i++) {
		uint8_t b = *addr++;

		for(uint8_t j = 0; j < 8; j++) {
			if(b & 1) set(x + i, y + j);
			b >>= 1;
		}
	}

	return w;
}

uint8_t strdrawlen(const char *c) {
	uint8_t x = 0;

	while(*c != 0) {
		x += charlen(*c++) + 1;
	}

	return x - 1;
}

void drawstr(const char *c, uint8_t x, uint8_t y) {
	if(x == STR_CENTER) x = 64 - (strdrawlen(c) >> 1);

	while(*c != 0) {
		x += drawchar(*c++, x, y) + 1;
	}
}

void drawbigchar(char c, uint8_t x, uint8_t y) {
	const uint8_t *addr = bigfont + 11 + bigfont[c];
	
	uint8_t bank = 0, b, bak, skip = 0;

	while(1) {
		if(skip) {
			skip--;
		} else {
			bak = b = *addr++;

			if(bank == 16) {
				bak >>= 4;
				b &= 0x0F;
			} else {
				bak = 0;
			}
			
			for(uint8_t j = 0; j < 8; j++) {
				if(b & 1) {
					for(uint8_t o = 0; o < 3; o++) set(o + x, y + j + bank);
				}
				
				b >>= 1;
			}

			if(bak) {
				if(bak == 0xF)
					break;
				else
					skip = bak;
			}
		}

		bank += 8;

		if(bank >= 24) {
			bank = 0;
			x++;
		}
	}
}

static inline void drawclock(uint8_t h, uint8_t m, uint8_t s, uint8_t y) {
	asm volatile("inline_draw_clock:\n");

	drawbigchar(h / 10, CLOCK_X + 0, y);
	drawbigchar(h % 10, CLOCK_X + 16, y);
	if(!(s & 1)) drawbigchar(10, CLOCK_X + 32, y);
	drawbigchar(m / 10, CLOCK_X + 40, y);
	drawbigchar(m % 10, CLOCK_X + 56, y);
	if(!(s & 1)) drawbigchar(10, CLOCK_X + 72, y);
	drawbigchar(s / 10, CLOCK_X + 80, y);
	drawbigchar(s % 10, CLOCK_X + 96, y);

	asm volatile("inline_draw_clock_end:\n");
}
