include </Magpie/magpie.scad>;
use <blade.scad>;
use <herringbone-rack.scad>;
use <pinion.scad>;

height = 27;
rod = "M8";
rodObj = getScrewDims(rod);
stepper = "NEMA17";
stepperObj = getStepperDims(stepper);

blade_length = 37.5;
blade_width = 17.5;
rod_spacing = 7.5*2+blade_width;

carrot_height = 10;

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
			translate([0,0,-eta])poly_cylinder(r=5, h = height+eta*2);
			translate([rod_spacing,0,-eta])poly_cylinder(r=5, h = height+eta*2);	
			translate([rod_spacing/2+8.5/2,7.5+eta,4.5/2+2.75])rotate([90,0,0])poly_cylinder(r=1.5, h = 15+eta*2);
			translate([rod_spacing/2-8.5/2,7.5+eta,4.5/2+2.75])rotate([90,0,0])poly_cylinder(r=1.5, h = 15+eta*2);	

	}
}

module blade_carriage_a(){
	union(){
		blade_carriage_asm();
		translate([rod_spacing,-7.5-9.2/2,-30])rotate([90,0,-90])rack(2.1,2.5,12,5,20*3.14159/180,25);
		//rack(innerRadius,borders,diametralPitch,numberOfTeeth,pressureAngle,centerAngle);
	}
}

module blade_carriage_b(){
	union(){
		blade_carriage_asm();
		translate([0,7.5+9.2/2,100])rotate([90,0,90])rack(2.1,2.5,12,5,20*3.14159/180,25);
		//rack(innerRadius,borders,diametralPitch,numberOfTeeth,pressureAngle,centerAngle);
	}
}

module blade_carriage_asm(){
	blade_carriage();
	translate([rod_spacing/2,0,4.5/2+2.75])rotate([0,90,-90])blade();
}

module cutter_assembly(){
	translate([0,0,stepperObj[WIDTH]*sin(45)]){
		translate([0,0,blade_width/2*$t])blade_carriage_a();
		translate([0,0,blade_length*2-blade_width/2*$t])rotate([0,180,180])blade_carriage_b();
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

module carrots(){
	difference(){
		union(){
			hull(){
				cylinder(r = 7.5,h = carrot_height);
				translate([rod_spacing,0,0])cylinder(r = 7.5,h = carrot_height);
			}
		}
		translate([0,0,-eta])poly_cylinder(r=rodObj[DIAMETER]/2, h = carrot_height+eta*2);
		translate([rod_spacing,0,-eta])poly_cylinder(r=rodObj[DIAMETER]/2, h = carrot_height+eta*2);
		translate([rod_spacing/2,0.1,carrot_height/2])rotate([90,0,0])poly_cylinder(r=1.5, h = carrot_height+0.2);

		translate([-7.6,0,-0.1])cube([rod_spacing+15.2,7.6,carrot_height+0.2]);
	}
}

//carrots();
//blade_carriage();
cutter_assembly();
//rotate([0,90,0])rack(2.1,2.5,12,5,20*3.14159/180,25);
