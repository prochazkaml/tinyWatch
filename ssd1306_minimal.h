#ifndef SSD1306_MINIMAL_H
#define SSD1306_MINIMAL_H

const unsigned char initialization[] = {
	// Display off
	0xAE,

	// Set display clock divide ratio
	0xD5, 0x80,

	// Set multiplex ratio
	0xA8, 64 - 1,

	// Set display offset
	0xD3, 0x00,

	// Set start line
	0x40 | 0,

	// Enable internal pump regulator
	0x8D, 0x14,

	// Set memory mode
	0x20, 0x00,

	// Set segment remap
	0xA0 | 0,

	// Set COM output scan direction
	0xC0,

	// Set COM pins hardware configuration
	0xDA, 0x12,

	// Set contrast
	0x81, 0xCF,

	// Set pre-charge period
	0xD9, 0xF1,

	// Set Vcom deselect level
	0xDB, 0x40,

	// GDDRAM on
	0xA4,

	// Normal (non-inverted display)
	0xA6,

	// Deactivate scroll
	0x2E,

	// OLED display on
	0xAF,

	// Set Memory Addressing Mode to Horizontal Addressing Mode (RESET = Page Addressing Mode)
	0x20, 0x0,
	
	// Reset Column Address (for horizontal addressing)
	0x21, 0, 127,
	
	// Reset Page Address (for horizontal addressing)
	0x22, 0, 7
};

static inline void oled_init() {
	I2C_WRAPPER_init();

	for (uint8_t i = 0; i < sizeof(initialization) - 6; i++) {
		I2C_WRAPPER_beginTransmission();
		I2C_WRAPPER_write(0x80);
		I2C_WRAPPER_write(initialization[i]);
		I2C_WRAPPER_endTransmission();
	}
}

uint8_t buffer[1024];

void refresh() {
	for (uint8_t i = sizeof(initialization) - 6; i < sizeof(initialization); i++) {
		I2C_WRAPPER_beginTransmission();
		I2C_WRAPPER_write(0x80);
		I2C_WRAPPER_write(initialization[i]);
		I2C_WRAPPER_endTransmission();
	}

	unsigned char *p = buffer;
	for (int i = 0; i < 64; i++) {
		I2C_WRAPPER_beginTransmission();
		I2C_WRAPPER_write(0x40);
		for(int i = 0; i < 16; i++) {
			I2C_WRAPPER_write(*p);
			p++;
		}
		I2C_WRAPPER_endTransmission();
	}  
}

void write(uint8_t x, uint8_t y, uint8_t c) {
	char *addr = buffer + (((y & 0x38) << 4) | x);
	uint8_t bit = 1 << (y & 7);

	if(c)
		*addr |= bit;
	else
		*addr &= ~(bit);
}

void set(uint8_t x, uint8_t y) {
	write(x, y, 1);
}

void clr(uint8_t x, uint8_t y) {
	write(x, y, 0);
}

void cls() {
	for(int i = 0; i < 1024; i++) {
		buffer[i] = 0;
	}
}

#endif
