include <common.scad>

strap_w = 18;
strap_d = 4;

module buttonhole() {
	cylinder(d = 5.2, h = lcd_d + 1.01 - .5);
	
	hull() {
		translate([-1.25, 0]) cylinder(d = 2.7, h = 5);
		translate([1.25, 0]) cylinder(d = 2.7, h = 5);
	}
}

strapbody_w = body_w - 2 * emboss / sqrt(2);
strapbody_h = 7;
strapbody_d = body_d + top_d - emboss / sqrt(2);

smallemboss = 4;

module strapattachment() {
	difference() {
		translate([0, 0, emboss / sqrt(2)]) difference() {
			cube([strapbody_w, strapbody_h, strapbody_d]);
			
			translate([(strapbody_w-strap_w)/2, -.01, -.01]) cube([strap_w, strap_d + .01, strapbody_d + .02]);
		}
		
		// Side strap holes

		translate([strapbody_w / 2, strap_d / 2, 6.5]) rotate([0, 90, 0]) cylinder(h = strappole_w, d = strappole_d, center = true);

		// Emboss
		
		translate([strapbody_w / 2, strap_d, body_d + top_d]) rotate([45, 0, 0]) cube([strap_w, smallemboss, smallemboss], center = true);
		
		translate([strapbody_w / 2, 0, body_d + top_d]) rotate([45, 0, 0]) cube([strapbody_w + .02, smallemboss, smallemboss], center = true);
		
		translate([strapbody_w / 2, 0, emboss / sqrt(2)]) rotate([45, 0, 0]) cube([strapbody_w + .02, smallemboss / 2, smallemboss / 2], center = true);
		
		// Gotta take into account the tolerances!
		
		translate([-.01, strapbody_h - tolerances, 0]) cube([strapbody_w + .02, tolerances + .01, body_d]);
	}
}

difference() {
	cube([body_w, body_h, top_d]);
	
	// OLED cutout
	
	translate([(body_w - lcd_w) / 2, body_h - lcd_h - lcd_top_offset, -.01]) {
		
		cube([lcd_w, lcd_h, lcd_d + .01]);
		translate([lcd_border, lcd_border]) cube([lcd_w - lcd_border * 2, lcd_h - lcd_border * 2 - lcd_chin, lcd_d + 1.02]);

		translate([(lcd_w - 16) / 2, lcd_h - .01]) cube([16, lcd_top_offset + .02, lcd_d + .01]);
	}
	
	// Ribbon cutout
	
	// Embossed edges (walls)
	
	rotate([0, 0, 45]) cube([emboss, emboss, 100], center = true);
	translate([body_w, 0]) rotate([0, 0, 45]) cube([emboss, emboss, 100], center = true);
	translate([0, body_h]) rotate([0, 0, 45]) cube([emboss, emboss, 100], center = true);
	translate([body_w, body_h]) rotate([0, 0, 45]) cube([emboss, emboss, 100], center = true);
	
	// Button holes
	
	translate([body_w / 2, body_h - lcd_h - lcd_top_offset - 3, -.01]) {
		
		translate([0, 0]) buttonhole();
		translate([-9, 0]) buttonhole();
		translate([9, 0]) buttonhole();
	}
}

// Bottom "pegs"

translate([6, 4, -1]) cube([4 - dtolerances, 4 - dtolerances, 2], center = true); 

translate([body_w - (6), 4, -1]) cube([4 - dtolerances, 4 - dtolerances, 2], center = true);

// Front strap attachment

translate([(body_w - strapbody_w) / 2, -strapbody_h, -body_d]) difference() {

	strapattachment();

	// Screw hole

	translate([strapbody_w / 2, 0, 6.5]) rotate([-90, 0, 0]) {
		
		cylinder(h = strapbody_h + .01, d = 3.2);
	
		hull() {
			cylinder(h = strapbody_h - 1, d = 6.5);
			translate([0, 10, 0]) cylinder(h = strapbody_h - 1, d = 6.5);

		}
	}	
}

// Back strap attachment

translate([strapbody_w + (body_w - strapbody_w) / 2, body_h + strapbody_h, -body_d]) rotate([0, 0, 180]) strapattachment();

translate([5.5, body_h, -body_d + 6.75 + .5]) cube([2.5 - dtolerances, 1.5, 5 - dtolerances - 1], center = true); 

translate([body_w - 5.5, body_h, -body_d + 6.75 + .5]) cube([2.5 - dtolerances, 1.5, 5 - dtolerances - 1], center = true); 
