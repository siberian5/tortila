Crestovina();

//platform
wid1=30;             //  Ширина платформы
len1=43.5;           // Длина платформы ( вокруг балки)
thicns=2.5;           // толщина листа нержавейки
holeR=3;              // Диаметр внутренних дырок
holesRange=26;  // Расстояние меж центрами внутренними дырок в платформе
delta=(len1-(holesRange+2*holeR))/2 + holeR;


//ears
heigt1=24;    //Высота негнутой части уха
lengt2=30;       //Ширина уха
holeR2=3.5;    //Радиус отверстия для шплинта
topoffset=4.5; //Расстояние от нижнего ребра уха до отверстия шплинта
cornerR=7;      //Радиус скругления ушей.

// балочные охваты
topRad=8;
topMid=27;
clyopRad=2.5;



// Смещение платформы. 
// Все остальные координаты крестовины нужно считать относительно этих точек.
px = -len1/2;
py = -wid1/2;
pz = -27;



module Crestovina() {
    
    $fn = 50;    
    
    translate([px+len1/2,py+wid1/2,pz+thicns/2])     Platform();

    dx1=  px+cornerR+(len1-lengt2)/2;
    dy1=  py - thicns;
    dz1=  pz  - (heigt1-cornerR + thicns);

    //ears
    translate([dx1,dy1,dz1]) Ear();
    dy2 = py+2*thicns+wid1;
    translate([dx1,dy2,dz1]) Ear();


    //изгибы нижние
    translate([px + len1/2  ,py,pz-thicns])                          IzgibN();
    translate([px + len1/2, py+wid1, pz-thicns]) rotate([0,0,180])   IzgibN();

    //Балочные охваты
    translate([px-3*thicns/2, py+wid1/2,pz+topMid])     Ohvat();
    translate([px+len1+3*thicns/2, py+wid1/2,pz+topMid])     Ohvat();

    //изгибы верхние
    translate([px,py+wid1/2,pz+2*thicns])     Izgib1();
    translate([px+len1,py+wid1/2,pz+2*thicns])  rotate([0,0,180])   Izgib1();





}


module Ear() {

    //ear1
    difference() {

        hull() {
            translate([0, 0, 0])
            rotate([90,0,0]) 
            cylinder(h=thicns, r=cornerR);

            translate([0+lengt2-2*cornerR, 0, 0])  
            rotate([90,0,0]) 
            cylinder(h=thicns, r=cornerR);

            translate([(0-cornerR),  (0-thicns),0])   
            cube([lengt2, thicns, heigt1-cornerR]);
        }

        translate([-cornerR+lengt2/2,  thicns, -cornerR+holeR2+topoffset])
        rotate([90,0,0]) 
        cylinder(h=thicns*3, r=holeR2);

    }
}

module IzgibN(){

    difference() { 
        rotate([0,90,0]) 
        cylinder(h=lengt2, r=thicns*2, center=true);

        rotate([0,90,0]) 
        cylinder(h=lengt2+2, r=thicns, center=true);        

        translate([-lengt2/2-1,0,-2*thicns])      
        cube([lengt2+2,thicns*3 ,thicns*3]);

        translate([-lengt2/2-1,-thicns,-3*thicns])      
        cube([lengt2+2,thicns*3 ,thicns*3]);

    }
    
}    

module Ohvat(){
    
    difference() {
        hull() {
            translate([ 0, -wid1/2, 0]) 
            rotate([0,90,0]) 
            cylinder(h=thicns,r=topRad, center=true);

            translate([ 0, wid1/2, 0]) 
            rotate([0,90,0]) 
            cylinder(h=thicns,r=topRad, center=true);

            translate([0, 0,-topMid+thicns*2.5]) 
            cube([thicns,  wid1 ,thicns],center=true);
        }

        translate([0, -wid1/2, 0]) 
        rotate([0,90,0]) 
        cylinder(h=thicns*3,r=clyopRad,center=true);

        translate([0, wid1/2,0]) 
        rotate([0,90,0]) 
        cylinder(h=thicns*3,r=clyopRad,center=true); 
    }
}

module Platform() {
    difference() {
        cube([len1, wid1, thicns],center=true);

        translate([-holesRange/2,0, -1])  
        cylinder(h=thicns*2, r=holeR,center=true);

        translate([holesRange/2,0, -1]) 
        cylinder(h=thicns*2, r=holeR,center=true);
    }
}

module Izgib1() {

    difference() {
        rotate([-90,0,0]) 
        cylinder(h=wid1, r=thicns*2,center=true);

        rotate([-90,0,0]) 
        cylinder(h=wid1+2, r=thicns,center=true);      

        translate([3*thicns/2, 0 ,thicns/2])  
        cube([thicns*3,wid1+2,thicns*3],center=true);

        translate([thicns/2, 0,3*thicns/2])  
        cube([thicns*3,wid1+2,thicns*3],center=true);
    }
}
