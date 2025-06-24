platformThikns = 10;
platformDia = 110;

diamVneshNogi = 48.5;

cubeX = 70;
cubeY = 40;
cubeZ = 20;


translate([0, -26, 0])
rotate([0, 0, 111])
GarminKrepa();

translate([0, 0, -platformThikns])
rotate([0, 180, 0])
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
    cube([ cubeX , cubeY , cubeZ ] , center=true );

    translate([0, 0, diamVneshNogi/2])
    rotate([0, 90, 0])
    cylinder(h=platformDia,d=diamVneshNogi,center=true);    
  }
    
    //translate([0, 0, diamVneshNogi/2])
    //rotate([0, 90, 0])
    //cylinder(h=platformDia,d=diamVneshNogi,center=true);    

        
  translate([0, 0, -platformThikns/2])
  cylinder(h=platformThikns,d=platformDia,center=true);    

/*
    $fn = 50;

    py = - uporWid/2;

    // Охват
    difference() {
        
        rotate([-90,0,0]) 
        cylinder(h=uporWid, d = tubeDia+2*thicns,center=true);
        
        rotate([-90,0,0]) 
        cylinder(h=uporWid+2, d = tubeDia,center=true);           
    }

    difference() 
    {
   
        intersection() 
        {
            union() 
            {
                intersection() 
                {

                    //срез полный    
                    translate([-thicns,py,tubeDia/2+1]) 
                    cube([thicns*2, uporWid, uporWid]);

                    //сфера
                    translate([0,0,tubeDia/2+thicns+shplintHoleHeig])
                    sphere(r=sphereRad);
                }

                //срез внутренний    
                translate([-thicns,py,tubeDia/2+1]) 
                cube([thicns*2, uporWid, uporWid/2+3]);
            }

            //конус
            translate([0,0,tubeDia/2+thicns])
            cylinder(h=uporWid*tan(64)/2,d1=uporWid,d2=0);    
        }



        //цилиндр дырки
        translate([0,0,tubeDia/2+thicns+shplintHoleHeig])
        rotate([0,-90,0])
        cylinder(h=tubeDia,d=shplintHoleDia,center=true);    
        

    }
*/
}
