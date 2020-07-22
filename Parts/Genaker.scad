genRad = 2672;

cs = 4*genRad; // cube side (size)

Genaker();


module Genaker() {

//    rotate([ 0 , -71/2 , 0])
    rotate([ 0 , -60/2 , 0])
    rotate([ 0 , 0 , 40 ])
    rotate([ 0 , 71/2 , 0 ])
    translate([0,0,-genRad])
    difference() {
        
        sphere(r=genRad);
        sphere(r=genRad-1);

        translate([0,-cs/2,0])    
        cube([cs,cs,cs], center=true);
    
    
        rotate([0,0,70])
        translate([0,cs/2,0])    
        cube([cs,cs,cs], center=true);

        rotate([0,109,0])
        translate([cs/2,0,0])    
        cube([cs,cs,cs], center=true);

    }
}
