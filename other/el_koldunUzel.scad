

thikns = 1;
externalDia = 12;
holeDia = 5.5;
slotThkns = 0.5;
slot2Thkns = 1.5;

widnss = 15;

leftRow = 8;

Uzel();

module Uzel() {
      
  difference(){
    hull(){
      cylinder(h=thikns, d = externalDia, center=true);

      translate([leftRow, 0, 0])
      cube([ 1 , widnss , thikns ] , center=true );
    }

    cylinder(h=thikns+2, d = holeDia, center=true);

    translate([0, widnss/2, 0])
    cube([ slotThkns , widnss , thikns+2 ] , center=true );

    translate([leftRow-slot2Thkns, , 0])
    cube([ slot2Thkns , widnss-4 , thikns+2 ] , center=true );
  }

  // cylinder(h=thikns, d = externalDia, center=true);
   
  //}
}



