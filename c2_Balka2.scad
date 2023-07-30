use <el_Upor.scad>;
use <c_Balka.scad>;


Balka2();

ang = 90 - 30.59;

module Balka2() {
    //$fn=100;
    
    Balka();
    
    translate([0,-932,0]) rotate([0,-ang,0]) Upor();
    translate([0, 932,0]) rotate([0,-ang,0]) Upor();
    //translate([0, 0,0]) rotate([0,-ang,0]) Upor();

    // Какие углы?
}


