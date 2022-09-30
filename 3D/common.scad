$fn = 64;

body_w = 30.5;
body_h = 36;
body_d = 10;

emboss = 5;

tolerances = .1;
dtolerances = tolerances * 2;

lcd_top_offset = 2.5;

lcd_w = 24.8;
lcd_h = 16.7;
lcd_d = 1.5;

lcd_border = .6;
lcd_chin = 3;

strappole_w = 21;
strappole_d = 1.5;

top_d = lcd_d + 1;

module nuthole(w) {
	translate([-5.75/2, -2.5/2, -6.5/2]) cube([5.75, 2.5, 999]);
	
	rotate([90, 0, 0]) cylinder(h = w, d = 3.2, center = true);	
}

