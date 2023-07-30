
r1 = 1;
wid = 1;


Grot();

module Grot(){

    hull() {
    
        //A0
        translate([ -1 , 0 , 1 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );

        //B0
        translate([ - 2079 , 0 , 1 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );
    

        //B1
        translate([ - 2057 , 0 , 656 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );


        //B2
        translate([ - 1886 , 0 , 1976 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );


        //B3
        translate([ - 1590 , 0 , 3350 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );


        //B4
        translate([ - 1179 , 0 , 4564 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );


        //B6
        translate([ - 666 , 0 , 5393 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );

        //B0
        translate([ - 1 , 0 , 5569 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );


    }    


    //CP
    translate([ - 859  , 0  , 2357  ])
    sphere(d = 30);

}
