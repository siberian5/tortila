platformThikns = 10;
platformDia = 110;

diamVneshNogi = 48.5;

cubeX = 70;
cubeY = 40;
cubeZ = 20;


// translate([0, -26, 0])
// rotate([0, 0, 111])
// GarminKrepa();

// translate([0, 0, -platformThikns])
// rotate([0, 180, 0])
GarminPlatform();




module GarminKrepa() {

 hei = 10;

  translate([0, 0, hei]) {
 
   translate([0, 0, -hei/2])
   hull() {

     cylinder(h=hei, d = 11*2,center=true);
 
     translate([48, 0, 0])
     cube([30, 96, hei], center=true ) ;
   }
   
   translate([0, 0, -12])
   cylinder(h=28, d = 6, center=true);
   translate([0, 0, +3-26])
   cylinder(h=6, d = 12, center=true);
   
   /*
   translate([48, 20, -12])
   cylinder(h=28, d = 6, center=true);
   translate([48, 20, +3-26])
   cylinder(h=6, d = 12, center=true);
   */
   
   translate([48, -20, -12])
   cylinder(h=28, d = 6, center=true);
   translate([48, -20, +3-26])
   cylinder(h=6, d = 12, center=true);

   }
}



module GarminPlatform() {


  difference(){
    translate([0, 0, cubeZ/2])
    cube([ cubeX , cubeY-2 , cubeZ ] , center=true );

    translate([0, 0, diamVneshNogi/2])
    rotate([0, 90, 0])
    cylinder(h=platformDia,d=diamVneshNogi,center=true);    
  }
    

        
  translate([0, 0, -platformThikns/2]) {

    homutHoleX = 12;
    homutHoleY = 1.5;
    homutHoleZ = 12;

    difference() {
      cylinder(h=platformThikns,d=platformDia,center=true);    

      translate([cubeX/3, cubeY/2 + homutHoleY/2, 0])
      cube([homutHoleX, homutHoleY, homutHoleZ], center=true);

      translate([-cubeX/3, cubeY/2 + homutHoleY/2, 0])
      cube([homutHoleX, homutHoleY, homutHoleZ], center=true);
      
      translate([cubeX/3, -cubeY/2 - homutHoleY/2, 0])
      cube([homutHoleX, homutHoleY, homutHoleZ], center=true);

      translate([-cubeX/3, -cubeY/2 - homutHoleY/2, 0])
      cube([homutHoleX, homutHoleY, homutHoleZ], center=true);

      translate([-cubeX/3, 0, -platformThikns/2 +homutHoleY/2])
      cube([homutHoleX, homutHoleY+cubeY, homutHoleY+1], center=true);
      
      translate([+cubeX/3, 0, -platformThikns/2 +homutHoleY/2])
      cube([homutHoleX, homutHoleY+cubeY, homutHoleY+1], center=true);

      translate([+cubeX/3, cubeY/2 - (platformThikns-homutHoleY)/2, homutHoleY/2 + 0.25])
      cube([homutHoleX, 1+platformThikns-homutHoleY, 1 + platformThikns-homutHoleY-1/2], center=true);
      
      translate([+cubeX/3, - cubeY/2 + (platformThikns-homutHoleY)/2, homutHoleY/2 + 0.25])
      cube([homutHoleX, 1+platformThikns-homutHoleY, 1 + platformThikns-homutHoleY-1/2], center=true);

      translate([-cubeX/3, cubeY/2 - (platformThikns-homutHoleY)/2, homutHoleY/2 + 0.25])
      cube([homutHoleX, 1+platformThikns-homutHoleY, 1 + platformThikns-homutHoleY-1/2], center=true);
      
      translate([-cubeX/3, - cubeY/2 + (platformThikns-homutHoleY)/2, homutHoleY/2 + 0.25])
      cube([homutHoleX, 1+platformThikns-homutHoleY, 1 + platformThikns-homutHoleY-1/2], center=true);
    }


   translate([-cubeX/3, -8/2 -3/4 + cubeY/2 - (platformThikns-homutHoleY)/2, platformThikns/2])
   ocrugl();
   
   translate([+cubeX/3, -8/2 -3/4 + cubeY/2 - (platformThikns-homutHoleY)/2, platformThikns/2])
   ocrugl();

   translate([-cubeX/3, +8/2 +3/4 - cubeY/2 + (platformThikns-homutHoleY)/2, platformThikns/2])
   rotate([0, 0, 180])
   ocrugl();
   
   translate([+cubeX/3, +8/2 +3/4 - cubeY/2 + (platformThikns-homutHoleY)/2, platformThikns/2])
   rotate([0, 0, 180])
   ocrugl();
}
      
     // translate([-cubeX/3, 0, -platformThikns/2 +homutHoleY/2])
      // cube([homutHoleX, homutHoleY+cubeY, homutHoleY+1], center=true);


}

module ocrugl() {
    homutHoleX = 12;
    homutHoleY = 1.5;
    homutHoleZ = 12;

     intersection() {

       rotate([0, 90, 0])
       cylinder(h=homutHoleX, d = 16, center=true);

       translate([0, +4, -4])
       cube([12, 8, 8], center=true);

     }

}
