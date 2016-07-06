        slider = [50,20,10];
        
rotate([90,0,0])difference(){
    union(){
        minkowski(){
            difference(){
                translate([2,2,2])cube(slider-[4,4,4]);
                translate([25,-1,-95])rotate([-90,0,0])cylinder(h=25,r=100, $fn=100);
            }
            sphere(2,$fn=20);
        }
        translate([slider[0]/2,slider[1]/2,50/2+5])cube([15,5,40],center=true);
    }
    translate([slider[0]/2,slider[1]/2+1.5,50-40/2])cube([7.7,3,40.1],center=true);
    translate([slider[0]/2,slider[1]/2+1.5,50-25/2])cube([10.1,3,25.1],center=true);
    translate([25,-1,50-13.25])rotate([-90,0,0])cylinder(h=25,r=1.8);
    translate([25,-1,50-30.5])rotate([-90,0,0])cylinder(h=25,r=2);
}