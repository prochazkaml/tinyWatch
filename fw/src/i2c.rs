use crate::system::peri;

pub struct I2cIO {}

/// Allows I/O on the I2C driver. Can only be obtained by initalizing a transaction.
impl I2cIO {
	/// Writes a byte onto the I2C bus.
	pub fn write(&self, val: u8) {
		let twi = peri().TWI0;

		twi.mdata().write(|reg| reg.set(val));

		loop {
			let status = twi.mstatus().read();

			if status.rxack().bit_is_set() || status.wif().bit_is_set() { break }
		}
	}
}

pub struct I2cDriver {}

/// Simple I2C driver. Hard-coded to run on pins PB0 and PB1 and use the TWI0 peripheral.
/// Loosely based on https://www.avrfreaks.net/comment/2390341#comment-2390341
impl I2cDriver {
	/// Initializes the I2C driver.
	pub fn init() -> Self {
		// Set the I2C lines to inputs with internal pullups

		let port = peri().PORTB;
		let twi = peri().TWI0;

		port.dirclr().write(|reg| reg
			.pb0().set_bit()
			.pb1().set_bit());

		port.pin0ctrl().write(|reg| reg.pullupen().set_bit());
		port.pin1ctrl().write(|reg| reg.pullupen().set_bit());

		// Around 266 kHz

		twi.mbaud().write(|reg| reg.set(3));

		// Enable TWI Master & Smart Mode
		
		twi.mctrla().write(|reg| reg
			.enable().set_bit()
			.smen().set_bit());

		// Purge MADDR & MDATA

		twi.mctrlb().write(|reg| reg.flush().set_bit());

		// Force TWI state machine into the IDLE state
		
		twi.mstatus().write(|reg| reg.busstate().idle());
		twi.mstatus().write(|reg| reg
			.rif().set_bit()
			.wif().set_bit());

		Self {}
	}

	/// Starts an I2C transaction.
	pub fn transaction<F>(&self, addr: u8, fun: F)
	where
		F: FnOnce(I2cIO)
	{
		let twi = peri().TWI0;

		twi.mctrlb().modify(|_, reg| reg.ackact().ack());
		twi.maddr().write(|reg| reg.set(addr << 1));

		loop {
			let status = twi.mstatus().read();

			if status.wif().bit_is_set() { break }
		}

		fun(I2cIO {});

		twi.mctrlb().write(|reg| reg
			.ackact().nack()
			.mcmd().stop());
	}
}

impl Drop for I2cDriver {
	fn drop(&mut self) {
		// Disable the I2C lines, drive them low
		
		let port = peri().PORTB;

		port.pin0ctrl().write(|reg| reg);
		port.pin1ctrl().write(|reg| reg);

		port.outclr().write(|reg| reg
			.pb0().set_bit()
			.pb1().set_bit());

		port.dirset().write(|reg| reg
			.pb0().set_bit()
			.pb1().set_bit());
	}
}

