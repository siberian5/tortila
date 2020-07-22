//use <Barge.scad>;
//use <BargeMin.scad>;
use <BargeMinShwert.scad>;
use <Composite/PyraFL.scad>;
use <Composite/PyraRL.scad>;
use <Parts/PyraTop.scad>;
//use <Composite/Mast.scad>;
//use <Composite/Boom.scad>;
//use <Parts/Grot.scad>;
//use <Parts/Staksel.scad>;
//use <Composite/Rangout+10okova+Genoa.scad>;

// consts:
include <consts.scad>;



// dx, dy, dz завели для того, чтобы начало координат перетаскивать по
// модели!!!

//    dx = b3o;
    dx = b2o+pyrTopOffsetX;
//      dx = 0;
//    dx = b2o;
    dy = 0; //980;//-uo;
//    dz = - pyrTopOffsetZ -okovaLevel; //- 300;
//    - 5300;
    dz = 0;

// ************//    




// Cat:
//rotate([ 0 , 17.8 , 0 ]) 
translate([ dx , dy , dz ]) 
Construction();










//TODO
/* чего сделать:

    1. Узнать размеры генакера, прикинуть.
    2. Подыскать вариант узкого профиля, чтобы особо не утяжелять переднюю
    балку.
    3. Изучить тему с закрутками.

*/



translate([- b2o - pyrTopOffsetX + dx+30 , dy , dz-100]) 
rotate([ 0 , 0 , 0 ]) BP();
module BP() {

    cube([ 180 , 180 , 5 ] , center=true );

    translate([ -180 , 70 , -35/2 -3 ])
    rotate([ 0 , 0 , -1 ])
    rotate([ 0 , 90 , 0 ]) 
    cylinder(d=35,h=2700);

    translate([ -180 , -70 , -35/2 -3 ]) 
    rotate([ 0 , 0 , 1 ])
    rotate([ 0 , 90 , 0 ]) 
    cylinder(d=35,h=2700);
}









translate([- b2o - pyrTopOffsetX + dx+30 , dy , dz-20]) Doska2();
module Doska2() {
    cube([250,700,16],center=true);
    translate([0,0,-25-8]) cube([180,180,50],center=true);
}

translate([ dx , 0 , -tubeDia-36-3 ]) BalkaBP();
//mm:            | 320 | 650 | 660 | 650 | 320 |    
module BalkaBP() {
    rotate([ 90 , 0 , 0 ]) cylinder( d=tubeDia, h=650+660+650, center=true );

    translate([1+tubeDia/2 ,  920 , 39+5 ]) cube([ 2 , 50 , tubeDia+39+2*10], center=true );
    translate([-1-tubeDia/2 , 920 , 39+5 ]) cube([ 2 , 50 , tubeDia+39+2*10], center=true );

    translate([1+tubeDia/2 ,  -920 , 39+5 ]) cube([ 2 , 50 , tubeDia+39+2*10], center=true );
    translate([-1-tubeDia/2 , -920 , 39+5 ]) cube([ 2 , 50 , tubeDia+39+2*10], center=true );
}

module Construction() { 

//    translate([ -b2o -pyrTopOffsetX , 0 , pyrTopOffsetZ + mastPyrOffsetZ   ])
//    Rangout();

    BargeMin();

    translate([-b2o,uo,0])
    rotate([0,ang2xz,0]) 
    translate([-holeOffset,0,0]) 
    rotate([0,0,ang2xy]) 
    PyraFL();


    translate([-b2o,-uo,0])
    rotate([0,ang2xz,0]) 
    translate([-holeOffset,0,0]) 
    rotate([0,0,-ang2xy]) 
    PyraFL();

    translate([-b3o,uo,0])
    rotate([0,-ang3xz,0]) 
    translate([holeOffset,0,0]) 
    rotate([0,0,180 - ang3xy]) 
    PyraRL();

    translate([-b3o,-uo,0])
    rotate([0,-ang3xz,0]) 
    translate([holeOffset,0,0]) 
    rotate([0,0,ang3xy-180]) 
    PyraRL();


    dx1 = b2o + pyrTopOffsetX;
    dy1 = 0;
    dz1 = - pyrTopOffsetZ;

    translate([ -dx1 , -dy1 , -dz1 ])     PyraTop();

    translate([ 520 , 0 , 0 ]) sphere( d=50, center=true ); // сюда спускается
    // штиляка
    translate([ 390 , 0 , 300 ]) sphere( d=50, center=true ); // угол штиляки
}


