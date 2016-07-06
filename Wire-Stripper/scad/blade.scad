include <Magpie/magpie.scad>

/* blade(vector, vector, float) 
	Creates a two hole mirrored-guillotine style blade
	Note: holes only need xy location
	Note: Slope is fixed... for now
*/
module blade(bladeDims, firstHole, secondHole, holeDia){
	translate([0,0])
	color("Gray")
	difference(){
		cube(bladeDims);
		hull(){
			translate([0,0,-eta])rotate([0,0,45])cube([bladeDims[1]*sin(45),bladeDims[1]*sin(45),bladeDims[2]]);
			translate([bladeDims[2],0,bladeDims[2]])rotate([0,0,45])cube([bladeDims[1]*sin(45),bladeDims[1]*sin(45),bladeDims[2]]);
		}
		translate(firstHole+[0,0,-eta])cylinder(r=holeDia/2, h=bladeDims[2]+eta*2);
		translate(secondHole+[0,0,-eta])cylinder(r=holeDia/2, h=bladeDims[2]+eta*2);
	}
}

blade([37.5,16,3],[32.5,3.75,0],[32.5,12.25,0],4.5);
