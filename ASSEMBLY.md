# Hardware assembly instructions

![all_parts](doc/build-photos/01_all_parts.jpg)

To start, you will need:

- An assembled tinyWatch mainboard.
- All 3D printed pieces (body, front, buttons (3 pcs.), OLED support piece).
- A new CR2032 battery.
- An M3 hex nut and an M3x6 screw.
- A 18 mm wide watch strap.
- Two pieces of nickel strip cut to a weird "T"-like shape (so that the middle bit is no more than 2 mm wide and about 5 mm deep).
- Two short pieces of thin wire (about 20 mm in length, I use cheap 30 AWG "wire wrapping" wire).
- Some solder.
- Some electrical tape and a small piece of double-sided tape (not in the picture).

Required tools:

- A soldering iron. You probably already have one if you were able to assemble the mainboard.
- A spot welder. I use [this cheap battery-powered one](https://www.aliexpress.com/item/1005006226735630.html), it does the job just fine.
- Some precise pliers or a sharp knife to create the nickel strips shown above.
- A screwdriver.
- (_optional_) A pair of bent tip tweezers to make placing things easier

> [!TIP] 
> If you have access to more than one color of 3D printable material,
> do not be afraid to experiment to make your watch truly unique
> (such as with the buttons colors).

## Preparing the battery

First, solder the short pieces of wire onto the middle "base" of the nickel strips.

![solder_tabs](doc/build-photos/02_solder_tabs.jpg)

Start by spot welding the nickel strip to the positive terminal of the battery.

![cr2032_top_tab_welded](doc/build-photos/03_cr2032_top_tab_welded.jpg)
![cr2032_top_tab_welded_side_view](doc/build-photos/04_cr2032_top_tab_welded_side_view.jpg)

Before spot welding to the bottom terminal, place a piece of electrical tape around the seam of the positive and negative terminal of the battery to prevent accidental short circuits. Place this tape 90° counter-clockwise from where the positive wire is pointing.

![cr2032_bottom_tape](doc/build-photos/05_cr2032_bottom_tape.jpg)
![cr2032_bottom_tape_side_view](doc/build-photos/06_cr2032_bottom_tape_side_view.jpg)
![cr2032_bottom_tape_top_view](doc/build-photos/07_cr2032_bottom_tape_top_view.jpg)

Then, weld the second nickel strip to the negative terminal of the battery, over the tape.

![cr2032_bottom_tab_welded](doc/build-photos/08_cr2032_bottom_tab_welded.jpg)

You should end up with a battery that has two wires coming out of it, offset by a 90° angle.

> [!IMPORTANT]
> Make sure that when looking at the battery with its positive terminal on the top,
> the positive wire should be 90° counter-clockwise from the negative wire.

![cr2032_all_tabs_welded_bottom_view](doc/build-photos/09_cr2032_all_tabs_welded_bottom_view.jpg)
![cr2032_all_tabs_welded_top_view](doc/build-photos/10_cr2032_all_tabs_welded_top_view.jpg)

## Installing the battery and mainboard

Bend the wires coming out of the battery upward and insert it into the main body.

![cr2032_wires_direction](doc/build-photos/11_cr2032_wires_direction.jpg)
![body_cr2032_inserted](doc/build-photos/12_body_cr2032_inserted.jpg)

Place some electrical tape over the newly inserted battery, so that it does not accidentaly short out with the mainboard during daily use.

![body_tape_over_cr2032](doc/build-photos/13_body_tape_over_cr2032.jpg)
![body_tape_over_cr2032_top_view](doc/build-photos/14_body_tape_over_cr2032_top_view.jpg)

Connect the battery to the mainboard.

> [!IMPORTANT]
> Make sure that the polarity is correct -
> the negative wire connects to the "-" terminal on the mainboard,
> while the positive wire connects to the "+" terminal.

> [!TIP]
> If your mainboard is not yet programmed, it will consume a few mA of current,
> pointlessly draining the battery. It is highly recommended to connect a programmer
> to the mainboard **now** and flash the firmware, which will also verify
> that the watch is working correctly.

![mobo_wires_connected](doc/build-photos/15_mobo_wires_connected.jpg)

Push the mainboard firmly into the body. The buttons as well as the debug/communication connector should be flush with the top of the body.

![mobo_fully_inserted](doc/build-photos/16_mobo_fully_inserted.jpg)
![mobo_fully_inserted_front_view](doc/build-photos/17_mobo_fully_inserted_front_view.jpg)
![mobo_fully_inserted_side_view](doc/build-photos/18_mobo_fully_inserted_side_view.jpg)

Place the OLED support piece on top of the main microcontroller with a piece of double-sided tape on it.
If you then push the OLED panel down, the support piece should stick to it.

![mobo_oled_support](doc/build-photos/19_mobo_oled_support.jpg)
![mobo_oled_support_sticky_tape](doc/build-photos/20_mobo_oled_support_sticky_tape.jpg)
![mobo_oled_support_stuck](doc/build-photos/21_mobo_oled_support_stuck.jpg)

## Final assembly

Insert the M3 hex nut into the hole in the body.

![body_nut_inserted](doc/build-photos/22_body_nut_inserted.jpg)

> [!TIP]
> To verify that the nut is placed correctly, you can try temporarily screwing in the screw into the body.
> It should screw in smoothly.
> ![body_nut_inserted_screw_test](doc/build-photos/23_body_nut_inserted_screw_test.jpg)

Place the buttons into the front piece.

![front_parts](doc/build-photos/24_front_parts.jpg)
![front_buttons_placed](doc/build-photos/25_front_buttons_placed.jpg)

Now, for the tricky part - closing the entire unit. The easiest way to do this is to hold the main body vertically with the front piece "hanging" from it. This way, neither the nut nor the buttons will fall out during final assembly.

Place the OLED panel into the front piece so that the bottom of the panel is seated in the bottom of the display hole in the front piece.

![final_assembly_oled_placement](doc/build-photos/26_final_assembly_oled_placement.jpg)
![final_assembly_oled_placement_alt_view](doc/build-photos/27_final_assembly_oled_placement_alt_view.jpg)

Then, it should just close together without issues. Make sure that the front piece does not bulge, then screw it down into the main body.

![final_assembly_closed](doc/build-photos/28_final_assembly_closed.jpg)
![final_assembly_screw_hole](doc/build-photos/29_final_assembly_screw_hole.jpg)
![final_assembly_screwed_down](doc/build-photos/30_final_assembly_screwed_down.jpg)

## Strap attachment

Attaching the strap is as easy with any other watch - simply press one side of the strap's push pin into the watch, press the push pin and slide the whole strap into the watch so that the push pin locks the strap in place.

![top_strap_placement](doc/build-photos/31_top_strap_placement.jpg)
![top_strap_attached](doc/build-photos/32_top_strap_attached.jpg)

Do the same with the bottom strap.

![bottom_strap_placement](doc/build-photos/33_bottom_strap_placement.jpg)
![bottom_strap_attached](doc/build-photos/34_bottom_strap_attached.jpg)

## Finish

Congratulations, you should now have a fully functioning tinyWatch!

