use <StringerVnesh.scad>;
use <StringerVnutr.scad>;

Stringers();


module Stringers() {

/* 
        | 320 | 650 | 660 | 650 | 320 | 
*/

    s1o = -330 - 650 - 320 ;
    s2o = -330 - 650 ;
    s3o = -330 ;
    s4o = 330 ;
    s5o = 330+650 ;
    s6o = 330+650+320 ;

    translate([0,s1o,0])   StringerVnesh();
    translate([0,s2o,0])   StringerVnesh();
    translate([0,s3o,0])   StringerVnutr();
    translate([0,s4o,0])   StringerVnutr();
    translate([0,s5o,0])   StringerVnesh();
    translate([0,s6o,0])   StringerVnesh();

}



