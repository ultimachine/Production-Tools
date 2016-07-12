difference(){
    union(){
        difference(){
            cylinder(r=50, h=15);
            translate([0,0,-1])cylinder(r=30,h=17);
        }
        cylinder(r = 23/2, h = 40);
        translate([0,0,15/2])cube([90,23,15],center=true);
    }
    translate([-5,-5,28])cube([10.2,10.2,13]);
    translate([40,0,-1])cylinder(r=4.2, h=17);
}