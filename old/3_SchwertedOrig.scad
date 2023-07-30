use <./2_BargeOrig.scad>;
use <Parts/Shwert.scad>;



b3o = 435 + 2200;

Schwerted();

module Schwerted() {

    Barge();
    
    
    translate([-b3o,0,0]) Shwert();


}


