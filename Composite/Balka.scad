use <../Parts/Crestovina.scad>;
use <../Parts/BalkaMin.scad>;


//diamVnesh=48.5;


module Balka() {

    //$fn=100;
    //lenTotal=2650;    // вместе с удлинителями

    BalkaMin();

//mm:            | 320 | 650 | 660 | 650 | 320 |    
    translate([0,-1300,0]) Crestovina(); 
    translate([0,-980,0]) Crestovina(); 
    translate([0,-330,0]) Crestovina();
    translate([0,330,0]) Crestovina(); 
    translate([0,980,0]) Crestovina(); 
    translate([0,1300,0]) Crestovina(); 

}

Balka();
