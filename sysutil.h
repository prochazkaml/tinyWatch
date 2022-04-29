#define EEBYTE(addr) (*((uint8_t *)(0x1400 + (addr))))

void delay_ms(uint8_t ms) {
	while(ms--) {
		_delay_us(995); // 2 bytes smaller than _delay_ms(1) :)
	}
}

void fastsysclk() {
	_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_6X_gc | CLKCTRL_PEN_bm);
}

void slowsysclk() {
	_PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_64X_gc | CLKCTRL_PEN_bm);
}
