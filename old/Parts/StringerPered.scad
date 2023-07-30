
StringerPered();

stringerR = 35/2;
length = 2200;
probkaThk = 5;
shpHoleR = 7/2;
b1 = 15;
b2 = 435;

module StringerPered() {

    color([1,0,0]) 
    translate([b1,0,0])
    rotate([0,90,0]) 
    cylinder(h=probkaThk, r=stringerR);

    difference() {

        translate([b1,0,0])
        rotate([0,-90,0]) 
        cylinder(h=length, r=stringerR);

        rotate([90,0,0]) 
        cylinder(h=2*stringerR+2,r=shpHoleR, center=true);

        translate([-b2,0,0]) 
        rotate([90,0,0]) 
        cylinder(h=2*stringerR+2,r=shpHoleR, center=true);

    }
}
