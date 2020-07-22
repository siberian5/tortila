//use <Upor.scad>;


diamVnesh=48.5;
lenTotal=2650;    // вместе с удлинителями


module BalkaMin() {

    //$fn=100;
    
    rotate([-90,0,0]) 
    cylinder(h=lenTotal, r=diamVnesh/2, center=true);

}

BalkaMin();
