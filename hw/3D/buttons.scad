include <common.scad>

module buttonhole() {
	cylinder(d = 5, h = lcd_d);
	
	hull() {
		translate([-1.25, 0]) cylinder(d = 2.5, h = 3.5);
		translate([1.25, 0]) cylinder(d = 2.5, h = 3.5);
	}
}

translate([0, 0]) buttonhole();
// translate([-9, 0]) buttonhole();
// translate([9, 0]) buttonhole();
