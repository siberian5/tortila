use <Parts/BalkaMin.scad>;
use <Composite/Balka3Min.scad>;
use <Composite/StringersWithBallons50.scad>;
use <Parts/Upor.scad>;
use <Parts/Shwert.scad>;
use <Parts/Doska.scad>;

b2o = 435;
b3o = 435 + 2200;
b4o = 435 + 2200 + 1635;

stzoffset = 45.5;

ang2xz = 90 - 29.233;
ang3xz = 90 - 66.34;


//translate([ b3o , 0 , 0 ]) 
BargeMin();

//translate([500,0,100]) rotate([0,10,0]) unitaz(); // примерное его идеальное
// место размещения.
/*
Площадь подводной части шверта 3355 кв см
Осадка двух баллонов (примерно) 9912 кв см
(втрое больше, но не работает...)
Соответственно, ЦБС проходит через середину шверта.

*/



//translate([-b2o,0,0]) rotate([90,0,0]) torr();

module BargeMin() {
    
    BalkaMin();
    translate([-b2o,0,0]) BalkaMin();    
    translate([-b3o,0,0]) Balka3();
    translate([-b4o,0,0]) BalkaMin();

    translate([0,0,-stzoffset]) StringersWithBallons50();


    translate([-b2o,-932,0]) rotate([0,-ang2xz,0]) Upor();
    translate([-b2o, 932,0]) rotate([0,-ang2xz,0]) Upor();
//    translate([ -b2o, 0 , 0 ])   rotate([ 0 , -ang2shtag , 0 ]) Upor();

//    translate([-b3o,-932,0]) rotate([0, ang3xz,0]) Upor();
//    translate([-b3o, 932,0]) rotate([0, ang3xz,0]) Upor();


    translate([ -b3o + 215 , 0 , 8 +17.5 - stzoffset ]) 
    Doska();



//    translate([0,0, -stzoffset -(220+506/2 -140 ) + 70 ]) 
//    cube([ 12000 , 10000 , 2 ] , center=true ); //Water();

    translate([-b3o,0,0]) Shwert();


//    translate([ 180 -b3o , 0 , -1000 ]) 
//    cube([ 2 , 8000 , 2000 ] , center=true ); //BS
}



