use <../BargeMinShwert.scad>;
use <PyraRL.scad>;
use <../Parts/PyraTop.scad>;
use <Boom.scad>;
use <../Parts/Grot.scad>;
use <../Parts/Staksel.scad>;
use <../Parts/Upor.scad>;
use <../Parts/Shpor.scad>;
use <../Parts/BoomSteps.scad>;
use <../Parts/VOkova.scad>;




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


okovaLevel = 4099.5+100;


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
    dz = 0;

// ************//    







// Cat:
//rotate([ 0 , 17.8 , 0 ]) 
translate([ dx , dy , dz ]) 
Construction();

//Rangout();
//Mast();



module Rangout() {
// В начале координат степс гика.

    Mast();

    translate([-58 , 0 , ( 45.5 - 14 )  ])
    rotate([ 0 , 0 , -15 ])
    Boom();



    // Ванты. 

    translate([ mastDia/2 + bigR + 2*thicns , 0 , okovaLevel + bigR ])
    rotate([ 0 , 0 , vantaAngZ ])
    rotate([ 0 , 180 + vantaAngY , 0 ])
    Vanta();

    translate([ mastDia/2 + bigR + 2*thicns , 0 , okovaLevel + bigR ])
    rotate([ 0 , 0 , -vantaAngZ ])
    rotate([ 0 , 180 + vantaAngY , 0 ])
    Vanta();


    //Штаг:
    translate([ mastDia/2 + bigR + 2*thicns , 0 , okovaLevel + bigR ])
    rotate([ 0 , 180-ang2shtag , 0 ])
    cylinder( h = shtagLen , d = shtagDia );



    // упор штага
    translate([ pyrTopOffsetX, 0 , -pyrTopOffsetZ -mastPyrOffsetZ ])   
    rotate([ 0 , -ang2shtag , 0 ]) 
    Upor();


    //Поставим грот:
    translate([-42 , 0 , 60 ]) 
    rotate([ 0 , 0 , -15 ])
    Grot();

    // Поставим стаксель:
/*    translate([ mastDia/2 + bigR + 2*thicns , 0 , okovaLevel + bigR ]) 
    rotate([ 0 , -ang2shtag , 0 ])
    translate([ 0 , 0 , -100 ])
    rotate([ 0 , 0 , -15 ])
    Staksel();
*/
}



module Construction() { 
// В начале координат середина первой балки.


    translate([ -b2o -pyrTopOffsetX , 0 , pyrTopOffsetZ + mastPyrOffsetZ   ])
    Rangout();  

    // Катамаран по-быстрому: Раскомментить!
    BargeMin();


    //Всякое:


    // Упоры 3ьей балки
    translate([-b3o,-932,0]) rotate([0, 90 - ang3xz,0]) Upor();
    translate([-b3o, 932,0]) rotate([0, 90 - ang3xz,0]) Upor();


    //Задние ноги пирамиды:

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

    translate([ -b2o -pyrTopOffsetX , 0 , pyrTopOffsetZ ]) 
    PyraTop();

}



module Mast(){

    Shpor();

    translate([ 0 , 0 , stepsH/2 ]) 
    Steps();

    //Вырежем дырки для шкивов
    difference(){
    
        cylinder( d = mastDia, h = mastLength );

        tempA = 50;
        translate([ tempA/2 , 0 , blokHoleH/2 + stakH ]) 
        cube([ tempA , blokHoleW , blokHoleH ] , center=true );

        translate([ tempA/2 , 0 , blokHoleH/2 + genH ]) 
        cube([ tempA , blokHoleW , blokHoleH ] , center=true );

    }

    //Вставим шкивы
    translate([ mastDia/2 - shkiv2dia/2 + 6 , 0 , stakH + shkiv2dia/2 ]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = shkiv2dia, h = shkiv2wid, center=true);

    translate([ mastDia/2 - shkiv2dia/2 + 6 , 0 , genH + shkiv2dia/2 ]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = shkiv2dia, h = shkiv2wid, center=true);

    //топовый:
    translate([ - mastDia/2  , 0 , mastLength - shkiv2dia/2 ]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = shkiv2dia, h = shkiv2wid, center=true);

    translate([ - mastDia/2 , 0 , mastLength - shkiv2dia/4 ])
    cube([ shkiv2dia , shkiv2wid , shkiv2dia/2 ] , center = true );

    //Заглушка:
    translate([ 0 , 0 , mastLength ]) 
    cylinder( d = mastDia, h = stubWidth );

    //Оковка вант:
    translate([ 0 , 0 , okovaLevel ])     VOkova();
   
}



module Vanta() {
    cylinder( h=vantaLen , d = shtagDia );
}



module VOkova() {
    
    difference() {
        intersection() {
    
            difference() {
                cylinder( h = okH , d = mastDia + 2*thicns );

                translate([ 0 , 0 , -1/2 ]) 
                cylinder( h = okH + 1 , d = mastDia );
    
                translate([ - mastDia/2 - 15 , 0 , okH/2 + 1 ])
                cube([ mastDia , mastDia + 2 , okH + 2 ] , center=true );
            }

            translate([ mastDia/2 + 1 , 0 , 0 ])
            rotate([ 0 , 60 , 0 ])
            translate([ -mastDia , 0 , okH1/2 ]) 
            cube([ mastDia * 2 , mastDia + 2 , okH1 ] , center=true );

        }

        translate([ mastDia/2 + 1 , 0 , okH1 ]) 
        rotate([ 0 , 30 , 0 ])
        translate([ -mastDia/2 , 0 , okH1/2 ])
        cube([ mastDia * 2 , mastDia + 2 , okH1 ] , center=true );
    }

    difference() {
    hull() {
        translate([ mastDia/2 + frontLen - bigR , 0 , bigR ]) 
        rotate([ 90 , 0 , 0 ]) 
        cylinder( h = thicns * 2 , r = bigR , center=true );

        translate([ mastDia/2 + thicns/2 , 0 , okH1/2 ])
        cube([ thicns , thicns , okH1 ] , center=true );
    }

    hull() {

        translate([ mastDia/2 + frontLen - bigR , 0 , bigR ]) 
        rotate([ 90 , 0 , 0 ]) 
        cylinder( h = thicns * 2 + 2 , r = holeR , center=true );

        translate([ mastDia/2 + frontLen - bigR - 8 , 0 , bigR + 8 ]) 
        rotate([ 90 , 0 , 0 ]) 
        cylinder( h = thicns * 2 + 2 , r = holeR , center=true );
    }}
}

