use avr_device::attiny1614::Peripherals;

use crate::system;

use num_derive::FromPrimitive;
use num_traits::FromPrimitive;
use ufmt::{uDisplay, Formatter, uWrite};

pub trait RtcValue {
	fn increment(&mut self, data: &RtcData) -> bool;
	fn decrement(&mut self, data: &RtcData) -> bool;
	fn type_name(&self) -> &'static [u8];
}

fn write_double_digit<W>(val: u8, fmt: &mut ufmt::Formatter<'_, W>) -> Result<(), W::Error> where W: ufmt::uWrite + ?Sized {
	unsafe {
		fmt.write_char(char::from_u32_unchecked((b'0' + (val / 10)) as u32))?;
		fmt.write_char(char::from_u32_unchecked((b'0' + (val % 10)) as u32))?;
	}

	Ok(())
}

macro_rules! rtc_number {
	(__gen_base $name:ident => $min:literal..=$max:literal) => {
		#[derive(Clone)]
		pub struct $name {
			val: u8
		}

		impl $name {
			const fn new(val: u8) -> Self {
				Self { val }
			}
		}

		impl crate::rtc::RtcNumber for $name {
			fn type_name(&self) -> &'static [u8] { stringify!($name).as_bytes() }
			fn get_value(&self) -> u8 { self.val }
			fn set_value(&mut self, val: u8) { self.val = val }
			fn min(&self) -> u8 { $min }
			fn max(&self) -> u8 { $max }
		}
	};

	($name:ident => $min:literal..=$max:literal) => {
		rtc_number!(__gen_base $name => $min..=$max);

		impl ufmt::uDisplay for $name {
			fn fmt<W>(&self, fmt: &mut ufmt::Formatter<'_, W>) -> Result<(), W::Error> where W: ufmt::uWrite + ?Sized {
				self.val.fmt(fmt)
			}
		}
	};

	($name:ident => $min:literal..=$max:literal doubledigit) => {
		rtc_number!(__gen_base $name => $min..=$max);

		impl ufmt::uDisplay for $name {
			fn fmt<W>(&self, fmt: &mut ufmt::Formatter<'_, W>) -> Result<(), W::Error> where W: ufmt::uWrite + ?Sized {
				$crate::rtc::write_double_digit(self.val, fmt)
			}
		}
	};
}

rtc_number!(Year => 0..=99);
rtc_number!(Day => 1..=31);
rtc_number!(Hour => 0..=23 doubledigit);
rtc_number!(Minute => 0..=59 doubledigit);
rtc_number!(Second => 0..=59 doubledigit);

pub trait RtcNumber {
	fn type_name(&self) -> &'static [u8];
	fn get_value(&self) -> u8;
	fn set_value(&mut self, val: u8);
	fn min(&self) -> u8;
	fn max(&self) -> u8;
}

impl<T: RtcNumber> RtcValue for T {
	fn increment(&mut self, _data: &RtcData) -> bool {
		if self.get_value() < self.max() {
			self.set_value(self.get_value() + 1);
			false
		} else {
			self.set_value(self.min());
			true
		}
	}

	fn decrement(&mut self, _data: &RtcData) -> bool {
		if self.get_value() > self.min() {
			self.set_value(self.get_value() - 1);
			false
		} else {
			self.set_value(self.max());
			true
		}
	}

	fn type_name(&self) -> &'static [u8] {
	   self.type_name()
	}
}

#[derive(Clone, Copy, FromPrimitive)]
#[repr(u8)]
pub enum Weekday {
	Monday = 0,
	Tuesday = 1,
	Wednesday = 2,
	Thursday = 3,
	Friday = 4,
	Saturday = 5,
	Sunday = 6
}

impl RtcValue for Weekday {
	fn increment(&mut self, _data: &RtcData) -> bool {
		let (next, ovf) = match *self as u8 {
			x @ 0..=5 => (x + 1, false),
			_ => (0, true)
		};

		*self = FromPrimitive::from_u8(next).unwrap();

		ovf
	}

	fn decrement(&mut self, _data: &RtcData) -> bool {
		let (next, ovf) = match *self as u8 {
			x @ 1..=6 => (x - 1, false),
			_ => (6, true)
		};

		*self = FromPrimitive::from_u8(next).unwrap();

		ovf
	}

	fn type_name(&self) -> &'static [u8] {
	   b"Weekday"
	}
}

impl uDisplay for Weekday {
	fn fmt<W>(&self, fmt: &mut Formatter<'_, W>) -> Result<(), W::Error> where W: uWrite + ?Sized {
		let val = match self {
			Weekday::Monday => "Monday",
			Weekday::Tuesday => "Tuesday",
			Weekday::Wednesday => "Wednesday",
			Weekday::Thursday => "Thursday",
			Weekday::Friday => "Friday",
			Weekday::Saturday => "Saturday",
			Weekday::Sunday => "Sunday"
		};

		fmt.write_str(val)
	}
}

#[derive(Clone, Copy, FromPrimitive)]
#[repr(u8)]
pub enum Month {
	January = 1,
	February = 2,
	March = 3,
	April = 4,
	May = 5,
	June = 6,
	July = 7,
	August = 8,
	September = 9,
	October = 10,
	November = 11,
	December = 12
}

impl Month {
	pub fn days(&self, year: u8) -> u8 {
		const DAY_TABLE: [u8; 12] = [
			31, 28, 31, 30, 31, 30,
			31, 31, 30, 31, 30, 31
		];

		let month = *self as u8;

		if year & 3 == 0 && month == 2 { return 29 }

		DAY_TABLE[month as usize - 1]
	}
}

impl RtcValue for Month {
	fn increment(&mut self, _data: &RtcData) -> bool {
		let (next, ovf) = match *self as u8 {
			x @ 1..=11 => (x + 1, false),
			_ => (1, true)
		};

		*self = FromPrimitive::from_u8(next).unwrap();

		ovf
	}
	
	fn decrement(&mut self, _data: &RtcData) -> bool {
		let (next, ovf) = match *self as u8 {
			x @ 2..=12 => (x - 1, false),
			_ => (12, true)
		};

		*self = FromPrimitive::from_u8(next).unwrap();

		ovf
	}

	fn type_name(&self) -> &'static [u8] {
	   b"Month"
	}
}

impl uDisplay for Month {
	fn fmt<W>(&self, fmt: &mut Formatter<'_, W>) -> Result<(), W::Error> where W: uWrite + ?Sized {
		let val = match self {
			Month::January => "January",
			Month::February => "February",
			Month::March => "March",
			Month::April => "April",
			Month::May => "May",
			Month::June => "June",
			Month::July => "July",
			Month::August => "August",
			Month::September => "September",
			Month::October => "October",
			Month::November => "November",
			Month::December => "December"
		};

		fmt.write_str(val)
	}
}

#[derive(Clone)]
pub struct RtcData {
	pub year: Year,
	pub month: Month,
	pub weekday: Weekday,
	pub day: Day,
	pub hour: Hour,
	pub minute: Minute,
	pub second: Second
}

const MAX_TIMEOUT: u8 = 8;

struct RtcInterruptContext {
	updated: bool,
	sleep_timer: u8,
	data: RtcData
}

impl RtcData {
	const fn empty() -> Self {
		RtcData {
			year: Year::new(25),
			month: Month::January,
			weekday: Weekday::Wednesday,
			day: Day::new(1),
			hour: Hour::new(0),
			minute: Minute::new(0),
			second: Second::new(0)
		}
	}

	fn increment(&mut self) {
		let old = self.clone();

		if !self.second.increment(&old) { return }
		if !self.minute.increment(&old) { return }
		if !self.hour.increment(&old) { return }
		
		self.weekday.increment(&old);

		if !self.day.increment(&old) { return }
		if !self.month.increment(&old) { return }
		if !self.year.increment(&old) { return }
	}
}

impl RtcInterruptContext {
	const fn init() -> Self {
		RtcInterruptContext {
			updated: true, // To trigger the initial redraw
			sleep_timer: MAX_TIMEOUT,
			data: RtcData::empty()
		}
	}
}

static mut RTC_DATA: RtcInterruptContext = RtcInterruptContext::init();

pub struct Rtc<'a> {
	peri: &'a Peripherals
}

impl<'a> Rtc<'a> {
	pub fn init(peri: &'a Peripherals) -> Self {
		avr_device::interrupt::free(|_| {
			// Enable the 32.768 kHz clock when in standby

			system::access_protected_io(peri);
			peri.CLKCTRL.xosc32kctrla.write(|reg| reg
				.enable().set_bit()
				.sel().set_bit()
				.runstdby().set_bit());

			// Run the RTC from an external crystal/oscillator

			peri.RTC.clksel.write(|reg| reg.clksel().tosc32k());

			peri.RTC.intctrl.write(|reg| reg.ovf().set_bit());
			peri.RTC.ctrla.write(|reg| reg
				.prescaler().div1()
				.rtcen().set_bit()
				.runstdby().set_bit());
		});

		unsafe { avr_device::interrupt::enable(); }

		let new = Self { peri };

		new.set_oscillator_trim(0x8000); // Default for precise 32.768 kHz

		new
	}

	pub fn switch_to_internal_clock(&self) {
		self.peri.RTC.clksel.write(|reg| reg.clksel().int32k());
		self.peri.CLKCTRL.xosc32kctrla.write(|reg| reg.enable().clear_bit());
		self.peri.CLKCTRL.osc32kctrla.write(|reg| reg.runstdby().set_bit());
	}

	pub fn pause(&self) {
		self.peri.RTC.ctrla.modify(|_, reg| reg.rtcen().clear_bit());
	}

	pub fn resume(&self) {
		self.peri.RTC.cnt.write(|reg| reg.bits(0));
		self.peri.RTC.ctrla.modify(|_, reg| reg.rtcen().set_bit());
	}

	pub fn set_oscillator_trim(&self, trim: u16) {
		self.peri.RTC.cnt.write(|reg| reg.bits(0));
		self.peri.RTC.per.write(|reg| reg.bits(trim));
	}

	pub fn get_oscillator_trim(&self) -> u16 {
		self.peri.RTC.per.read().bits()
	}

	pub fn updated(&self) -> Option<RtcData> {
		// SAFETY: Accesses to the global RTC state are done in a critical section, effectively acting as a mutex.
		avr_device::interrupt::free(|_| unsafe {
			if !RTC_DATA.updated { None? }

			RTC_DATA.updated = false;

			let ctx = &*&raw const RTC_DATA;
			Some(ctx.data.clone())
		})
	}

	pub fn reset_sleep_counter(&self) {
		// SAFETY: Accesses to the global RTC state are done in a critical section, effectively acting as a mutex.
		avr_device::interrupt::free(|_| unsafe {
			RTC_DATA.sleep_timer = MAX_TIMEOUT;
		});
	}

	pub fn should_go_to_sleep(&self) -> bool {
		// SAFETY: Accesses to the global RTC state are done in a critical section, effectively acting as a mutex.
		avr_device::interrupt::free(|_| unsafe {
			RTC_DATA.sleep_timer == 0
		})
	}

	pub fn get_current_time(&self) -> RtcData {
		// SAFETY: Accesses to the global RTC state are done in a critical section, effectively acting as a mutex.
		avr_device::interrupt::free(|_| unsafe {
			let ctx = &*&raw const RTC_DATA;
			ctx.data.clone()
		})
	}

	pub fn set_current_time(&self, time: RtcData) {
		self.peri.RTC.cnt.write(|reg| reg.bits(0));

		// SAFETY: Accesses to the global RTC state are done in a critical section, effectively acting as a mutex.
		avr_device::interrupt::free(|_| unsafe {
			RTC_DATA.data = time;
		});
	}
}

#[avr_device::interrupt(attiny1614)]
fn RTC_CNT() {
	unsafe { Peripherals::steal().RTC.intflags.write(|reg| reg.ovf().set_bit()); }

	// SAFETY: Accesses to the global RTC state outside this interrupt handler are done in critical sections, effectively acting as a mutex.
	avr_device::interrupt::free(|_| unsafe {
		let data = &mut *&raw mut RTC_DATA.data;
		data.increment();

		RTC_DATA.updated = true;
		RTC_DATA.sleep_timer = RTC_DATA.sleep_timer.saturating_sub(1);
	});
}

