
Shpor();

/*

    Расстояние от верха шпора до центра вырезанной сферы: 70




*/

shporH = 53;
shporDia = 57.5;
holeDia = 10;
mastDia = 69;

sphereDia = 57;
cutCylDia = 22;
sphereOffset = 12;


module Shpor() {

    translate([0,0,-shporH/2-5])  {

    difference() {
        cylinder(h=shporH,d=shporDia,center=true);
    
        dz = shporH/2-holeDia/2-11;

        translate([0,0,dz]) rotate([0,0,45]) rotate([90,0,0]) cylinder(h=shporDia+10,d=holeDia,center=true);
        translate([0,0,dz]) rotate([0,0,-45]) rotate([90,0,0]) cylinder(h=shporDia+10,d=holeDia,center=true);

        translate([0,0,-sphereOffset -shporH/2]) sphere(d = sphereDia);    




        tempH = sphereDia*1.5;
        tempdz = - shporH/2 - sphereOffset;
        translate([0,0, tempdz])     rotate([0,-75,0]) cylinder(h=tempH,d=cutCylDia,center=true);
        translate([0,0, tempdz])     rotate([0, 75,0]) cylinder(h=tempH,d=cutCylDia,center=true);

    }
    
    shimH = 5;
    translate([0,0,shimH/2 + shporH/2]) cylinder(h=shimH,d=mastDia,center=true);
    

    }


}
