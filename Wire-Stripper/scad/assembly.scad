include </Magpie/magpie.scad>;
include </Magpie/magpie_demos.scad>;
use <blade.scad>;

blade_length = 37.5;
blade_width = 17.5;
rod_spacing = 7.5*2+blade_width;

module blade_carriage(){
	difference(){
		union(){
			hull(){
				cylinder(r=7.5, h = height);
				translate([-7.5/2,-7.5-9.2/2,0])cylinder(r=4, h = height);
				translate([7.5/2,-7.5-9.2/2,0])cylinder(r=4, h = height);
			}
			hull(){
				translate([rod_spacing,0,0])cylinder(r=7.5, h = height);	
				translate([-7.5/2+rod_spacing,7.5+9.2/2,0])cylinder(r=4, h = height);
				translate([7.5/2+rod_spacing,7.5+9.2/2,0])cylinder(r=4, h = height);
			}			
			translate([0,0.5,0])cube([rod_spacing,7.5-0.5,height-blade_width/2]);
			
		}
			for ( i = [0:1]) 
			translate([rod_spacing*i,(7.5+9.2/2)*2*i,0])
			hull(){
				translate([-7.5/2,-7.5-9.2/2,-eta])poly_cylinder(r=2.1, h = height+eta*2);
				translate([7.5/2,-7.5-9.2/2,-eta])poly_cylinder(r=2.1, h = height+eta*2);
			}
			translate([0,0,-eta])poly_cylinder(r=5, h = height+eta*2);
			translate([rod_spacing,0,-eta])poly_cylinder(r=5, h = height+eta*2);	
			translate([rod_spacing/2+8.5/2,7.5+eta,4.5/2+2.75])rotate([90,0,0])poly_cylinder(r=1.5, h = 15+eta*2);
			translate([rod_spacing/2-8.5/2,7.5+eta,4.5/2+2.75])rotate([90,0,0])poly_cylinder(r=1.5, h = 15+eta*2);	

	}
}

module blade_carriage_asm(){
	blade_carriage();
	#translate([rod_spacing/2,0,4.5/2+2.75])rotate([0,90,-90])blade();
}

module carriage_assembly(){
	translate([0,0,stepperObj[WIDTH]*sin(45)]){
		translate([0,0,blade_width/2*$t])blade_carriage();
		translate([0,0,blade_length*2-blade_width/2*$t])rotate([0,180,180])blade_carriage();
	}
	translate([0,0,-30])allThread(rod, 200);
	translate([rod_spacing,0,-30])allThread(rod, 200);
	translate([rod_spacing/2,stepperObj[LENGTH]+rodObj[DIAMETER]/2,0])rotate([90,45,0])stepper(stepper);
	translate([0,0,stepperObj[HOLE_SPACING]/2])carrots();
	translate([0,0,-stepperObj[HOLE_SPACING]/2-carrot_height])carrots();
	translate([0,0,120])carrots();
	translate([0,0,carrot_height+120])rotate([180,0,0])carrots();
	translate([rod_spacing/2,-7.5-9.2/2,0])rotate([-90,0,0])pinion(12,10/8);
}

module assembly(){
	stepper_mount_asm("NEMA17",5,10,3);


}

assembly();
//rod_spacer(rod, rod_spacing, "M4");
//carrots();
//blade_carriage();
//cutter_assembly();
