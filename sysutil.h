#define EEBYTE(addr) (*((uint8_t *)(0x1400 + (addr))))

// r2 is already loaded with 0xD8 (provided by crtattiny1614.o)

#define PROTECTED_WRITE(reg, value) \
	__asm__ __volatile__( \
		"out %[ccp], r2\n" \
    	"sts %[ioreg], %[val]" \
		:: \
		[ccp] "I" (_SFR_IO_ADDR(CCP)), \
        [ioreg] "n" (_SFR_MEM_ADDR(reg)), \
        [val] "r" ((uint8_t)value) \
	)


void delay_ms(uint8_t ms) {
	while(ms--) {
		_delay_us(997); // 2 bytes smaller than _delay_ms(1) :)
	}
}

void fastsysclk() {
	PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_4X_gc | CLKCTRL_PEN_bm);
}

void slowsysclk() {
	PROTECTED_WRITE(CLKCTRL_MCLKCTRLB, CLKCTRL_PDIV_64X_gc | CLKCTRL_PEN_bm);
}
