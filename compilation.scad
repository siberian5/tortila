use <c4_Grid.scad>;
use <c_PyraFL.scad>;
use <c_PyraRL.scad>;
use <c_Mast.scad>;
use <el_PyraTop.scad>;
use <el_Uhi.scad>;
use <el_Ballon50.scad>;
use <el_Vanta.scad>;
use <el_Us.scad>;
use <el_Grot_now.scad>;
use <c_Boom.scad>;
use <el_Staksel_now.scad>;
use <el_Staksel_perspective.scad>;
use <el_stak_storm_now.scad>;


// consts:
b2o = 435;
b3o = 435 + 2200;
b4o = 435 + 2200 + 1635;
stzoffset = 45.5;

shtagRotAng = 106.45; 

   ang = 2; // Угол завала мачты
   mastAng = ang;

// translate([1028.3 + b2o, 0, -6000]) {
  Grid();
  Pyramid();
  MastInstallation();
  Ballons();
  Vantas();
  //ShtagNow();
  ShtagPerspective();
  GrotInstallationNow();
  BoomInstallationNow();
  //StakselInstallationNow();
  StakselInstallationPerspective();
  UsiInstallation();
  StormStakselInstallationV1();
//  }

module StormStakselInstallationV1() {

// Базовая инсталляция штормового как летучки — с топа.

  ssOffsetShtag = 3700;
  vantaLen = 8200;
  vantaDia = 3;

  rotateAdd = 3;



  pyrTopOffsetX = 1739.4;
  pyrTopOffsetZ = 1028.3;
  
  pyraTopSphereOffset = 61.5;

  mastRotationCenterZ = pyrTopOffsetZ + pyraTopSphereOffset;
  mastRotationCenterX = b2o + pyrTopOffsetX; 


  mastSSOffset = 0;

  ssHeight = 6500;

  rotate([0, -mastAng, 0])
  translate([mastSSOffset-mastRotationCenterX, 0, mastRotationCenterZ+ssHeight])
  //rotate([0, 270, 0])
  rotate([0, 90-shtagRotAng-rotateAdd, 0])
  rotate([0, 0, 15])
  {
    translate([0, 0, -ssOffsetShtag])
    StakselStorm();
    rotate([0, 180, 0])
    cylinder(h=vantaLen, r=vantaDia/2);

  }
}


module StormStakselInstallationV2() {

// Если сделать длиннее бушприт — 
// Можно будет чуть-чуть повыше поднять парус по передней шкаторине.
 // ssOffsetShtag = 3700;
  ssOffsetShtag = 3400;
  vantaLen = 8200;
  vantaDia = 3;

  //rotateAdd = 3;
  rotateAdd = 6;



  pyrTopOffsetX = 1739.4;
  pyrTopOffsetZ = 1028.3;
  
  pyraTopSphereOffset = 61.5;

  mastRotationCenterZ = pyrTopOffsetZ + pyraTopSphereOffset;
  mastRotationCenterX = b2o + pyrTopOffsetX; 


  mastSSOffset = 0;

  ssHeight = 6500;

  rotate([0, -mastAng, 0])
  translate([mastSSOffset-mastRotationCenterX, 0, mastRotationCenterZ+ssHeight])
  //rotate([0, 270, 0])
  rotate([0, 90-shtagRotAng-rotateAdd, 0])
  rotate([0, 0, 15])
  {
    translate([0, 0, -ssOffsetShtag])
    StakselStorm();
    rotate([0, 180, 0])
    cylinder(h=vantaLen, r=vantaDia/2);

  }
}

module UsiInstallation() {

  // Усы длиной 117 см "от заклёпки до центра треугольника"

  tubeRadOffset = 28;

  strOffset = 330 + 650 - 15;

  //b2o = 435;
  angY = -shtagRotAng;
  angYd = 7.25;// 7.15;
  angX = 56.75;

  translate([ -b2o + tubeRadOffset, -strOffset, 0])
  rotate([-angX, 0, 0])
  rotate([0, angY + angYd, 0])
  Us(1170);
  
  translate([ -b2o + tubeRadOffset, strOffset, 0])
  rotate([angX, 0, 0])
  rotate([0, angY +angYd, 0])
  Us(1170);
}

module StakselInstallationPerspective() {

  // нужно оставить 5 сверху на погон, 15 снизу на закрутку и ещё 15 снизу на натягивание по шкаторине вдоль троса. 
  // Итого, если 6 метров трос, то шкаторина паруса — 5.65, сдвинута вверх по линии штага на 660 + 300

  shtagOffset = 660 + 300;

  tubeRadOffset = 28;

  translate([-b2o + tubeRadOffset, 0, 0])
  rotate([0, 90 -  shtagRotAng, 0])
  //rotate([0, -16.24, 0])
  rotate([0, 0, 15])
  translate([0, 0, shtagOffset])
  //Staksel_perspective(2.5, 6, 0.29);
  Staksel_perspective(3.5, 5.65, 0.15);
}


module StakselInstallationNow() {

  // Текущий стаксель будет работать, если его поднять на полметра по штагу от центра балки.

  shtagOffset = 1500;

  translate([-b2o, 0, 0])
  rotate([0, -16.24, 0])
  rotate([0, 0, 15])
  translate([0, 0, shtagOffset])
  Staksel();
}



// Инсталляция текущего грота, задранного на самый верх 
// и оттягиваемого гиком. 
module BoomInstallationNow() {

    shporSphereDiffOffset = 69.5;
    pyrTopOffsetX = 1739.4;
    pyrTopOffsetZ = 1028.3;
    pyraTopSphereOffset = 61.5;

    mastRotationCenterZ = pyrTopOffsetZ + pyraTopSphereOffset;
    mastRotationCenterX = b2o + pyrTopOffsetX; 

    translate([-mastRotationCenterX-61.5, 0, mastRotationCenterZ + 99]) 
    rotate([0, 10,0])
    Boom();

}

module GrotInstallationNow() {

    grotOffsetZ = 600; 

    shporSphereDiffOffset = 69.5;
    pyrTopOffsetX = 1739.4;
    pyrTopOffsetZ = 1028.3;
    pyraTopSphereOffset = 61.5;

    mastRotationCenterZ = pyrTopOffsetZ + pyraTopSphereOffset;
    mastRotationCenterX = b2o + pyrTopOffsetX; 

    translate([-mastRotationCenterX, 0, mastRotationCenterZ]) 
    rotate([0, -2, 0])

    translate([-50, 0, 120 + grotOffsetZ])
    Grot();
}



module Vantas() {

    // right
    translate([-b3o+20, -1140+213, 85])
    rotate([-8.31, 0, 0])
    rotate([0, -87.15, 0])
    Vanta(6384);
    
    // left 
    translate([-b3o+20, 1140-213, 85])
    rotate([8.31, 0, 0])
    rotate([0, -87.15, 0])
    Vanta(6384);
    
    // right alt
    translate([-b3o+20, -1140+213, 85])
    rotate([-8.03, 0, 0])
    rotate([0, -87.75, 0])
    Vanta(6384);
}

module ShtagPerspective() {

    // Вверху 5см зазор, внизу 30см.
    tubeRadOffset = 28;

    triaHei = 660;
    testOffset = -6;
    testOffsetA = 6;
    translate([-b2o + tubeRadOffset, 0, 0])
    rotate([0, -shtagRotAng, 0])
    translate([triaHei + testOffset + testOffsetA, 0, 0])
    Vanta(6660 - triaHei - testOffset);
}

module ShtagNow() {
    translate([-b2o, 0, 0])
    rotate([0, -106.24, 0])
    Vanta(6660);
}

module Ballons() {

    stzoffset = 45.5;

    translate([0,1140,(-220-stzoffset)]) Ballon50();
    translate([0,-1140,(-220-stzoffset)]) Ballon50();
}

module MastInstallation() {

   shporSphereDiffOffset = 69.5;

   pyrTopOffsetX = 1739.4;
   pyrTopOffsetZ = 1028.3;
   pyraTopSphereOffset = 61.5;

   mastRotationCenterZ = pyrTopOffsetZ + pyraTopSphereOffset;
   mastRotationCenterX = b2o + pyrTopOffsetX; 

   translate([-mastRotationCenterX, 0, mastRotationCenterZ]) 
   rotate([0,-ang,0]) 
   translate([0,0, shporSphereDiffOffset]) 
   Mast(); 

    // Уши одели
   shimH = 5;
   translate([-mastRotationCenterX,0,mastRotationCenterZ])
   rotate([0,-ang,0]) 
   translate([0,0, shporSphereDiffOffset-shimH]) Uhi();
}

module Pyramid() {

  // Углы ног пирамиды
  ang2xy = 25.4141;
  ang2xz = 30.59;    

  ang3xy = 39.9445;
  ang3xz = 65.87; 

  //смещение верхушки пирамиды относительно середины второй (!!!) балки. 
  pyrTopOffsetX = 1739.4;
  pyrTopOffsetZ = 1028.3;
  pyraTopSphereOffset = 61.5;
  shporSphereDiffOffset = 69.5;
  mastPyrOffsetZ =  pyraTopSphereOffset + shporSphereDiffOffset;

  thicns = 2;
  tubeDia = 48.5;
  shplintHoleHeig = 21;
  // расстояние от центра балки 
  //              до центра дырки шплинта в упоре
  holeOffset = tubeDia/2+thicns+shplintHoleHeig;


  uo = 932; 
   
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
}
















//// Maчта:
//mastLength = 5800;
//mastDia = 69;
//stepsH = 45.5;
//
//blokHoleH = 44;
//blokHoleW = 16.5;
//shkiv2dia = 30;
//shkiv2wid = 10;
//
//stubWidth = 3;
//okovaRise = 20;//39;
//
//
//// Окова вант:
//okH = 81;
//okH1 = 66;
//bigR = 20;
//holeR = 6;
//frontLen = 44;
//
//
//
//stakH = okovaLevel - okovaRise - blokHoleH;
//genH = okovaLevel -100 + 560.5;
//
//
//
//
//// Штаг:
//ang2shtag 
//= atan( (pyrTopOffsetX - 24 - mastDia/2) / (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ) );
//
//shtagLen = 
//sqrt(
//    (pyrTopOffsetX - 24 - mastDia/2)*(pyrTopOffsetX - 24 - mastDia/2) +
//    (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ)*(bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ)
//) - holeOffset;
//
//echo( "shtagLen: " , shtagLen);
//echo( "ang2shtag: " , ang2shtag);
//
//shtagDia = 4;
//
//
//
//
//// Ванты:
//vantaLen =
//
//sqrt( 932 * 932 +
//        ( b3o - b2o - pyrTopOffsetX - 20 +24+mastDia/2) *
//        ( b3o - b2o - pyrTopOffsetX - 20 +24+mastDia/2) +
//        (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ - 40 ) *
//        (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ - 40 )
//
//);
//
//
//vantaAngY =
//atan( sqrt (
//( b3o - b2o - pyrTopOffsetX + 24+mastDia/2 -20 )*
//( b3o - b2o - pyrTopOffsetX + 24+mastDia/2 -20 ) + 932*932 )
/// (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ - 40 ) );
//
//echo( "vantaAngY :" , vantaAngY);
//
//vantaAngZ =
//atan( (932) / ( b3o - b2o - pyrTopOffsetX + 24 + mastDia/2 -20 ));
//
//echo( "vantaAngZ :" , vantaAngZ);

///////////////////////////////////////////////////////////////////




// 
//// dx, dy, dz завели для того, чтобы начало координат перетаскивать по
//// модели!!!
//
////    dx = b3o;
//    dx = b2o+pyrTopOffsetX;
////    dx = b2o;
//    dy = 0;//-uo; //980;//-uo;
////    dz = -okovaLevel - pyrTopOffsetZ - mastPyrOffsetZ;
//    //- pyrTopOffsetZ; //- 300;
////    - 5300;
//    //dz = pyrTopOffsetZ + mastPyrOffsetZ;
//    mastRotationCenterZ = pyrTopOffsetZ + pyraTopSphereOffset; // + shporSphereDiffOffset;
//    echo ("pyrTopOffsetZ: " ,  pyrTopOffsetZ);
//    echo ("mastRotationCenterZ: " ,  mastRotationCenterZ);
//
//// pyraTopSphereOffset = 61.5;
//// shporSphereDiffOffset = 69.5;
//// mastPyrOffsetZ =  pyraTopSphereOffset + shporSphereDiffOffset;
//
//    echo( "dx :", dx);
//    //echo( "dz :", dz);

// ************//    


//
//
//module Shtag() {
//
// //mastDia = 69;
// //thicns = 2;
// //bigR = 20;
//
// ang2shtag  = 90-73.05;
// shtagDia = 4;
// shtagLen = 6656;
//
// //okovaLevel = 4099.5+100; // !!!
//
//
//
//     //Штаг:
//     //translate([ mastDia/2 + bigR + 2*thicns , 0 , okovaLevel + bigR ])
//     translate([-b2o, 0, 0])
//     rotate([ 0 , -ang2shtag , 0 ])
//     translate([0, 0, 50])
//     cylinder( h = shtagLen , d = shtagDia );
//
//
//}
