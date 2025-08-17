use crate::i2c::I2cDriver;
use crate::system::{peri, delay};

const OLED_I2C_ADDR: u8 = 0x3c;

static mut LCD_BUFFER: [u8; 1024] = [0u8; 1024];

pub struct Oled {
	i2c: I2cDriver
}

pub enum Color {
	Black = 0,
	White = 1
}

const INIT_SEQUENCE: &[u8] = &[
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
	0x20, 0x0
];

const PAGE_START_SEQUENCE: &[u8] = &[
	// Reset Column Address (for horizontal addressing)
	0x21, 0, 127,
	
	// Reset Page Address (for horizontal addressing)
	0x22, 0, 7
];

/// Simple SSD1305/6? OLED driver. Hard-coded for the power enable pin on PA1.
impl Oled {
	/// Initializes the display.
	pub fn init(i2c: I2cDriver) -> Self {
		let port = peri().PORTA;

		// Enable power to the display

		port.dirset.write(|reg| reg.pa4().set_bit());
		port.outset.write(|reg| reg.pa4().set_bit());

		delay(50); // Good enough

		// Initialize the OLED

		for byte in INIT_SEQUENCE {
			i2c.transaction(OLED_I2C_ADDR, |io| {
				io.write(0x80);
				io.write(*byte);
			});
		}

		Self {
			i2c
		}
	}

	/// Refreshes the contents of the frame buffer to the screen.
	pub fn refresh(&self) {
		for byte in PAGE_START_SEQUENCE {
			self.i2c.transaction(OLED_I2C_ADDR, |io| {
				io.write(0x80);
				io.write(*byte);
			});
		}

		for y in 0..64 {
			self.i2c.transaction(OLED_I2C_ADDR, |io| {
				io.write(0x40);

				for x in 0..16 {
					io.write(unsafe { LCD_BUFFER[y * 16 + x] });
				}
			});
		}
	}

	/// Writes a single pixel to the frame buffer.
	pub fn write_pixel(&mut self, x: u8, y: u8, color: Color) {
		let offset = x as usize | ((y as usize & 0x38) << 4);
		let bit = 1 << (y & 7);

		unsafe {
			match color {
				Color::Black => LCD_BUFFER[offset] &= !bit,
				Color::White => LCD_BUFFER[offset] |= bit
			}
		}
	}

	/// Writes a single white pixel to the frame buffer.
	pub fn set_pixel(&mut self, x: u8, y: u8) {
		self.write_pixel(x, y, Color::White);
	}

	/// Writes a single black pixel to the frame buffer.
	pub fn clear_pixel(&mut self, x: u8, y: u8) {
		self.write_pixel(x, y, Color::Black);
	}

	/// Clears the framebuffer with black pixels.
	pub fn clear_framebuffer(&mut self) {
		unsafe { (&mut *(&raw mut LCD_BUFFER)).fill(0); }
	}
}

impl Drop for Oled {
	fn drop(&mut self) {
		// Turn off the display

		peri().PORTA.outclr.write(|reg| reg.pa4().set_bit());
	}
}

