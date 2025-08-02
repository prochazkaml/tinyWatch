use crate::oled::Oled;
use crate::rtc::{RtcData, RtcNumber};
use crate::chargen::{SmallFont, BigFont, Chargen};

use ufmt::uwrite;

pub fn date(oled: &mut Oled, time: &RtcData, y: u8) {
	let mut out = heapless::String::<64>::new();

	let _ = uwrite!(out, "{}, {} {}", time.weekday, time.day, time.month);

	SmallFont::draw_string_centered(oled, out.as_bytes(), y);
}

pub fn time(oled: &mut Oled, time: &RtcData, y: u8, force_colons: bool) {
	let mut out = heapless::String::<64>::new();

	if force_colons || time.second.get_value() & 1 == 0 {
		let _ = uwrite!(out, "{}:{}:{}", time.hour, time.minute, time.second);
	} else {
		let _ = uwrite!(out, "{} {} {}", time.hour, time.minute, time.second);
	}

	BigFont::draw_string_centered(oled, out.as_bytes(), y);
}

pub fn title_bar(oled: &mut Oled, title: &[u8]) {
	oled.clear_framebuffer();

	SmallFont::draw_string_centered(oled, title, 0);

	for i in 0..128 {
		oled.set_pixel(i, 9);
	}
}

pub fn left_button_hint(oled: &mut Oled, hint: &[u8]) {
	SmallFont::draw_string_centered_around(oled, hint, (128 * 1 / 6) as u8, 56);
}

pub fn middle_button_hint(oled: &mut Oled, hint: &[u8]) {
	SmallFont::draw_string_centered_around(oled, hint, (128 * 3 / 6) as u8, 56);
}

pub fn right_button_hint(oled: &mut Oled, hint: &[u8]) {
	SmallFont::draw_string_centered_around(oled, hint, (128 * 5 / 6) as u8, 56);
}

