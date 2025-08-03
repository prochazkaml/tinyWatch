include<BOSL/transforms.scad>
include<BOSL/shapes.scad>

w = 14;
d = 5;
h = 2.4;
inner_w = w - 3;
inner_h = 2;

render() difference() {
	cuboid([w, d, h], align = V_TOP);
	cuboid([inner_w, d, inner_h], align = V_TOP);
}

