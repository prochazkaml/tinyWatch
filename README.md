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

## PCB & Hardware

The circuit diagram as well as the PCB were designed in KiCad (with [mitxela's rounded tracks plugin](https://github.com/mitxela/kicad-round-tracks)), the project files are available in the [hw/kicad](https://github.com/prochazkaml/tinyWatch/tree/master/hw/kicad) directory. Many prototype PCB manufacturers support uploading raw KiCad files directly without the need to generate Gerber files. Recommended PCB thickness is ~1.5 mm.

Of course, you will then need to populate the manufactured PCB with components. The bill of materials is available [here](https://github.com/prochazkaml/tinyWatch/blob/master/hw/kicad/tinywatch.csv) in CSV format. In summary, you'll need:

- 1x **ATtiny1614** microcontroller
- 1x 128x64 30-pin 0.96" I2C **OLED panel**
- 3x **SMD pushbuttons** (6.7x4.1mm)
- 1x **1x4 female header**, straight terminals
- 2x **4.7k resistors** (0603 package)
- 1x **910k resistor** (0603 package)
- 5x **1 uF capacitors** (0603 package)
- 1x **2.2 uF capacitor** (0603 package)
- 1x **4.7 uF capacitor** (0603 package)
- 1x **10 uF capacitor** (0603 package)
- 1x **1N4148W diode** (SOD-110 package, but SOD-123 *could* work)

What is not included in the BOM is a **CR2032** battery, which you will need to solder short wires to (I recommend getting one of those which have pre-welded contacts on the terminals, to which you will then solder to – if you cannot find any of these easily, I have had good experience with Varta CR2032s having a solder-friendly surface, just don't heat them up for [too long](https://www.youtube.com/watch?v=wmnAx6pzDoQ)).

The positive wire of the battery should be soldered to the "squiggly" line on the bottom side of the PCB, and the negative wire should be soldered anywhere to the ground plane of the PCB.

*TODO: add links to the components listed above*

## Firmware building instructions

The tinyWatch's firmware is written in AVR assembly, so you'll need the [AVRA](https://avra.sourceforge.net/) assembler, along with `cpp`, the C preprocessor (as the firmware uses some syntax which AVRA does not support by default). If you have `gcc` installed, you also have `cpp` installed and you can proceed.

Bulding the firmware is as easy as running the following command:

```bash
./build.sh dry
```

If you have a [jtag2updi](https://github.com/ElTangas/jtag2updi) programmer attached to the PC as well as the watch and want to upload the firmware to the watch, run the following:

```bash
./build.sh
```

## Setup

After flashing the firmware, you will want to set up the clock. To do that, press the **left and right button** at simultaneously. Then, using the **left** and **right** button, you will set the value on-screen and then press the **middle** button to confirm your selection and move onto the next value or finish the clock setup if you're done.

After a few hours/days of usage, you might notice that the clock drifts. To remedy this issue, press the **left and middle button** together to enter the clock calibration menu. There, you will be presented by a 16-bit hex value (default is 8163). With the **left** and **right** button, you may move the cursor. To edit a value of a digit, press the **middle** button (the cursor will appear above the digit so that it is apparent what the buttons currently do) and adjust the value using the **left** and **right** button. To confirm your choice, press the **middle** button again to go back to cursor mode. Choose `Done` and press the **middle** button to exit.

Remember that this calibration value *is kept in RAM* and will be reset if the ATtiny resets (in case of the battery draining out or flashing an updated firmware).

TODO: Temperature & voltage sensing for better accuracy OR use an external 32768 Hz watch crystal so that this calibration is unnecessary.

That's it! Enjoy your watch. More features (including a serial monitor with text input) coming soon ;)
