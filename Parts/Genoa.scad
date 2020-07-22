
perShkat = 5230;
betta = 70.21;
nizhShkat = 3450;
mediGamma = 24;

aX = nizhShkat*sin(betta);
aZ = nizhShkat*cos(betta);
// echo( "aX = ", aX); // 3246
 echo( "aZ = ", aZ); //1168 
// Пузо 4%

cpX = aX/3;
cpZ = aZ/3 + perShkat/3;

//d1 = 500;

// echo("area = ", perShkat*aX/2 * (1/1000000)); // 8.5 кв м

// высота паруса
//echo (" h = " , perShkat * sin(betta)); // 4921


Genoa();

/* Упрощение!!! */


module Genoa() {
    
    rotate([ 0 , betta - 90 , 0 ])
    rotate([ 0 , 0 , -15 ])
    translate([ 0 , 0 , -perShkat-250  ])
    {

    translate([ 0 , 0 , -600 ])
    cylinder( h = perShkat + 1000 , d = 4 );

    hull() {

        //C 
        translate([ -1 , 0 , perShkat - 1 ])
        rotate([ 90 , 0 , 0 ])
        cylinder( h = 1, r = 1 , center=true );

        //B
        translate([ -1 , 0 , 1 ])
        rotate([ 90 , 0 , 0 ])
        cylinder( h = 1, r = 1 , center=true );

        //A
        translate([ 1 - aX , 0 , aZ ])
        rotate([ 90 , 0 , 0 ])
        cylinder( h = 1, r = 1 , center=true );

    }


    translate([ 1 - aX , 0 , aZ ])
    rotate([ 0 , -mediGamma , 0 ])
    translate([ -1000 , 0 , 0 ])
    cylinder( h = 1, r = 1000 , center=true );

    translate([ -cpX , 0 , cpZ ])
    sphere( r = 50 );
    }
}
