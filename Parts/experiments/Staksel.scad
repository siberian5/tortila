
r1 = 1;
wid = 1;


//rotate([0,-9,0])
translate([ 0 , 0 , 4990/2 ]) 
Staksel();

module Staksel (){

    rotate([ 0 , -90 , 0 ])
    hull()  { 

        translate([ - 1 , 0 , 1 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );

        translate([  - 4989 , 0 , 1 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );

        translate([ - 4001.5 , 0 , 1432 ]) 
        rotate([ 90 , 0 , 0 ])
        cylinder( r = r1 , h = wid , center = true );

    }

    translate([ -477 , 0 , -2997 ])
    sphere(d = 30);
    

    translate([ -1432 , 0 , -4001.5 ])
    rotate([ 0 , -46.5 , 0 ])
    translate([ -700 , 0 , 0 ])
    cylinder( r = 700 , h = 1 , center=true );


    
    translate([ -1432 , 0 , -4001.5 ])
    rotate([ 0 , -46.5 , 0 ])
    translate([ -700 , 0 , 0 ])
    cube([ 1400 , 10 , 50 ] , center=true );


}
