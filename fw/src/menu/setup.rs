use crate::draw;
use crate::oled::Oled;
use crate::buttons::Buttons;
use crate::rtc::{Rtc, RtcData, RtcValue};
use crate::chargen::{Chargen, SmallFont, BigFont};

use ufmt::{uDisplay, uwrite};

fn run_selector<T: Chargen, V>(oled: &mut Oled, buttons: &mut Buttons, old: &RtcData, value: &mut V) where V: RtcValue + uDisplay {
	loop {
		draw::title_bar(oled, value.type_name());

		let mut out = heapless::String::<64>::new();

		let _ = uwrite!(out, "{}", value);

		T::draw_string_centered(oled, out.as_bytes(), 37 - T::height() / 2);

		draw::left_button_hint(oled, b"-");
		draw::middle_button_hint(oled, b"Confirm");
		draw::right_button_hint(oled, b"+");

		oled.refresh();

		loop {
			buttons.update();
			if buttons.any_pressed() { break }
		}

		if buttons.left().pressed() {
			value.decrement(&old);
		}

		if buttons.middle().pressed() {
			break
		}

		if buttons.right().pressed() {
			value.increment(&old);
		}
	}
}

pub fn run(oled: &mut Oled, buttons: &mut Buttons, rtc: &Rtc) {
	let mut data = rtc.get_current_time();

	'inputloop: loop {
		run_selector::<BigFont, _>(oled, buttons, &data.clone(), &mut data.year);
		run_selector::<SmallFont, _>(oled, buttons, &data.clone(), &mut data.month);
		run_selector::<SmallFont, _>(oled, buttons, &data.clone(), &mut data.weekday);
		run_selector::<BigFont, _>(oled, buttons, &data.clone(), &mut data.day);
		run_selector::<BigFont, _>(oled, buttons, &data.clone(), &mut data.hour);
		run_selector::<BigFont, _>(oled, buttons, &data.clone(), &mut data.minute);
		run_selector::<BigFont, _>(oled, buttons, &data.clone(), &mut data.second);

		draw::title_bar(oled, b"Is this correct?");

		draw::time(oled, &data, 16, true);
		draw::date(oled, &data, 40);

		draw::left_button_hint(oled, b"Confirm");
		draw::right_button_hint(oled, b"Retry");

		oled.refresh();
		
		loop {
			loop {
				buttons.update();
				if buttons.any_pressed() { break }
			}

			if buttons.left().pressed() {
				break 'inputloop;
			}

			if buttons.right().pressed() {
				continue 'inputloop;
			}
		}
	}

	rtc.set_current_time(data);
}

