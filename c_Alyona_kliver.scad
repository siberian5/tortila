
use <el_gen_shtag.scad>;


//Staksel();
AlyanaKliver(7000, 400);

module AlyanaKliver(alShtagLen, alShtagOffset){

  r1 = 1;
  wid = 1;



  frontShkatLen = 5880;
  shkotAngleXOffset = 2005;
  shkotAngleZOffset = 4733;

  xMed = (0+0-shkotAngleXOffset)/3;
  zMed = (0-shkotAngleZOffset-frontShkatLen)/3;


  shkotAngleWorkRad = 2000;
  shkotAngleWorkYRotation = -41.9;



  translate([ 0 , 0 , alShtagLen ]) {
      
      rotate([ 0 , +90 , 0 ])
      GenShtag(alShtagLen);


      translate([ 0 , 0 , -alShtagOffset ]) {
        rotate([ 0 , -90 , 0 ])
        hull()  { 
  
          translate([ - 1 , 0 , 1 ]) 
          rotate([ 90 , 0 , 0 ])
          cylinder( r = r1 , h = wid , center = true );
  
          translate([  - frontShkatLen , 0 , 1 ]) 
          rotate([ 90 , 0 , 0 ])
          cylinder( r = r1 , h = wid , center = true );
  
          translate([- shkotAngleZOffset , 0 ,shkotAngleXOffset ]) 
          rotate([ 90 , 0 , 0 ])
          cylinder( r = r1 , h = wid , center = true );
  
        }

        translate([ xMed , 0 , zMed ])
        sphere(d = 30);


        translate([ -shkotAngleXOffset , 0 , -shkotAngleZOffset ])
        rotate([ 0 , shkotAngleWorkYRotation , 0 ])
        translate([ -shkotAngleWorkRad , 0 , 0 ])
        cylinder( r = shkotAngleWorkRad , h = 1 , center=true );
  
  
      
        translate([ -shkotAngleXOffset , 0 , -shkotAngleZOffset ])
        rotate([ 0 , shkotAngleWorkYRotation , 0 ])
        translate([ -shkotAngleWorkRad , 0 , 0 ])
        cube([ 2*shkotAngleWorkRad , 10 , 50 ] , center=true );


      } 

  }
  
}
