use <el_Upor.scad>;
use <c_Balka.scad>;


Balka2();


module Balka2() {
    
    Balka();

    ang = 90 - 30.59;
    
    translate([0,-932,0]) rotate([0,-ang,0]) Upor();
    translate([0, 932,0]) rotate([0,-ang,0]) Upor();

    angShtag = 90 - 73.05;
    rotate([0,-angShtag,0]) Upor();
}


