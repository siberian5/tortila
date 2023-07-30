use <./1_GridOrig.scad>;
use <./Parts/Ballon50.scad>;

stzoffset = 45.5;

Barge();

module Barge() {
    
    Grid();

    translate([0,-1140,(-220-stzoffset)]) Ballon50();

    translate([0,1140,(-220-stzoffset)]) Ballon50();
    
}
