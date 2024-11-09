#include "oled.h"
#include "i2c.h"
#include "sysutil.h"
#include <stdint.h>
#include <avr/io.h>

uint8_t buffer[1024];

const uint8_t oled_init_bytes[] = {
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

void oled_init() {
	// Turn on the display

	OLED_POWER_PORT_DIR |= OLED_POWER_PORT_MASK;
	OLED_POWER_PORT_OUT |= OLED_POWER_PORT_MASK;

	sys_delay(150);

	// Initialize the OLED

	for(uint8_t i = 0; i < sizeof(oled_init_bytes); i++) {
		i2c_begin_transmission(I2C_OLED_ADDR);
		i2c_write_byte(0x80);
		i2c_write_byte(oled_init_bytes[i]);
		i2c_end_transmission();
	}
}

void oled_deinit() {
	// Turn off the display

	OLED_POWER_PORT_OUT &= ~OLED_POWER_PORT_MASK;
}

void oled_refresh() {
	for (uint8_t i = sizeof(oled_init_bytes) - 6; i < sizeof(oled_init_bytes); i++) {
		i2c_begin_transmission(I2C_OLED_ADDR);
		i2c_write_byte(0x80);
		i2c_write_byte(oled_init_bytes[i]);
		i2c_end_transmission();
	}

	unsigned char *p = buffer;
	for (int i = 0; i < 64; i++) {
		i2c_begin_transmission(I2C_OLED_ADDR);
		i2c_write_byte(0x40);
		for(int i = 0; i < 16; i++) {
			i2c_write_byte(*p++);
		}
		i2c_end_transmission();
	}
}

void oled_write_pixel(uint8_t x, uint8_t y, uint8_t c) {
	uint8_t *addr = buffer + (((y & 0x38) << 4) | x);
	uint8_t bit = 1 << (y & 7);

	if(c)
		*addr |= bit;
	else
		*addr &= ~(bit);
}

void oled_set_pixel(uint8_t x, uint8_t y) {
	oled_write_pixel(x, y, 1);
}

void oled_clear_pixel(uint8_t x, uint8_t y) {
	oled_write_pixel(x, y, 0);
}

void oled_clear_framebuffer() {
	for(uint8_t *i = buffer; i < buffer + sizeof(buffer); i++) {
		*i = 0;
	}
}

