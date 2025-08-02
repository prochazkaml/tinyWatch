#![no_std]
#![no_main]
#![feature(abi_avr_interrupt)]

pub mod i2c;
pub mod rtc;
pub mod menu;
pub mod draw;
pub mod oled;
pub mod system;
pub mod buttons;
pub mod chargen;

use buttons::Buttons;
use i2c::I2cDriver;
use oled::Oled;
use rtc::{Rtc, RtcData};

// TODO - abort just hangs on `rjmp .`
use panic_abort as _;

use avr_device::attiny1614::Peripherals;

use crate::chargen::{Chargen, SmallFont};

fn draw_date_time(oled: &mut Oled, time: &RtcData) {
	oled.clear_framebuffer();

	draw::time(oled, time, 12, false);
	draw::date(oled, time, 44);

	oled.refresh();
}

fn redraw_clock(rtc: &Rtc, oled: &mut Oled) {
	draw_date_time(oled, &rtc.get_current_time());
}

fn clock_error_screen(oled: &mut Oled) {
	oled.clear_framebuffer();

	SmallFont::draw_string_centered(oled, b"System warning", 16);
	SmallFont::draw_string_centered(oled, b"RTC clock is not present.", 32);
	SmallFont::draw_string_centered(oled, b"Internal clock will be", 40);
	SmallFont::draw_string_centered(oled, b"used instead.", 48);

	oled.refresh();
}

#[avr_device::entry]
fn main() -> ! {
	let peri = unsafe { Peripherals::steal() }; // Smaller flash footprint than take()

	system::init(&peri);

	let rtc = Rtc::init(&peri);
	let mut buttons = Buttons::new(&peri);
	
	loop {
		rtc.reset_sleep_counter();
		system::enter_high_performance(&peri);

		{
			let i2c = I2cDriver::init(&peri);
			let mut oled = Oled::init(&peri, i2c);

			redraw_clock(&rtc, &mut oled);

			let mut clock_watchdog = 0;

			loop {
				system::enter_low_power(&peri);
				system::low_power_delay(10);

				buttons.update();

				if buttons.any_pressed() {
					rtc.reset_sleep_counter();
				}

				if buttons.left().held_down() && buttons.right().held_down() {
					while buttons.left().held_down() { buttons.update(); }
					while buttons.right().held_down() { buttons.update(); }

					system::enter_high_performance(&peri);

					menu::setup::run(&mut oled, &mut buttons, &rtc);

					redraw_clock(&rtc, &mut oled);
					rtc.reset_sleep_counter();
					continue
				}

				if buttons.left().held_down() && buttons.middle().held_down() {
					while buttons.left().held_down() { buttons.update(); }
					while buttons.middle().held_down() { buttons.update(); }

					system::enter_high_performance(&peri);

					menu::calibration::run(&mut oled, &mut buttons, &rtc);

					redraw_clock(&rtc, &mut oled);
					rtc.reset_sleep_counter();
					continue
				}

				if rtc.should_go_to_sleep() { break }

				if let Some(time) = rtc.updated() {
					system::enter_high_performance(&peri);
					draw_date_time(&mut oled, &time);
					clock_watchdog = 0;
				} else {
					clock_watchdog += 1;
				}

				if clock_watchdog > 300 { // 3 seconds, the RTC should have updated
					system::enter_high_performance(&peri);
					clock_error_screen(&mut oled);
					system::enter_low_power(&peri);
					system::low_power_delay(5000);
					rtc.switch_to_internal_clock();
					clock_watchdog = 0;
				}
			}
		}

		loop {
			buttons.update();

			if buttons.any_pressed() {
				break
			}

			system::enter_low_power(&peri);
			system::sleep(&peri);
		}
	}
}

