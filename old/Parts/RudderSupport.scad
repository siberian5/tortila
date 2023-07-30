//RudderSupport(50,0,-30);
RudderSupport();


    thicns = 2.5;
    tubeDia = 48.5;
    cornerRad = 8;
    height1=21.75;
    wid1 = 46;  // platform side A
    platfSideB = tubeDia - 2*thicns;
    width1=30;
    rudderBoltRad = 4;
    rudderEarRad = 15;
    holeRad = 2.5;

module RudderSupport() {
    
    $fn=50;
    
    pz = 0;// - height1;
    px = 0; //+ tubeDia;
    py = 0; 
    
    translate([px-platfSideB/2-3*thicns/2,py,pz])    Side();
    translate([px+platfSideB/2+3*thicns/2,py,pz])     Side();
    
    //платформа
    translate([px, py, pz-3*thicns/2 - height1  ]) 
    cube([platfSideB, wid1, thicns],center=true);
    
    //изгибы охватов
    translate([-platfSideB/2,0,-height1])    Izgib();
    translate([platfSideB/2,0,-height1]) rotate([0,0,180])   Izgib();

    // ухо руля
    translate([ px-rudderEarRad -platfSideB/2 -3*thicns 
              , py
              , pz + cornerRad + 3*thicns/2
              ]) RudderEar();

    translate([ px-platfSideB/2-3*thicns
              , py
              , pz +cornerRad
              ]) Izgib1();

}

module Side() {
    $fn=20;
    
    difference() {
        hull() {    
            translate([0,0, -height1/2]) 
            cube([thicns, (width1+2*cornerRad), height1],center=true);

            translate([0,-width1/2 , 0]) 
            rotate([0,90,0]) 
            cylinder(h=thicns, r=cornerRad,center=true);

            translate([0, width1/2, ]) 
            rotate([0,90,0]) 
            cylinder(h=thicns, r=cornerRad,center=true);
        }
        translate([0, -width1/2, 0]) 
        rotate([0,90,0]) 
        cylinder(h=thicns*3, r=holeRad,center=true);

        translate([0, width1/2, 0]) 
        rotate([0,90,0]) 
        cylinder(h=thicns*3, r=holeRad,center=true);
    }
}


module Izgib() {
    difference(){    
        rotate([-90,0,0]) 
        cylinder(h=wid1,r=thicns*2,center=true);

        rotate([-90,0,0]) 
        cylinder(h=wid1+2,r=thicns,center=true);

        translate([thicns*3/2,0,thicns/2]) 
        cube([thicns*3, wid1+2, thicns*3],center=true);

        translate([thicns/2,0,3*thicns/2]) 
        cube([thicns*3, wid1+2, thicns*3],center=true);
    }    
}    

module Izgib1() {
    difference() { 
            rotate([-90,0,0]) 
            cylinder(h=width1, r=thicns*2,center=true);

            rotate([-90,0,0]) 
            cylinder(h=width1+2, r=thicns,center=true);

            translate([-thicns/2,0,-3*thicns/2]) 
            cube([thicns*3, width1+2  , thicns*3],center=true);

            translate([-3*thicns/2,0,-thicns/2]) 
            cube([thicns*3, width1+2  , thicns*3],center=true);
    }
}

module RudderEar() {
    difference() {
        hull() {
            cylinder(h=thicns, r=rudderEarRad,center=true);

            translate([rudderEarRad/2,0,0])
            cube([rudderEarRad, rudderEarRad*2  , thicns],center=true);
        }
        cylinder(h=thicns*3, r=rudderBoltRad,center=true);
    }
}



