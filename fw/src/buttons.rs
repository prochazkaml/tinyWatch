use avr_device::attiny1614::Peripherals;

#[derive(Default, Clone, Copy)]
pub struct Button {
	pressed: bool,
	held_down: bool,
	timer: u8
}

impl Button {
	fn update(&mut self, is_held_down: bool) {
		self.pressed = false;

		if !is_held_down {
			match self.timer {
				0 => self.held_down = false,
				_ => self.timer -= 1
			}

			return
		}

		self.held_down = true;

		if self.timer == 0 {
			self.pressed = true;
		}

		self.timer = 30;
	}

	pub fn pressed(&self) -> bool {
		self.pressed
	}

	pub fn held_down(&self) -> bool {
		self.held_down
	}
}

pub struct Buttons<'a> {
	peri: &'a Peripherals,
	buttons: [Button; 3],
}

impl<'a> Buttons<'a> {
	pub fn new(peri: &'a Peripherals) -> Self {
		// All GPIO is already initialized at startup as inputs with pullups,
		// so no special init is needed here

		peri.PORTA.pin5ctrl.modify(|_, reg| reg.isc().bothedges());
		peri.PORTA.pin6ctrl.modify(|_, reg| reg.isc().bothedges());
		peri.PORTA.pin7ctrl.modify(|_, reg| reg.isc().bothedges());

		Self {
			peri,
			buttons: [Button::default(); 3]
		}
	}

	pub fn update(&mut self) {
		let inputs = self.peri.PORTA.in_.read();

		self.buttons[0].update(inputs.pa5().bit_is_clear());
		self.buttons[1].update(inputs.pa6().bit_is_clear());
		self.buttons[2].update(inputs.pa7().bit_is_clear());
	}

	pub fn left(&self) -> &Button {
		&self.buttons[0]
	}

	pub fn middle(&self) -> &Button {
		&self.buttons[1]
	}

	pub fn right(&self) -> &Button {
		&self.buttons[2]
	}

	pub fn any_held_down(&self) -> bool {
		self.left().held_down() || self.middle().held_down() || self.right().held_down()
	}

	pub fn any_pressed(&self) -> bool {
		self.left().pressed() || self.middle().pressed() || self.right().pressed()
	}
}

#[avr_device::interrupt(attiny1614)]
fn PORTA_PORT() {
	unsafe { Peripherals::steal().PORTA.intflags.write(|reg| reg
		.pa5().set_bit()
		.pa6().set_bit()
		.pa7().set_bit()); }
}

