use <el_Crestovina.scad>;
use <el_Balka25.scad>;




module Balka25() {

    Balka25Min();

//mm:             25 - 650 - 660 - 650 - 25     
    translate([0,-980,0]) Crestovina(); 
    translate([0,-330,0]) Crestovina();
    translate([0,330,0]) Crestovina(); 
    translate([0,980,0]) Crestovina(); 

}

Balka25();
