use crate::draw;
use crate::oled::Oled;
use crate::buttons::Buttons;
use crate::rtc::Rtc;
use crate::chargen::{Chargen, SmallFont};

pub fn run(oled: &mut Oled, buttons: &mut Buttons) {
	let mut val = Rtc::get_oscillator_trim();
	let mut cursor = 4;
	let mut selected = false;

	loop {
		draw::title_bar(oled, b"Oscillator calibration");

		let nibble_to_hex = |c: u16| {
			match c & 0xF {
				c @ 0..=9 => b'0' + c as u8,
				c @ 10..=15 => b'A' - 10 + c as u8,
				_ => b'?'
			}
		};

		for nibble in 0..4 {
			SmallFont::draw(oled, nibble_to_hex(val >> (12 - nibble * 4)), 64 - 5 * 4 - 3 + nibble * 5, 33);
		}

		SmallFont::draw_string(oled, b"Done", 64 + 3, 33);

		if selected {
			draw::left_button_hint(oled, b"-");
			draw::middle_button_hint(oled, b"Confirm digit");
			draw::right_button_hint(oled, b"+");
		} else {
			draw::left_button_hint(oled, b"<-");
			draw::right_button_hint(oled, b"->");

			if cursor == 4 {
				draw::middle_button_hint(oled, b"Confirm");
			} else {
				draw::middle_button_hint(oled, b"Edit digit");
			}
		}

		if cursor < 4 {
			for j in 0..if selected { 2 } else { 1 } {
				for i in 0..4 {
					oled.set_pixel(64 - 5 * 4 - 3 + cursor * 5 + i, 33 + 9 - j * 12);
				}
			}
		} else {
			for i in 0..19 {
				oled.set_pixel(64 + 3 + i, 33 + 9);
			}
		}

		oled.refresh();

		loop {
			buttons.update();
			if buttons.any_pressed() { break }
		}

		if !selected {
			if buttons.left().pressed() {
				if cursor > 0 {
					cursor -= 1;
				} else {
					cursor = 4;
				}
			}

			if buttons.middle().pressed() {
				if cursor == 4 { break }

				selected = true;
			}

			if buttons.right().pressed() {
				if cursor < 4 {
					cursor += 1;
				} else {
					cursor = 0;
				}
			}
		} else {
			if buttons.middle().pressed() {
				selected = false;
			}

			let bits = 0x1 << (12 - cursor * 4);

			if buttons.left().pressed() {
				val = val.wrapping_sub(bits);
			}

			if buttons.right().pressed() {
				val = val.wrapping_add(bits);
			}
		}
	}

	Rtc::set_oscillator_trim(val);
}

