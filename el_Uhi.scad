
Uhi();

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

module Uhi() {

    /*
    translate([0,0,-shporH/2])
    difference() {
        cylinder(h=shporH,d=shporDia,center=true);
    
        dz = shporH/2-holeDia/2 -11;

        translate([0,0,dz]) rotate([0,0,45]) rotate([90,0,0]) cylinder(h=shporDia+10,d=holeDia,center=true);
        translate([0,0,dz]) rotate([0,0,-45]) rotate([90,0,0]) cylinder(h=shporDia+10,d=holeDia,center=true);

        translate([0,0,-sphereOffset -shporH/2]) sphere(d = sphereDia);    




        tempH = sphereDia*1.5;
        tempdz = - shporH/2 - sphereOffset;
        translate([0,0, tempdz])     rotate([0,-72,0]) cylinder(h=tempH,d=cutCylDia,center=true);
        translate([0,0, tempdz])     rotate([0, 72,0]) cylinder(h=tempH,d=cutCylDia,center=true);

    }
    */
    
    translate([0,0,-uhoHeight/2])
    difference() {
        // Труба
        cylinder(h=uhoHeight,d=uhoOuterDia,center=true);
        cylinder(h=uhoHeight+1,d=uhoInnerDia,center=true);
        
        dz = uhoHeight/2 -holeDia/2 -11 ; // shporH/2-holeDia/2 -11;

        // Дырки под болты
        translate([0,0,dz]) rotate([0,0,45]) rotate([90,0,0]) cylinder(h=shporDia+10,d=holeDia+1,center=true);
        translate([0,0,dz]) rotate([0,0,-45]) rotate([90,0,0]) cylinder(h=shporDia+10,d=holeDia+1,center=true);
        
        // Деление посредине
        cube([100, 5, 200],center=true);
    
        // Дырки под ось
        translate([0,0,uhoHeight/2-shporH-sphereOffset])  rotate([90,0,0]) cylinder(h=70,d=17,center=true);
        // Дырка под нижнюю опору d22мм
        translate([0,0,uhoHeight/2-42 -22/2])  rotate([0,90,0]) cylinder(h=70,d=25,center=true);
        
        diffH = 50;
        // Продление дырки под нижнюю опору d22мм
        //translate([0,0,+uhoHeight/2 -42 - 22/2 -diffH/2]) cube([100, 25, diffH],center=true);
        
        // Скругление ушей
        translate([0,0,-uhoHeight/2-3]) rotate([45,0,0]) cube([80, 50, 50],center=true);
        translate([0,0,-uhoHeight/2-3]) translate([0,+15,+10]) rotate([20,0,0]) cube([80, 10, 50],center=true);
        translate([0,0,-uhoHeight/2-3]) translate([0,-15,+10]) rotate([-20,0,0]) cube([80, 10, 50],center=true);
    }
}
