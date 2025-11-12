use <el_Shpor.scad>;
use <el_BoomSteps.scad>;
use <el_VOkova.scad>;
use <el_craspTria.scad>;
use <el_Rig.scad>;

// Мачта

// Длины колен: 

mast1len = 2000;
mast2len = 2500;
mast3len = 1800;

mastLength = mast1len + mast2len + mast3len;

// Диаметр мачты, основной
mastDia = 69;



stepsH = 45.5;
// blokHoleH = 44;
// blokHoleW = 16.5;
shkiv2dia = 30;
shkiv2wid = 10;


vOkovaH = 744;

genShkivHoleWid = 12;
genShkivHoleHei = 40;
genShkivHoleDrop = 685;

topShkivDrop = 15;
sndShkivDrop = 150;

//craspTriaOffsetZ = mast1len +  660;

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


// translate([ 0 , 0 , -mast1len - mast2len ]) 

translate([ 0 , 0 , -mastLength])
Mast();

module Mast(){

    Shpor();
    Steps();

    //Сама мачта, здесь же можем вырезать дырки под шкивы
    difference(){
    
            
        skos = 50; // Удлинение профиля в корму

        hull(){
            cylinder( d = mastDia, h = mastLength );
            // mastDia/20 — волшебное значение, достаточно маленькое, чтобы отрисовать профиль
            translate([ -skos , 0 , 0 ]) cylinder( d = mastDia/20, h = mastLength );
        }
        // Вырезаю ликпаз            
        translate([ -skos , 0 , 0 ]) cylinder( d = mastDia/15, h = mastLength );

        // Текущая "генакерная дырка"
        translate([30, 0, mastLength-genShkivHoleDrop])  hull() {
            translate([0, 0, -genShkivHoleHei/2])   cube([ 20 , genShkivHoleWid , genShkivHoleHei] , center = true );
            translate([-10, 0, 0]) rotate([0, 90, 0]) cylinder( d = genShkivHoleWid, h = 20 );
        }
        
        // дырка топовая перспективная  
        translate([30, 0, mastLength-topShkivDrop])  hull() {
            translate([0, 0, -genShkivHoleHei/2])   cube([ 20 , genShkivHoleWid , genShkivHoleHei] , center = true );
            translate([-10, 0, 0]) rotate([0, 90, 0]) cylinder( d = genShkivHoleWid, h = 20 );
        }
        
        // дырка вторая перспективная  
        translate([30, 0, mastLength-sndShkivDrop])  hull() {
            translate([0, 0, -genShkivHoleHei/2])   cube([ 20 , genShkivHoleWid , genShkivHoleHei] , center = true );
            translate([-10, 0, 0]) rotate([0, 90, 0]) cylinder( d = genShkivHoleWid, h = 20 );
        }

    }   
        
    // Текущий генакерный шкив
    translate([2+ mastDia/2-shkiv2dia/2, 0, mastLength-genShkivHoleDrop-shkiv2dia/2 -7])
    rotate([90,0, 0]) cylinder( d = shkiv2dia, h = shkiv2wid , center=true);

    // топовый перспективный шкив
    translate([2+ mastDia/2-shkiv2dia/2, 0, mastLength-topShkivDrop-shkiv2dia/2 -7])
    rotate([90,0, 0]) cylinder( d = shkiv2dia, h = shkiv2wid , center=true);

    // второй перспективный шкив
    translate([2+ mastDia/2-shkiv2dia/2, 0, mastLength-sndShkivDrop-shkiv2dia/2 -7])
    rotate([90,0, 0]) cylinder( d = shkiv2dia, h = shkiv2wid , center=true);







    //топовый гротовый шкив:
    translate([ -44, 0 , mastLength - shkiv2dia/2 ]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = shkiv2dia, h = shkiv2wid, center=true);






    translate([ -44, 0 , mastLength - shkiv2dia/4 ])
    cube([ shkiv2dia , shkiv2wid , shkiv2dia/2 ] , center = true );


    //Оковка вант, текущая:
    translate([ 0 , 0 , mast1len + mast2len + vOkovaH ]) 
    VOkova();

    translate([ 62 , 0 , mast1len + mast2len + vOkovaH -8 ])  
    rotate([0, -95, 0])
    Rig();
   
    RomboVantOkovaLow();
    RomboVantOkovaHigh();



    craspTriaOffsetZ = mast1len + 660;
    craspTubeDia = 22;
    craspTriaH = craspTriaOffsetZ + craspTubeDia/2;

    translate([0, 0, craspTriaH])
    CraspTria();

    trosThikn = 3;
    
    // Front up
    translate([ 302, 0 , craspTriaH ]) 
    rotate([ 0 , -6.4 , 0 ]) 
    cylinder( d = trosThikn, h = 2300);
    
    // Front down
    translate([ 302, 0 , craspTriaH ]) 
    rotate([ 0 , -172.75, 0 ]) 
    cylinder( d = trosThikn, h = 2010);
    
    // Right up
    translate([ -174.6, -303.5, craspTriaH ]) 
    rotate([ 0 , 7.79 , 58]) 
    cylinder( d = trosThikn, h = 2335);
    
    // Right down
    translate([ -174.6, -303.5, craspTriaH ]) 
    rotate([ 0 , 180 - 8.8 , 58]) 
    cylinder( d = trosThikn, h = 2060);
    
    // Left up
    translate([ -174.6, 303.5, craspTriaH ]) 
    rotate([ 0 , 7.79 , -58]) 
    cylinder( d = trosThikn, h = 2335);
    
    // Left down
    translate([ -174.6, 303.5, craspTriaH ]) 
    rotate([ 0 , 180 - 8.8 , -58]) 
    cylinder( d = trosThikn, h = 2060);
}



module RomboVantOkovaLow(){

    // нижнее крепление ромбо-вант
    downRomboOffset = 610;
    sideRomboOffestX = 7;
    sideRomboOffestZ = 27;

    translate([ 0, 0 , downRomboOffset ]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = 6, h = 80, center=true); // Внешние дырки
    
    translate([ -sideRomboOffestX, 0 , downRomboOffset + sideRomboOffestZ ]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = 6, h = 80, center=true); // Дырки "выше"
    
    centerRomboOffestZ = 60;
    centerRomboOffestXOut = 13;

    cronDiaExt = 16;
    cronDiaInn = 6.5;
    cronThikn = 3;


    translate([ mastDia/2 + centerRomboOffestXOut, 0, downRomboOffset + centerRomboOffestZ ]) 
    rotate([ 90 , 0 , 0 ]) 
    difference(){
        cylinder( d = cronDiaExt, h = cronThikn, center=true); 
        cylinder( d = cronDiaInn, h = cronThikn+1, center=true); 
    }


    translate([ mastDia/2 + centerRomboOffestXOut, 0, downRomboOffset + centerRomboOffestZ ]) 
    rotate([ 90 , 0 , 0 ]) 
    difference(){
        rotate([ 0 , 0 , -40 ]) 
        translate([ 0, -cronDiaExt, 0]) 
        cube([cronDiaExt, cronDiaExt*2, cronThikn], center = true);
        cylinder( d = cronDiaInn, h = cronThikn+1, center=true); 
    }


}

module RomboVantOkovaHigh(){

    // нижнее крепление ромбо-вант
    upRomboOffset = 2000 + 2500 + 1800 -1290 ;
    sideRomboOffestX = 7;
    sideRomboOffestZ = 27;

    translate([ 0, 0 , upRomboOffset ]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = 6, h = 80, center=true); // Внешние дырки
    
    translate([ -sideRomboOffestX, 0 , upRomboOffset - sideRomboOffestZ ]) 
    rotate([ 90 , 0 , 0 ]) 
    cylinder( d = 6, h = 80, center=true); // Дырки "выше"
    
    centerRomboOffestZ = 60;
    centerRomboOffestXOut = 13;

    cronDiaExt = 16;
    cronDiaInn = 6.5;
    cronThikn = 3;


    translate([ mastDia/2 + centerRomboOffestXOut, 0, upRomboOffset - centerRomboOffestZ ]) 
    rotate([ 90 , 0 , 0 ]) 
    difference(){
        cylinder( d = cronDiaExt, h = cronThikn, center=true); 
        cylinder( d = cronDiaInn, h = cronThikn+1, center=true); 
    }


    translate([ mastDia/2 + centerRomboOffestXOut, 0, upRomboOffset - centerRomboOffestZ ]) 
    rotate([ 90 , 0 , 0 ]) 
    difference(){
        rotate([ 0 , 0 , -140 ]) 
        translate([ 0, -cronDiaExt, 0]) 
        cube([cronDiaExt, cronDiaExt*2, cronThikn], center = true);
        cylinder( d = cronDiaInn, h = cronThikn+1, center=true); 
    }


}
