/*

 Паратемры кольца: 
 нижняя плашка около 12мм, вмещает 3 пластины по 4 мм, плотно. 

 К Вантам добавляет 26мм, 




*/


sideLen = 19;
sideThikn = 6;

//translate([-22, 0, 0])
Rig();


module Rig() {

    rotate([90,0,0])
    cylinder(h=sideLen, r=sideThikn/2, center=true);

    translate([0, -8, 0])
    rotate([90,0,72])
    cylinder(h=sideLen, r=sideThikn/2);
    
    translate([0, 8, 0])
    rotate([90,0, 180-72])
    cylinder(h=sideLen, r=sideThikn/2);
    
    translate([16, 13, 0])
    rotate([90,0, 36])
    cylinder(h=sideLen, r=sideThikn/2);
    
    translate([16, -13, 0])
    rotate([90,0, 180-36])
    cylinder(h=sideLen, r=sideThikn/2);
}
