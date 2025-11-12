use <el_ShplRoz.scad>;


    holeOffset = 20;
    diamVnesh = 40;

Bushprit(2000);

module Bushprit(bushpLen) {
   translate([+holeOffset +bushpLen/2,0,0]) rotate([0,90,0]) cylinder(h=bushpLen, d=diamVnesh, center=true);        
   rotate([90,0,180]) ShplRoz();
}
