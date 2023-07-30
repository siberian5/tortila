use <c_Balka.scad>;
use <el_Upor.scad>;

//translate([0,-330,0]) 
Balka3();

ang = 90 - 65.87;



module Balka3() {
//$fn=100;
    
    tubeWid = 48.5;
    boltR = 9/2;
    
    translate([0,-932,0]) rotate([0,ang,0]) Upor();
    translate([0, 932,0]) rotate([0,ang,0]) Upor();

    difference() { // Дырки для шверта

        Balka(); 

        translate([0,boltR-296,0]) 
        rotate([0,+90,0])
        cylinder(h=tubeWid+2, r = boltR,center=true);

        translate([0,296-boltR,0]) 
        rotate([0,+90,0])
        cylinder(h=tubeWid+2, r = boltR,center=true);

        translate([0,boltR-264,0]) 
        rotate([0,+90,0])
        cylinder(h=tubeWid+2, r = boltR,center=true);

        translate([0,264-boltR,0]) 
        rotate([0,+90,0])
        cylinder(h=tubeWid+2, r = boltR,center=true);

    }
   
}

