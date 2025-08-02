use avr_device::attiny1614::{Peripherals, PORTB, TWI0};

pub struct I2cIO<'a> {
	twi: &'a TWI0
}

/// Allows I/O on the I2C driver. Can only be obtained by initalizing a transaction.
impl<'a> I2cIO<'a> {
	/// Writes a byte onto the I2C bus.
	pub fn write(&self, val: u8) {
		self.twi.mdata.write(|reg| reg.bits(val));

		loop {
			let status = self.twi.mstatus.read();

			if status.rxack().bit_is_set() || status.wif().bit_is_set() { break }
		}
	}
}

pub struct I2cDriver<'a> {
	port: &'a PORTB,
	twi: &'a TWI0
}

/// Simple I2C driver. Hard-coded to run on pins PB0 and PB1 and use the TWI0 peripheral.
/// Loosely based on https://www.avrfreaks.net/comment/2390341#comment-2390341
impl<'a> I2cDriver<'a> {
	/// Initializes the I2C driver.
	pub fn init(peri: &'a Peripherals) -> Self {
		let port = &peri.PORTB;
		let twi = &peri.TWI0;

		// Set the I2C lines to inputs with internal pullups

		port.dirclr.write(|reg| reg
			.pb0().set_bit()
			.pb1().set_bit());

		port.pin0ctrl.write(|reg| reg.pullupen().set_bit());
		port.pin1ctrl.write(|reg| reg.pullupen().set_bit());

		// Around 266 kHz

		twi.mbaud.write(|reg| reg.bits(3));

		// Enable TWI Master & Smart Mode
		
		twi.mctrla.write(|reg| reg
			.enable().set_bit()
			.smen().set_bit());

		// Purge MADDR & MDATA

		twi.mctrlb.write(|reg| reg.flush().set_bit());

		// Force TWI state machine into the IDLE state
		
		twi.mstatus.write(|reg| reg.busstate().idle());
		twi.mstatus.write(|reg| reg
			.rif().set_bit()
			.wif().set_bit());

		Self { port, twi }
	}

	/// Starts an I2C transaction.
	pub fn transaction<F>(&self, addr: u8, fun: F)
	where
		F: FnOnce(I2cIO)
	{
		self.twi.mctrlb.modify(|_, reg| reg.ackact().ack());
		self.twi.maddr.write(|reg| reg.bits(addr << 1));

		loop {
			let status = self.twi.mstatus.read();

			if status.wif().bit_is_set() { break }
		}

		fun(I2cIO { twi: self.twi });

		self.twi.mctrlb.write(|reg| reg
			.ackact().nack()
			.mcmd().stop());
	}
}

impl<'a> Drop for I2cDriver<'a> {
	fn drop(&mut self) {
		// Disable the I2C lines, drive them low
		
		self.port.pin0ctrl.write(|reg| reg);
		self.port.pin1ctrl.write(|reg| reg);

		self.port.outclr.write(|reg| reg
			.pb0().set_bit()
			.pb1().set_bit());

		self.port.dirset.write(|reg| reg
			.pb0().set_bit()
			.pb1().set_bit());
	}
}

