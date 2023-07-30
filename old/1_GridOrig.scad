use <Composite/Balka1.scad>;
use <Composite/Balka2.scad>;
use <Composite/Balka3.scad>;
use <Composite/Balka4.scad>;
use <Composite/StringersOrig.scad>;
use <Parts/Doska.scad>;
use <Parts/Shwert.scad>;

b2o = 435;
b3o = 435 + 2200;
b4o = 435 + 2200 + 1635;

stzoffset = 45.5;




Grid();

module Grid() {
    
    Balka1();
    translate([-b2o,0,0]) Balka2();    
    translate([-b3o,0,0]) Balka3();
    translate([-b4o,0,0]) Balka4();

    translate([-b3o+215,0,8+17.5 - stzoffset]) Doska();
    translate([0,0,-stzoffset]) Stringers();
    
//    translate([-b3o,0,0]) Shwert();


}


