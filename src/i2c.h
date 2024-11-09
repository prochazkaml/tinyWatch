#ifndef _I2C
#define _I2C

#define I2C_OLED_ADDR (0x3c << 1)

#include <stdint.h>

void i2c_init();
void i2c_deinit();
void i2c_begin_transmission(uint8_t addr);
void i2c_write_byte(uint8_t data);
void i2c_end_transmission();

#endif

