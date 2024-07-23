use <c_Balka.scad>;
use <el_Upor.scad>;


module Balka1() {
//$fn=100;
    
    ang = 90 - 60;

    
    Balka();
    rotate([0,-ang,0]) Upor();

}

Balka1();
