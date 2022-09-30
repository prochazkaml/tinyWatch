include <common.scad>

difference() {
	cube([body_w, body_h, body_d]);

	// Embossed edges (bottom)
	
	rotate([90, 45, 0]) cube([emboss, emboss, 100], center = true);
	translate([body_w, 0]) rotate([90, 45, 0]) cube([emboss, emboss, 100], center = true);
	
	rotate([90, 45, 90]) cube([emboss, emboss, 100], center = true);
	translate([0, body_h]) rotate([90, 45, 90]) cube([emboss, emboss, 100], center = true);
	
	// Embossed edges (walls)
	
	rotate([0, 0, 45]) cube([emboss, emboss, 100], center = true);
	translate([body_w, 0]) rotate([0, 0, 45]) cube([emboss, emboss, 100], center = true);
	translate([0, body_h]) rotate([0, 0, 45]) cube([emboss, emboss, 100], center = true);
	translate([body_w, body_h]) rotate([0, 0, 45]) cube([emboss, emboss, 100], center = true);
	
	// Nut & screw hole
	
	translate([body_w / 2, 3, 6.5]) nuthole(8);
	
	// Top cover mounting holes
	
	translate([6, 4, body_d]) cube([4, 4, 5], center = true); 
	
	translate([body_w - 6, 4, body_d]) cube([4, 4, 5], center = true); 
	
	translate([5.5, body_h, 6.75]) cube([2.5, 4, 5], center = true); 
	
	translate([body_w - 5.5, body_h, 6.75]) cube([2.5, 4, 5], center = true); 
	
	// From now on, move everything slightly backwards
	
	translate([0, 2, 0]) {
		// Battery cutout

		translate([body_w / 2, body_h / 2, .4]) cylinder(d = 20.5, h = 8);	
				
		// Left battery cable cutout
		
		hull() {
			translate([body_w / 2, body_h / 2, .4]) cylinder(d = 2, h = 4.01);
			translate([body_w / 2 - 10, body_h / 2 - 10, .4]) cylinder(d = 2, h = 4.01);
		}
		
		// Right battery cable cutout
		
		hull() {
			translate([body_w / 2, body_h / 2, .4]) cylinder(d = 2, h = 4.01);
			translate([body_w / 2 + 10, body_h / 2 - 10, .4]) cylinder(d = 2, h = 4.01);
		}
		
		// PCB bottom cutout
		
		translate([(body_w - 25) / 2, (body_h - 24.5) / 2 + 1.5, .4 + 4 + 1]) cube([25, 23, 8]);
		
		// Embossed PCB buttom cutout (for bottom components/wires)
		
		translate([(body_w - 25) / 2 + 1, (body_h - 24.5) / 2 + 1.5, .4 + 4]) cube([23, 21, 8]);
		
		translate([(body_w + 25) / 2 - 1.01, (body_h + 24.5) / 2 - 14.5, .4 + 4]) cube([1.01, 12.5, 8]);

		translate([(body_w - 25) / 2, (body_h + 24.5) / 2 - 14.5, .4 + 4]) cube([1.01, 12.5, 8]);

		// Ribbon cable cutout
		
		translate([(body_w - 16) / 2, (body_h + 24.5) / 2 - .01, .4 + 4 + 1]) cube([16, 2.51, 8]);
		
		// Righthand wire cutout
		
		//translate([(body_w + 26) / 2 - .01, (body_h + 24.5) / 2 - 12.5, .4 + 4 + 1]) cube([1, 12.5, 8]);	
		
		// Programming header cutout
		
		translate([-0.1, (body_h + 24.5) / 2 - 12.5, .4 + 4 + 3]) cube([5, 12.5, 8]);
	}
}