use <el_ShplRoz.scad>;

Boom();

    gikLen = 2200;
    diamVnesh = 48.5;
    platformThickns = 5;
    ushiThickns = 6;
    lenA = 40;
    shplintDia = 8.5;
    shplintHoleHeight = 15;


module Boom() {
    
    $fn = 50;
    
    px = - platformThickns  - shplintHoleHeight;
    translate([px,0,0]) rotate([0,-90,0]) cylinder(h=gikLen, d=diamVnesh);        // сам гик
    ShplRoz();
}
