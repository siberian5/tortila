use <./4_PyramidedOrig.scad>;
use <./Composite/RangoutOrig.scad>;



// consts:

b2o = 435;
b3o = 435 + 2200;
b4o = 435 + 2200 + 1635;

uo = 932; // разнос упоров ног пирамиды в стороны
uporWid = 50; 
thicns = 2;
tubeDia = 48.5;
shplintHoleDia = 8.5;
shplintHoleHeig = 21; 
sphereRad = 13; 

holeOffset = tubeDia/2+thicns+shplintHoleHeig;  // 47.25 
// = расстояние от центра балки 
//              до центра дырки шплинта в упоре

// Углы ног пирамиды
ang2xy = 25.4141;
ang3xy = 39.9445;

ang2xz = 30.59;    
ang3xz = 65.87; 

//смещение верхушки пирамиды относительно середины второй (!!!) балки. 
pyrTopOffsetX = 1739.4;
pyrTopOffsetZ = 1028.3;

mastPyrOffsetZ = 70 + 61.5;





////////////////////////// До сей поры не трогаем!!!!! ///////////////////

// Maчта:
mastLength = 5800;
mastDia = 69;
stepsH = 45.5;

blokHoleH = 44;
blokHoleW = 16.5;
shkiv2dia = 30;
shkiv2wid = 10;

stubWidth = 3;
okovaRise = 20;//39;


// Окова вант:
okH = 81;
okH1 = 66;
bigR = 20;
holeR = 6;
frontLen = 44;


okovaLevel = 4099.5;


stakH = okovaLevel - okovaRise - blokHoleH;
genH = okovaLevel -100 + 560.5;




// Штаг:
ang2shtag 
= atan( (pyrTopOffsetX - 24 - mastDia/2) / (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ) );

shtagLen = 
sqrt(
    (pyrTopOffsetX - 24 - mastDia/2)*(pyrTopOffsetX - 24 - mastDia/2) +
    (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ)*(bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ)
) - holeOffset;

echo( "shtagLen: " , shtagLen);
echo( "ang2shtag: " , ang2shtag);

shtagDia = 4;




// Ванты:
vantaLen =

sqrt( 932 * 932 +
        ( b3o - b2o - pyrTopOffsetX - 20 +24+mastDia/2) *
        ( b3o - b2o - pyrTopOffsetX - 20 +24+mastDia/2) +
        (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ - 40 ) *
        (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ - 40 )

);


vantaAngY =
atan( sqrt (
( b3o - b2o - pyrTopOffsetX + 24+mastDia/2 -20 )*
( b3o - b2o - pyrTopOffsetX + 24+mastDia/2 -20 ) + 932*932 )
/ (bigR + okovaLevel + mastPyrOffsetZ + pyrTopOffsetZ - 40 ) );

echo( "vantaAngY :" , vantaAngY);

vantaAngZ =
atan( (932) / ( b3o - b2o - pyrTopOffsetX + 24 + mastDia/2 -20 ));

echo( "vantaAngZ :" , vantaAngZ);

///////////////////////////////////////////////////////////////////





// dx, dy, dz завели для того, чтобы начало координат перетаскивать по
// модели!!!

//    dx = b3o;
    dx = b2o+pyrTopOffsetX;
//    dx = b2o;
    dy = 0;//-uo; //980;//-uo;
//    dz = -okovaLevel - pyrTopOffsetZ - mastPyrOffsetZ;
    //- pyrTopOffsetZ; //- 300;
//    - 5300;
    dz = pyrTopOffsetZ + mastPyrOffsetZ;

// ************//    














Masted();

module Masted() {

    Pyramided();
   
    translate([-dx,0,dz]) Rangout();

}
