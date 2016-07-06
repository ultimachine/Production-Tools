include <Magpie/magpie.scad>;

module spool_cap(outer_diameter=120, inner_diameter=88, hole_diameter=26, end_thickness=2.5, thickness=2, wall=3, clips = 7){
	difference(){
		union(){
			cylinder(r=outer_diameter/2, h=thickness);
			cylinder(r=inner_diameter/2+wall, h=thickness+end_thickness);
			for(i=[0:clips]){
				rotate([0,0,360*i/clips])translate([-wall,inner_diameter/2-wall,0])cube([wall,wall*2,thickness+end_thickness+wall]);
			}
			difference(){
				cylinder(r=inner_diameter/2+wall, h=thickness+end_thickness+wall);
				cylinder(r=inner_diameter/2+wall/2, h=thickness+end_thickness+wall+eta);
			}
		}	
		translate([0,0,thickness])polyCylinder(r=inner_diameter/2,h=end_thickness+eta);
		translate([0,0,-eta])polyCylinder(r=hole_diameter/2,h=thickness+eta*2);
		translate([0,0,thickness+end_thickness])cylinder(r1=inner_diameter/2, r2=inner_diameter/2-wall/2,h=wall/2+eta);
		translate([0,0,thickness+end_thickness+wall/2])cylinder(r2=inner_diameter/2, r1=inner_diameter/2-wall/2,h=wall/2+eta);
	}
} 

spool_cap();

