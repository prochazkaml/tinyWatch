include <common.scad>

module buttonhole() {
	cylinder(d = 5, h = lcd_d + 1.01 - .5);
	
	hull() {
		translate([-1.25, 0]) cylinder(d = 2.5 - dtolerances, h = 3.5);
		translate([1.25, 0]) cylinder(d = 2.5 - dtolerances, h = 3.5);
	}
}

translate([0, 0]) buttonhole();
translate([-9, 0]) buttonhole();
translate([9, 0]) buttonhole();
