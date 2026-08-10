use <el_ShplRoz.scad>;


    holeOffset = 20;
    diamVnesh = 40;

translate([-2000,0,0]) Bushprit(2000);

module Bushprit(bushpLen) {
   translate([+holeOffset +bushpLen/2,0,0]) rotate([0,90,0]) cylinder(h=bushpLen, d=diamVnesh, center=true);        
   rotate([90,0,180]) ShplRoz();
   
   // червяк генакера текущий
   translate([bushpLen-30,0,20]) rotate([0,0,0]) cube([30, 10, 40 ], center=true);        
   
   // червяк кливера перспективный
   translate([bushpLen*3/4,0,20]) rotate([0,0,0]) cube([30, 10, 40 ], center=true);        
   
   // червяк генуи перспективный 
   
   translate([bushpLen*3/5,0,20]) rotate([0,0,0]) cube([30, 10, 40 ], center=true);        
}
