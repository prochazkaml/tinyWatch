#[allow(renamed_and_removed_lints)]
#[allow(private_no_mangle_statics)]
#[no_mangle]
pub(crate) static mut DEVICE_PERIPHERALS: bool = false;

/// [ATtiny3224](https://www.microchip.com/wwwproducts/en/ATtiny3224)
#[cfg(feature = "attiny3224")]
pub mod attiny3224 {
    include!(concat!(env!("OUT_DIR"), "/pac/attiny3224.rs"));
}

