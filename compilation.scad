use <c4_Grid.scad>;
use <c_PyraFL.scad>;
use <c_PyraRL.scad>;
use <c_Mast.scad>;
use <el_PyraTop.scad>;
use <el_Uhi.scad>;
use <el_Ballon50.scad>;
use <el_Vanta.scad>;
use <el_Grot_now.scad>;
use <c_Boom.scad>;
use <el_Staksel_now.scad>;
use <el_Staksel_perspective.scad>;


// consts:
b2o = 435;
b3o = 435 + 2200;
b4o = 435 + 2200 + 1635;
stzoffset = 45.5;

translate([1028.3 + b2o, 0, -6000]) {
  Grid();
  Pyramid();
  MastInstallation();
  Ballons();
  Vantas();
  Shtag();
  GrotInstallationNow();
  BoomInstallationNow();
  StakselInstallationNow();
  //StakselInstallationPerspective();
}

module StakselInstallationPerspective() {

  // Текущий стаксель будет работать, если его поднять на полметра по штагу от центра балки.

  shtagOffset = 660;

  translate([-b2o, 0, 0])
  rotate([0, -16.24, 0])
  rotate([0, 0, 15])
  translate([0, 0, shtagOffset])
  //Staksel_perspective(2.5, 6, 0.29);
  Staksel_perspective(3.5, 6, 0.2);
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

module Shtag() {
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

   ang = 2;
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
