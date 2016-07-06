include <Magpie/magpie.scad>

module spool_post(wobble_dia=50, wobble_h=4, outer_diameter = 24, height = 94, wall = 2, split = 14, hole = 6){
	difference(){
		union(){
			cylinder(r=outer_diameter/2,h=height);
			cylinder(r=wobble_dia/2, h=wobble_h);
			translate([0, 0, height])rotate_extrude(convexity = 10, $fn = 100)
				translate([outer_diameter/2-wall/2, 0, height])
				circle(r = wall*0.9, $fn = 100);
		}
		translate([0,0,wobble_h])cylinder(r=outer_diameter/2-wall,h=height+wall*2);
		translate([0,0,-eta])cylinder(r=hole/2,h=wobble_h+eta*2);
		translate([outer_diameter/2, 0, height*.8])rotate([0, -90, 0])cylinder(r = split/2, h=outer_diameter);
		translate([-outer_diameter/2-wall,-split/2,height*0.8])cube([outer_diameter+wall*2,split,height]);
	}
}

spool_post();

