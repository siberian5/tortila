use <StringerVnesh.scad>;
use <StringerVnutr.scad>;

StringersWithBallons50();


module StringersWithBallons50() {

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

translate([0,-1140,-220]) 
Ballon50();


translate([0,1140,-220]) 
Ballon50();
}


/*

Около 650мм от начала заужения баллонов в сторону хвоста, до 4й балки.

Объёмы спереди назад, литров:
Конус: 3
Скос : 207
Цилиндр: 547
Скос : 177
Конус: 7
===============
Итого: 941 л в каждом, 1882 суммарно.

300 кг весит вооружённый кат с экипажем. На сколько он просядет вниз?
Прикинем, что вниз просядет кат из двух циллиндрических баллонов диаметром
506мм, длиной 2720 + 1820/2 + 1260/2       ( 4260 )

Осадка получается около 14 см.

*/
module Ballon50(){
    
    cylLen = 2720; //435; //3450;
    dia = 506;
    dx = 935;
    dx1 = 935-1820;
    dfront = 240;
    hfront = 172;
    drear = 334;
    dx2 = dx+cylLen;
    

    hull(){
    
        translate([-dx,0,0]) 
        rotate([0,-90,0])    
        cylinder(d=dia,h=cylLen);

        translate([-dx,0,0]) 
        rotate([0,86,0]) 
        cylinder(d1=dia, d2=dfront,h=1820);

        translate([-dx1,0,(dia/2 - dfront/2)-10]) 
        rotate([0,90,0]) 
        cylinder(d1 = dfront,d2=0, h=172);

     
        translate([-dx2,0,0]) 
        rotate([0,-86,0]) 
        cylinder(d1=dia, d2=drear,h=1260);


        translate([-dx2-1260,0,(dia/2 - drear/2)]) 
        rotate([0,-90,0]) 
        cylinder(d1 = drear,d2=0, h=249);

    }
}

