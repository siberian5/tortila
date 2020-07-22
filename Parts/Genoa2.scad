/*
perShkat = 5230;
cappa = 38.63; // топовый угол 
betta = 70.21; //Галсовый угол при полной парусности
pShkAngle = 20; // Угол под лик-тросом генуи.
spustPoTrosu = 0;
*/


// Штиляка:
//   9 квадратов так:

 perShkat = 6000;
 cappa = 35;
 betta = 60;
 pShkAngle = 23;
 spustPoTrosu = 150;


//55;//60; //Площадь обрезанного до 55 градусов: 7 квадратов. и
// 7.5, если обрезать до 60ти. 

nizhShkat = perShkat * sin(cappa) / sin(180 - betta - cappa) ;  //3450;
medianaLen = sqrt( pow(perShkat/2,2)+pow(nizhShkat,2)-perShkat*nizhShkat*cos(betta) );
mediGamma = 90 - asin( sin(betta)*nizhShkat/medianaLen ); // 24; // Угол при  медиане полного паруса.

aX = nizhShkat*sin(betta);
aZ = nizhShkat*cos(betta);
// echo( "aX = ", aX); // 3246
// echo( "aZ = ", aZ); //1168 
 // Пузо 4%

 cpX = aX/3;
 cpZ = aZ/3 + perShkat/3;

 //d1 = 500;

  echo("area = ", perShkat*aX/2 * (1/1000000)); // 8.5 кв м

 // высота паруса
 //echo (" h = " , perShkat * sin(betta)); // 4921







ht = perShkat;


Genoa();

module Genoa() {
$fn=50;

    rotate([ 0 , 0 , 180 ])
//    rotate([ 0 , 90 -betta , 0 ])

//    rotate([ 0 , 32 , 0 ]) // Вместо предыдущего, при установке на    бушприте!!!
    rotate([ 0 , pShkAngle , 0 ]) // Вместо предыдущего, при установке на    бушприте!!!

    rotate([ 0 , 0 , -20 ])
    translate([ 0 , 0 , -perShkat-250-spustPoTrosu ])
    {

    translate([ 0 , 0 , -600 ])
    cylinder( h = perShkat + 1000 , d = 4 );


    translate([ 0 , 0 , ht/2 ])
    difference() {
        hull() {

            translate([ 424 , 0 , -ht/8 ]) 
            resize([ 536 , 536 , ht/2 ]) 
            sphere();

            cylinder(r = 1, h = ht , center = true);

            translate([ aX , 0 , 0 ])
            cylinder(r = 1, h = ht , center = true);

        }

        hull() {

            translate([ 424 , 0 , -ht/8 ]) 
            resize([ 534 , 534 , ht/2 ]) 
            sphere();

            cylinder(r = 1/2 , h = ht , center = true);

            translate([ aX , 0 , 0 ])
            cylinder(r = 1/2 , h = ht , center = true);

        }

        translate([ 0 , 0 , -ht/2 -1])
        cube([ ht , ht , ht+2 ]);

        translate([ 0 , 0 , -ht/2 ])
        rotate([ 0 , betta-90 , 0 ])
        translate([ 0 , 0 , -ht/2 ])
        cube([ 2*ht , ht , ht ], center=true);

        translate([ 0 , 0 , ht/2 ])
        rotate([ 0 , 90-cappa , 0 ])
        translate([ 0 , 0 , ht/2 ])
        cube([ 2*ht , ht , ht ], center=true);

    }

    translate([ aX-1 , 0 , aZ ])
    rotate([ 0 , mediGamma , 0 ])
    translate([ 1000 , 0 , 0 ])
    cylinder( h = 1, r = 1000 , center=true );

// Цилиндр центра парусности
    translate([ cpX , -200 , cpZ ])
    rotate([90,0,0])
    cylinder(r=20, h = 100,  center=true);


    }
}





