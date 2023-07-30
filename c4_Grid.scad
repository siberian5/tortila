use <c3_Balkas.scad>;
use <c2_Stringers.scad>;
use <el_Doska.scad>;
use <el_Shwert.scad>;

b2o = 435;
b3o = 435 + 2200;
b4o = 435 + 2200 + 1635;

stzoffset = 45.5;




Grid();

module Grid() {
    
    Balkas();

    translate([-b3o+215,0,8+17.5 - stzoffset]) Doska();
    translate([0,0,-stzoffset]) Stringers();
    
    translate([-b3o,0,0]) Shwert();


}


