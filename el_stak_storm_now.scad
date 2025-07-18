


StakselStorm();

module StakselStorm (){

  r1 = 1;
  wid = 1;

  sideA = 2900;
  sideB = 2070;
  sideC = 1420;

  p = (sideA + sideB + sideC)/2;

  sq = sqrt(p*(p-sideA)*(p-sideB)*(p-sideC));

  sideA_h = 2 * sq / sideA;

  sideB_A = sqrt(sideB*sideB - sideA_h*sideA_h);

  ct_hor = sideA_h * 1 / 3;

  ct_vert =  sideB_A - (sideB_A - sideA/2) * 1/3 ;

  //echo ("sideB_A: ", sideB_A);

//    translate([ 0 , 0 , sideA ]) {

      rotate([ 0 , -90 , 0 ])
      hull()  { 
  
          translate([ - 1 , 0 , 1 ]) 
          rotate([ 90 , 0 , 0 ])
          cylinder( r = r1 , h = wid , center = true );
  
          translate([  - sideA , 0 , 1 ]) 
          rotate([ 90 , 0 , 0 ])
          cylinder( r = r1 , h = wid , center = true );
  
          translate([ -  sideB_A , 0 , sideA_h ]) 
          rotate([ 90 , 0 , 0 ])
          cylinder( r = r1 , h = wid , center = true );
  
      }
  
      translate([ -ct_hor , 0 , -ct_vert ])
      sphere(d = 30);
      

      cylRad = 2700;
  
      translate([ -sideA_h, 0 , -sideB_A ])
      rotate([ 0 , -12 , 0 ])
      translate([ -cylRad , 0 , 0 ])
      cylinder( r = cylRad , h = 1 , center=true );
      
      translate([ -sideA_h, 0 , -sideB_A ])
      rotate([ 0 , -12 , 0 ])
      translate([ -cylRad , 0 , 0 ])
      cube([ 1400 , 10 , 50 ] , center=true );



 //   }



}
