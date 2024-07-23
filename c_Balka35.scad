use <el_Crestovina.scad>;
use <el_Balka35.scad>;


//diamVnesh=48.5;


module Balka35() {

    //$fn=100;
    //lenTotal=2650;    // вместе с удлинителями

    Balka35Min();

//mm:            | 320 | 650 | 660 | 650 | 320 |    
    translate([0,-1300,-5]) Crestovina(); 
    translate([0,-980,-5]) Crestovina(); 
    translate([0,-330,-5]) Crestovina();
    translate([0,330,-5]) Crestovina(); 
    translate([0,980,-5]) Crestovina(); 
    translate([0,1300,-5]) Crestovina(); 

}

Balka35();
