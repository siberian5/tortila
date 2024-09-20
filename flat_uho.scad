
projection() Uho();

/*

    Расстояние от верха шпора до центра вырезанной сферы: 69.5
    = shporH + shimH + sphereOffset



*/

//shimH = 5;
//mastDia = 69;
//sphereDia = 57;
//cutCylDia = 22;




////////////////

uhoHeight = 56.5 + 16 + 17.5; // 90
uhoInnerDia = 57;
sideThick = 4;
uhoOuterDia = uhoInnerDia + 2 * sideThick;

shporH = 52;
shporDia = 57;
holeDia = 10;

// На сколько ниже центр вырезанной сферы 
// Нижней грани шпора 
sphereOffset = 12.5;                    

wid = 94;
hgt = 90;

boltYoffset = 16;
boltXoffset = 25.5;

module Uho() {
        
    translate ([-wid/2, 0, 0]) {
        intersection() {

            difference() {
                cube([wid, hgt, 1]);
                translate ([+wid/2 -boltXoffset, boltYoffset, 0])       cylinder(h=3, d=holeDia+1,center=true);
                translate ([+wid/2 +boltXoffset, boltYoffset, 0])       cylinder(h=3, d=holeDia+1,center=true);
                translate ([+wid/2 , +64.5, 0])       cylinder(h=3, d=17 ,center=true);
                translate ([+wid , +53, 0])       cylinder(h=3, d=25 ,center=true);
                translate ([0, +53, 0])       cylinder(h=3, d=25 ,center=true);
                translate ([+wid/2+35, 50, -1]) rotate([0,0,15]) cube([70, 70, 3]);
                translate ([-wid/2-10, 65, -1]) rotate([0,0,-15]) cube([70, 70, 3]);
            } 
            
            cube([wid, 64.5, 1]);
        }

        intersection() {

            difference() {
                cube([wid, hgt, 1]);
                translate ([+wid/2 -boltXoffset, boltYoffset, 0])       cylinder(h=3, d=holeDia+1,center=true);
                translate ([+wid/2 +boltXoffset, boltYoffset, 0])       cylinder(h=3, d=holeDia+1,center=true);
                translate ([+wid/2 , +64.5, 0])       cylinder(h=3, d=17 ,center=true);
                translate ([+wid , +53, 0])       cylinder(h=3, d=25 ,center=true);
                translate ([0, +53, 0])       cylinder(h=3, d=25 ,center=true);
                translate ([+wid/2+35, 50, -1]) rotate([0,0,15]) cube([70, 70, 3]);
                translate ([-wid/2-10, 65, -1]) rotate([0,0,-15]) cube([70, 70, 3]);
            } 
            
            translate([0, 64.5, 0]) cube([wid, 50, 1]);
            
            translate ([+wid/2 , +64.5, 0])       cylinder(h=3, d=60 ,center=true);
        }
    }
}
