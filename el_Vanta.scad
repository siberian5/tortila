
Vanta(150);


//vantaLen = 150;
vantaDia = 3;

module Vanta(vantaLen) {

    rotate([0, 180, 0])
    translate([-vantaLen, 0, 0])
    {


      difference() {
  
        hull(){
          translate([0,vantaDia/2,0])
          rotate([90, 0, 0])
          cylinder(h=vantaDia, r=7.5);
      
          translate([15,vantaDia/2,0])
          rotate([90, 0, 0])
          cylinder(h=vantaDia, r=7.5);
        }
  
        translate([0,vantaDia/2+1,0])
        rotate([90, 0, 0])
        cylinder(h=vantaDia+2, r=3.5);
        
        translate([2,vantaDia/2+1,0])
        rotate([90, 0, 0])
        cylinder(h=vantaDia+2, r=3.5);
        
        translate([4,vantaDia/2+1,0])
        rotate([90, 0, 0])
        cylinder(h=vantaDia+2, r=3.5);
      }
  
  
      rotate([0, 90, 0])
      cylinder(h=vantaLen, r=vantaDia/2);


    }
}
