use <c2_Balka1.scad>;
use <c2_Balka2.scad>;
use <c_Balka25.scad>;
use <c2_Balka3.scad>;
use <c_Balka35.scad>;
use <c2_Balka4.scad>;

b2o = 435;
b25o = 435 + 800;
b3o = 435 + 2200;
b35o = 435 + 2200 + 1235;
b4o = 435 + 2200 + 1635;

stzoffset = 45.5;




Balkas();

module Balkas() {
    
    Balka1();
    translate([-b2o,0,0]) Balka2();    
    translate([-b25o,0,0]) Balka25();    
    translate([-b3o,0,0]) Balka3();
    translate([-b35o,0,5]) Balka35();
    translate([-b4o,0,0]) Balka4();

    //translate([-b3o+215,0,8+17.5 - stzoffset]) Doska();
    //translate([0,0,-stzoffset]) Stringers();
    
//    translate([-b3o,0,0]) Shwert();


}


