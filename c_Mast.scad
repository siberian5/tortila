use <el_Shpor.scad>;
use <el_BoomSteps.scad>;
use <el_VOkova.scad>;

mastLength = 2000 + 2500 + 1800;
stakH = 2000+2500+660;  // Высота нижней линии выреза дырки под блок

genH = 2000+2500+1100;

okovaRise = 40; // нижняя граница оковки выше на 40мм, чем верхняя граница дырки блока.


mastDia = 69;
stepsH = 45.5;
blokHoleH = 44;
blokHoleW = 16.5;
shkiv2dia = 30;
shkiv2wid = 10;

stubWidth = 3;


//// Ванты:
//vantaDia = 4;
//vantaLen = 5280;
//
//vantaAngY = 11.48;
//vantaAngZ = 61.6; 
//
//// Штаг:
//ang2shtag = 17.65;
//shtagLen = 5461;
//shtagDia = 4;
//
//b2o = 435;


//translate([ 0 , 0 , - stakH - okovaRise - blokHoleH ]) 
Mast();

module Mast(){

    Shpor();

    translate([ 0 , 0 , stepsH/2 ]) 
    Steps();

    //Вырежем дырки для шкивов
    difference(){
    
        tempA = 50;
        cylinder( d = mastDia, h = mastLength );

        translate([ tempA/2 , 0 , blokHoleH/2 + stakH ]) 
        cube([ tempA , blokHoleW , blokHoleH ] , center=true );

        translate([ tempA/2 , 0 , blokHoleH/2 + genH ]) 
        cube([ tempA , blokHoleW , blokHoleH ] , center=true );

    }

    //Вставим шкивы
    translate([ mastDia/2 - shkiv2dia/2 + 6 , 0 , stakH + blokHoleH/2]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = shkiv2dia, h = shkiv2wid, center=true);

    translate([ mastDia/2 - shkiv2dia/2 + 6 , 0 , genH + blokHoleH/2 ]) 
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
    translate([ 0 , 0 , stakH + blokHoleH + okovaRise ]) 
    VOkova();
    
//    translate([ mastDia/2 + 26 , 0 , stakH + blokHoleH + okovaRise ])
//    rotate([ 0 , 0 , vantaAngZ ])
//    rotate([ 0 , 180 + vantaAngY , 0 ])
//    Vanta();
//
//    translate([ mastDia/2 + 26 , 0 , stakH + blokHoleH + okovaRise ])
//    rotate([ 0 , 0 , -vantaAngZ ])
//    rotate([ 0 , 180 + vantaAngY , 0 ])
//    Vanta();
//    //Штаг:
//    translate([ -b2o, 0 , 0 ])
//    rotate([ 0 , -ang2shtag , 0 ])
//    translate([ 0 , 0 , 60 ])
//    cylinder( h = shtagLen , d = shtagDia );

}

module Vanta() {
    cylinder( h=vantaLen , d = vantaDia );
}
