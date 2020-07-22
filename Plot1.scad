use <Parts/BalkaMin.scad>;
use <Composite/Balka3Min.scad>;
use <Composite/StringersWithBallons50.scad>;
use <Parts/Upor.scad>;
use <Parts/Shwert.scad>;

b2o = 435;
b3o = 435 + 2200;
b4o = 435 + 2200 + 1635;

stzoffset = 45.5;

ang2xz = 90 - 29.233;
ang3xz = 90 - 66.34;



translate([435,0,0]) BargeMin();

translate([0,0, -stzoffset -(220+506/2 -140 )]) Water();
translate([-2200+215,0,8+17.5 - stzoffset]) Doska();
translate([-2200,0,0]) Shwert();
translate([180-2200,0,-1000]) BS();
translate([500,0,100]) rotate([0,10,0]) unitaz(); // примерное его идеальное
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
//    translate([-b3o,-932,0]) rotate([0, ang3xz,0]) Upor();
//    translate([-b3o, 932,0]) rotate([0, ang3xz,0]) Upor();


}

module unitaz() {

    rotate_extrude(convexity = 10)
    translate([200, 0, 0])
    circle(r = 30, $fn = 100);

}



module Water(){

    cube([12000,8000,5], center=true);

}


module Doska() {

cube([300,700,16],center=true);

}

module BS() {

    cube([3,6000,1400],center=true); 

}
