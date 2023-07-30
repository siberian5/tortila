
StringerZadVnesh();

stringerR = 35/2;
length = 2100;
probkaThk = 5;
shpHoleR = 7/2;
//b1 = 15;
//b2 = 435;
b3 = 450;
b4 = 2100 - 15;

module StringerZadVnesh() {

    color([1,0,0]) 
    translate([-length,0,0])
    rotate([0,-90,0]) 
    cylinder(h=probkaThk, r=stringerR);

    difference() {

        rotate([0,-90,0]) 
        cylinder(h=length, r=stringerR);

        translate([-b3,0,0])
        rotate([90,0,0]) 
        cylinder(h=2*stringerR+2,r=shpHoleR, center=true);

        translate([-b4,0,0]) 
        rotate([90,0,0]) 
        cylinder(h=2*stringerR+2,r=shpHoleR, center=true);

    }
}
