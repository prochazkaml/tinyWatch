use avr_device::attiny1614::Peripherals;

pub fn delay(ms: usize) {
	for _ in 0..ms {
		avr_device::asm::delay_cycles(5000); // At 5 MHz
	}
}

pub fn low_power_delay(ms: usize) {
	for _ in 0..ms {
		avr_device::asm::delay_cycles(312); // At 312.5 kHz-ish
	}
}

#[inline]
pub fn access_protected_io(peri: &Peripherals) {
	peri.CPU.ccp.write(|reg| reg.ccp().ioreg());
}

/// Puts the CPU into high-performance mode (5 MHz).
pub fn enter_high_performance(peri: &Peripherals) {
	access_protected_io(peri);
	peri.CLKCTRL.mclkctrlb.write(|reg| reg
		.pdiv()._4x()
		.pen().set_bit());
}

/// Puts the CPU into low-power mode (312.5 kHz).
pub fn enter_low_power(peri: &Peripherals) {
	access_protected_io(peri);
	peri.CLKCTRL.mclkctrlb.write(|reg| reg
		.pdiv()._64x()
		.pen().set_bit());
}

/// Initializes the microcontroller.
pub fn init(peri: &Peripherals) {
	// Set correct interrupt location

	access_protected_io(peri);
	peri.CPUINT.ctrla.write(|reg| reg.ivsel().set_bit());

	// Set pullups on all pins, otherwise they will oscillate → consume power

	peri.PORTA.dir.write(|reg| reg
		.pa0().clear_bit()
		.pa1().clear_bit()
		.pa2().clear_bit()
		.pa3().clear_bit()
		.pa4().clear_bit()
		.pa5().clear_bit()
		.pa6().clear_bit()
		.pa7().clear_bit());

	peri.PORTB.dir.write(|reg| reg
		.pb0().clear_bit()
		.pb1().clear_bit()
		.pb2().clear_bit()
		.pb3().clear_bit());

	// TODO - is there a less retarded way to do all of this?
	// the assembly for the following looks about as you would expect

	peri.PORTA.pin0ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTA.pin1ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTA.pin2ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTA.pin3ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTA.pin4ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTA.pin5ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTA.pin6ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTA.pin7ctrl.write(|reg| reg.pullupen().set_bit());

	peri.PORTB.pin0ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTB.pin1ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTB.pin2ctrl.write(|reg| reg.pullupen().set_bit());
	peri.PORTB.pin3ctrl.write(|reg| reg.pullupen().set_bit());
}

/// Enters sleep mode. Will wake up with the next interrupt.
pub fn sleep(peri: &Peripherals) {
	// Enable standby mode
	
	peri.SLPCTRL.ctrla.write(|reg| reg
		.smode().stdby()
		.sen().set_bit());

	avr_device::asm::sleep();
}

