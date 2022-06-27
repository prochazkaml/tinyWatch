#ifndef SSD1306_MINIMAL_H
#define SSD1306_MINIMAL_H

uint8_t buffer[1024] __attribute__((section (".framebuffer")));

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
	asm volatile ("inline_oled_init:\n");

	I2C_WRAPPER_init();

	for(uint8_t i = 0; i < sizeof(initialization); i++) {
		I2C_WRAPPER_beginTransmission();
		I2C_WRAPPER_write(0x80);
		I2C_WRAPPER_write(initialization[i]);
		I2C_WRAPPER_endTransmission();
	}

	asm volatile ("inline_oled_init_end:\n");
}

void refresh() {
	asm volatile(
		"refresh_outer_loop:\n"
			"rcall I2C_WRAPPER_beginTransmission\n"

			"ldi r24, 0x40\n" // OLED data write command
			"rcall I2C_WRAPPER_write\n"

			"ldi r25, 16\n" // Counter

		"refresh_inner_loop:\n"
			"ld r24, Y+\n"
			"rcall I2C_WRAPPER_write\n"

			"dec r25\n"
			"brne refresh_inner_loop\n"

		"refresh_end:\n" // End transmission
			"ldi r24, %[I2C_END_VAL]\n"
			"sts %[I2C_END_REG], r24\n"

			"cpi YH, 0x3C\n" // Frame buffer end, only need to check the high byte
			"brne refresh_outer_loop\n"
		::
		"y" (buffer),
		[I2C_END_REG] "i" (&TWI0.MCTRLB),
		[I2C_END_VAL] "M" (TWI_ACKACT_NACK_gc | TWI_MCMD_STOP_gc)
	);
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
	asm volatile(
		"cls_clear_loop:\n"
			"st X+, r1\n"
			"cpi XH, 0x3C\n"
			"brne cls_clear_loop\n"
		::
		"x" (buffer)
	);
}

#endif
