# tinyWatch

A simple ATtiny1614-based wristwatch with an OLED display, a couple of buttons and a CR2032 battery.

![tinywatch](https://user-images.githubusercontent.com/41787099/195558866-5d9a7961-0574-4461-b3f9-89c7d53c51ee.jpg)

To build your very own tinyWatch, you'll need to source the components, get a PCB made (or make it yourself, if you're brave enough), get the plastic parts 3D printed (or, again, print it yourself if you've already got a printer) and find a compatible 18 mm wrist strap + push pin (or edit the .scad files if you've got some other one).

## Plastic parts

The plastic parts of the tinyWatch are expected to be 3D printed (tested FDM, but SLA should work as well). They consist of:

- the back piece where the battery and PCB will be fit
- the front piece which will hold the OLED panel as well as the buttons in place, it also contains a pair of holes at each end for fitting a wrist strap push pin
- OLED support piece which will make the panel not fall inside of the watch
- 3x button caps

You can find these in the [hw/3D](https://github.com/prochazkaml/tinyWatch/tree/master/hw/3D) directory in .stl format with the .scad source files are available as well.

These parts are held together with an **M3 nut and M3x6 screw**.

## PCB & Hardware

The circuit diagram as well as the PCB were designed in KiCad (with [mitxela's rounded tracks plugin](https://github.com/mitxela/kicad-round-tracks)), the project files are available in the [hw/kicad](https://github.com/prochazkaml/tinyWatch/tree/master/hw/kicad) directory. Many prototype PCB manufacturers support uploading raw KiCad files directly without the need to generate Gerber files. Recommended PCB thickness is ~1.5 mm.

Of course, you will then need to populate the manufactured PCB with components. The bill of materials is available [here](https://github.com/prochazkaml/tinyWatch/blob/master/hw/kicad/tinywatch.csv) in CSV format. In summary, you'll need:

|Component|Package|Qty|DigiKey Part Number|
|-|-|-|-|
|4.7 μF capacitor|0603|1|1276-1044-1-ND|
|1 μF capacitor|0603|5|1276-1946-1-ND|
|2.2 μF capacitor|0603|1|1276-1040-1-ND|
|10 μF capacitor|0603|1|1276-1119-1-ND|
|1N4148W diode|SOD-123|1|311-4.70KHRTR-ND|
|4-pin straight female header|4x2.54 pitch|1|S7037-ND|
|SSD1306 128x64 0.96" OLED panel|30 pin flat ribbon, 0.7 mm pitch|1|3190-DLC0096DNOG-W-5-ND (but you can probably get it much cheaper elsewhere)|
|910k resistor|0603|1|13-AC0603FR-07910KLTR-ND|
|4.7k resistor|0603|1|311-4.70KHRTR-ND|
|Push button|6.7x4.1 mm|3|CKN12330-1-ND|
|ATtiny1614|SOIC-14|1|ATTINY1614-SSN-ND|
|32.768 kHz oscillator|3.2x2.5 mm|1|50-ECS-327TXO-30-CT-ND|

What is not included in the BOM is a **CR2032** battery, which will be soldered via wires to the mainboard. I recommend getting one of those which have pre-welded contacts on the terminals, to which you will then solder to – otherwise you will have to weld those contacts on yourself. [**It is highly discouraged to solder directly to the cells.**](https://www.youtube.com/watch?v=wmnAx6pzDoQ).

The positive and negative wires of the battery should be soldered to the bottom two pads.

## Firmware building instructions

The tinyWatch's firmware is written in Rust, so you'll need the Rust toolchain to be installed.

Bulding the firmware is as easy as running the following command:

```bash
cargo build
```

**NOTE**: This firmware is currently only compatible with revision 2 hardware. The old revision 1 hardware is only supported by the [old C-based firmware](https://github.com/prochazkaml/tinyWatch/tree/2073f80b21bf5213d320747aeb9541f89d2ae41b).

If you have a [serialupdi](https://github.com/SpenceKonde/AVR-Guidance/blob/master/UPDI/jtag2updi.md) programmer attached to the PC as well as the watch and want to upload the firmware to the watch, run the following:

```bash
avrdude -p attiny1614 -c serialupdi -P /dev/ttyUSB0 -v -U flash:w:target/avr-none/debug/tinywatch.elf
```

## Setup

After flashing the firmware, you will want to set up the clock.
To do that, press the **left and right button** at simultaneously.
Then, using the **left** and **right** button, you will set the value on-screen and then press the **middle** button to confirm your selection and move onto the next value or finish the clock setup if you're done.
You will be asked at the end whether the entered values are correct.

## Oscillator calibration

> [!NOTE]  
> Revision 2 hardware uses a high quality temperature-compensated crystal oscillator with at most ±5 ppm of error, resulting in less than 0.5 seconds of drift per day.
> With this hardware, this option should be left alone.

If you experience severe drifts with the watch (more than 1 second per day), it is possible to trim the oscillator to a more precise value.

To remedy this issue, press the **left and middle button** together to enter the clock calibration menu.
There, you will be presented by a 16-bit hex value (the default is 8000, corresponding to the 32.768 kHz of the main oscillator).
With the **left** and **right** button, you can move the cursor.

To edit a value of a digit, press the **middle** button (the cursor will appear above the digit so that it is apparent what the buttons currently do)
and adjust the value using the **left** and **right** button.

To confirm your choice, press the **middle** button again to go back to cursor mode. Choose `Done` and press the **middle** button to exit.

---

That's it! Enjoy your watch. More features coming soon ;)

