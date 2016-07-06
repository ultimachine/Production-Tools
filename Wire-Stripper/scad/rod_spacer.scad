include <Magpie/magpie.scad>;
include <configuration.scad>;

module rod_spacer(rod, spacing, screw){
	rodObj = object(rod);
	screwObj = object(screw);
	height = screwObj[DIAMETER]*2.5;
	wall = rodObj[DIAMETER]/2;
	difference(){
		union(){
			hull(){
				translate([-spacing/2,0,0])cylinder(r = rodObj[DIAMETER]/2+wall,h = height);
				translate([spacing/2,0,0])cylinder(r = rodObj[DIAMETER]/2+wall,h = height);
			}
		}
		translate([-spacing/2,0,-eta])poly_cylinder(r=rodObj[DIAMETER]/2, h = height+eta*2);
		translate([spacing/2,0,-eta])poly_cylinder(r=rodObj[DIAMETER]/2, h = height+eta*2);
		translate([0,eta,height/2])rotate([90,0,0])poly_cylinder(r=screwObj[DIAMETER]/2, h = height+eta*2);
		translate([-spacing/2-rodObj[DIAMETER]/2-wall-eta,0,-eta])cube([spacing+rodObj[DIAMETER]+wall*2+eta*2,rodObj[DIAMETER]/2+wall+eta,height+eta*2]);
	}
}

