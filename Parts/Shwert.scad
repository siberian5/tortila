
midOffset = 200;
lowOffset = 330;


//translate([0,0,-46]) 
Shwert();

module Shwert() {

    translate([0,0,-46]) rotate([0,0,180]) ShwertInner();

}

module ShwertInner() {

    rotate([90,0,0]) cylinder(d=23,h=520,center=true);
    
    translate([-midOffset,0,0]) 
    intersection() {
        sphere(d=38);
        cylinder(d=38,h=26,center=true);
    }


    translate([-midOffset,0,0]) rotate([90,0,39]) cylinder(d=23,h=320);
    translate([-midOffset,0,0]) rotate([-90,0,-39]) cylinder(d=23,h=320);

    rotate([0,1,0]) translate([-180,0,-200 - 23/2-7]) cube([360,20,400],center=true);

    translate([-midOffset,0,-lowOffset])    
    rotate([-3,0,0])
    rotate([0,42,49]) 
    cylinder(d=23,h=470);


    translate([-midOffset,0,-lowOffset])    
    rotate([3,0,0])
    rotate([0,42,-49]) 
    cylinder(d=23,h=470);

    
    translate([-midOffset,0,-lowOffset])    
    sphere(d=55);

    translate([-midOffset,0,-lowOffset])   
    rotate([0,-2,0])
    translate([0,0,-550]) cube([305,10,1100],center=true);
    


}
