include <Magpie/magpie.scad>;

module feeder(){
	screw = "M5";
	hole_spacing = 40;
	slots = 10;
	spacing = 5; //not part-part, but tape-tape
	length = 100;
	tape_thickness = 0.7;
	tape_width = 8;
	tape_elevation = 30; //base plate to bottom of tape
	left_overlap = 2.5;
	right_overlap = 1;
	recess = 2;

	screwObj = object(screw);
	difference(){
		union(){
			cube([slots*tape_width+spacing*(slots+1),tape_elevation,length]);
		}
		for(i = [0:slots-1]){
			translate([spacing*(i+1)+tape_width*i,recess,-eta])cube([tape_width, tape_thickness,length+eta*2]);
			translate([spacing*(i+1)+tape_width*i+left_overlap,-eta,-eta])cube([tape_width-left_overlap-right_overlap, tape_thickness+recess+eta,length+eta*2]);
		}
		for(i=[-1,1], j=[-1,1]){
			translate([slots*tape_width+spacing*(slots+1)+hole_spacing*i,-eta,length+hole_spacing*j]/2)rotate([-90,0,0])poly_cylinder(r=2.5, h=tape_elevation+eta*2);
			translate([slots*tape_width+spacing*(slots+1)+hole_spacing*i,-eta,length+hole_spacing*j]/2)rotate([-90,0,0])poly_cylinder(r=screwObj[CAP_HEAD_DIAMETER]/2, h=screwObj[CAP_HEAD_HEIGHT]+recess+tape_thickness+eta*2);		
		}
		translate([slots*tape_width+spacing*(slots+1),-eta,length]/2)rotate([-90,0,0])poly_cylinder(r=2.5, h=tape_elevation+eta*2);		
		translate([slots*tape_width+spacing*(slots+1),-eta,length]/2)rotate([-90,0,0])poly_cylinder(r=screwObj[CAP_HEAD_DIAMETER]/2, h=screwObj[CAP_HEAD_HEIGHT]+recess+tape_thickness+eta*2);

	}
}

feeder();