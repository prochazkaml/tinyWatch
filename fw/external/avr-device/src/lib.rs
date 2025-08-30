//! This crate contains register definitions for
#![cfg_attr(feature = "attiny3224", doc = "**attiny3224**,")]
//! and a few things which apply to AVR microcontrollers generally.
//!
//! Which chips the crate is built for depends on the feature flag used.
//! The following chips are available (using feature flags of the same name):
//! `attiny3224`,
//!
//! # How to use this crate?
//!
//! In most cases you probably don't want to use this crate directly.
//!
//! This is a low level peripheral access crate (PAC).
//! There are more high level crates, like `avr-hal`, that implement a more convenient
//! and higher level API built ontop of `avr-device`.
//! However, sometimes it's required to operate on bare device register level.
//! That's what this crate is for.
//!
//! ## Main program entry point
//!
//! ```
//! #[avr_device::entry] // requires avr_device's rt feature.
//! fn main() -> ! {
//!     loop {
//!         // Your code here.
//!     }
//! }
//! ```
//!
//! ## Get access to the device peripherals
//!
//! ```ignore
//! // To get access to the Peripherals struct, use this *once*:
//! let dp = avr_device::atmega328p::Peripherals::take().unwrap();
//! ```
//!
//! ## Example: Digital I/O port access
//!
//! ```ignore
//! // Configure bit 5 of port B as output:
//! dp.PORTB.ddrb.write(|w| w.pb5().set_bit());
//! // Clear bit 5 of port B:
//! dp.PORTB.portb.write(|w| w.pb5().clear_bit());
//! // Set bit 5 of port B:
//! dp.PORTB.portb.write(|w| w.pb5().set_bit());
//!
//! // Configure bit 6 of port B as input with pullup:
//! dp.PORTB.ddrb.write(|w| w.pb6().clear_bit());
//! dp.PORTB.portb.write(|w| w.pb6().set_bit());
//! // Read bit 6 of pin B:
//! let _mybit = dp.PORTB.pinb.read().pb6().bit_is_set();
//! // Read bit 6 and write to bit 5 of port B:
//! dp.PORTB.portb.modify(|r, w| w.pb6().bit(r.pb5().bit_is_set()))
//! ```
//!
//! ## Example: Other peripheral register access
//!
//! Other peripheral register accesses are similar to I/O port access.
//! Please read the documentation of the `struct R` and `struct W`
//! for the register of interest.
//!
//! e.g. [crate::atmega328p::spi::spcr::W]
//!
//! ```ignore
//! // Set SPE in SPCR (Enable SPI):
//! dp.SPI.spcr.write(|w| w.spe().set_bit());
//! ```
//!
//! # Crate feature flags
//!
//! * Device selection: To enable your device, select the crate feature that matches your device.
//!   For a full list of supported devices, see the list at the beginning of this documentation.
//! * To enable the crate's runtime environment, use the `rt` feature.
//! * To enable `ufmt` formatting (e.g. `uDebug`), use the `ufmt` feature.

#![no_std]
#![cfg_attr(target_arch = "avr", feature(asm_experimental_arch))] // for experimental AVR asm! macro.

pub mod asm;
pub mod interrupt;

pub(crate) use generic::*;
#[doc = r"Common register and bit access and modify traits"]
pub mod generic {
    include!(concat!(env!("OUT_DIR"), "/pac/generic.rs"));
}

/// Attribute to declare an interrupt service routine
///
/// ```
/// #[avr_device::interrupt(atmega32u4)]
/// fn INT6() {
///     // ...
/// }
/// ```
///
/// # Constraints
/// - The name of the function must be the name of an interrupt.  Each chip's
///   module has a `Interrupt` enum defining the available names.
/// - The attribute needs the chip-name to correctly map the interrupt to its
///   vector.  This is an unfortunate requirement of the current crate
///   architecture and might change in the future.
/// - The function must have a signature of `[unsafe] fn() [-> !]`.
/// - This macro requires the avr-device `rt` crate feature.
#[cfg(feature = "rt")]
pub use avr_device_macros::interrupt;

/// Attribute to declare the entry point of the program
///
/// Exactly one entry point must be declared in the entire dependency tree.
///
/// ```
/// #[avr_device::entry]
/// fn main() -> ! {
///     loop {
///         // ...
///     }
/// }
/// ```
///
/// # Constraints
/// - The entry function must have a signature of `[unsafe] fn() -> !`.
/// - This macro requires the avr-device `rt` crate feature.
#[cfg(feature = "rt")]
pub use avr_device_macros::entry;

#[cfg(not(feature = "device-selected"))]
compile_error!(
    "This crate requires you to specify your target chip as a feature.

    Please select one of the following:
    * attiny3224
    "
);

#[allow(non_camel_case_types, unused_attributes, unreachable_patterns)]
mod devices;

include!(concat!(env!("OUT_DIR"), "/pac/vector.rs"));

#[cfg(feature = "attiny3224")]
pub use crate::devices::attiny3224;

