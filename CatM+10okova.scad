//use <Barge.scad>;
use <BargeMinShwert.scad>;
use <Composite/PyraFL.scad>;
use <Composite/PyraRL.scad>;
use <Parts/PyraTop.scad>;
use <Composite/Mast.scad>;
use <Composite/Boom.scad>;
use <Parts/Grot.scad>;
use <Parts/Staksel.scad>;
use <Composite/Rangout+10okova.scad>;

// consts:

b2o = 435;
b3o = 435 + 2200;
b4o = 435 + 2200 + 1635;
stzoffset = 45.5;
uo = 932; 

uporWid = 50;
thicns = 2;
tubeDia = 48.5;
shplintHoleDia = 8.5;
shplintHoleHeig = 21;
sphereRad = 13;

holeOffset = tubeDia/2+thicns+shplintHoleHeig;

ang2xy = 25.4141;
ang2xz = 30.59;    

ang3xy = 39.9445;
ang3xz = 65.87; 

pyrTopOffsetX = 1739.4;
pyrTopOffsetZ = 1028.3;
mastPyrOffsetZ = 70 + 61.5;
okovaLevel = 4099.5+100;


// dx, dy, dz завели для того, чтобы начало координат перетаскивать по
// модели!!!

//    dx = b3o;
    dx = b2o+pyrTopOffsetX;
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


module Construction() { 

    translate([ -b2o -pyrTopOffsetX , 0 , pyrTopOffsetZ + mastPyrOffsetZ   ])
    Rangout();



    BargeMin();
//    Frame();

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

    translate([ -dx1 , -dy1 , -dz1 ]) 
    PyraTop();

    //CP 
//    translate([ -dx1 - 42 - 438 , 0 , -dz1+500 ])
//    cube([2 , 4000 , 3500 ],center=true);

}


