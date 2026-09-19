
use <el_gen_shtag.scad>;


//RearShkat_5140_5060();

module RearShkat_5140_5060(){

    translate([ 2530, 0 , 0]) 
    for (dx = [0:100:2500])point_5140_5060(dx);

}

module point_5140_5060(dx){
    
          // Решение квадратного уравнения на параболу задней шкаторины для конкретного прогиба... 
          // Рога вниз.
          dy = 392.36 - 6.13 * dx * dx /100000;

          translate([ dx, 0 , dy+1 ]) 
          rotate([ 90 , 0 , 0 ])
          cylinder( r = 1 , h = 1 , center = true );
          
          translate([ -dx, 0 , dy+1 ]) 
          rotate([ 90 , 0 , 0 ])
          cylinder( r = 1 , h = 1 , center = true );
}





AlyanaJib(7000, 400, false);
/* 
 * alShtagLen — Какой длины штаг пририсовать? 
 * alShtagOffset — На сколько по штагу парус спустить?
 * angleParam — Если парус с серпом , на какой угол нижняя шкаторина завернётся вверх? 
 * left — Парус на левом галсе?
 */
module AlyanaJib(alShtagLen, alShtagOffset, left){

  r1 = 1;
  wid = 1;

  angleParam = 2;

  frontShkatLen = 5880;
  shkotAngleXOffset = 2005;
  shkotAngleZOffset = 4733;

  shkotAngle = atan((frontShkatLen-shkotAngleZOffset)/shkotAngleXOffset); // 29.7726
  lowShkatLen = shkotAngleXOffset / cos(shkotAngle); // 2310 

  rearShkatLen = sqrt(shkotAngleXOffset*shkotAngleXOffset + shkotAngleZOffset*shkotAngleZOffset); // 5140

  topAngle = atan(shkotAngleXOffset/shkotAngleZOffset); // 22.95
  //echo("topAngle:", topAngle);
//   echo("rearShkatLen: ", rearShkatLen);

  serpedShkotAngleXOffset = lowShkatLen * cos (shkotAngle + angleParam);  // 2005 —> 1963.75
  serpedShkotAngleZOffset = ( frontShkatLen - lowShkatLen * sin (shkotAngle + angleParam));  // 4733 —> 4663.73

  rearSerpedShkatLen = sqrt(serpedShkotAngleXOffset * serpedShkotAngleXOffset + serpedShkotAngleZOffset * serpedShkotAngleZOffset); // 5140 —> 5060

  //echo("rearSerpedShkatLen: ", rearSerpedShkatLen); // 5140 —> 5060

  // Кагого радиуса круг?  // 8390






  xMed = (0+0-shkotAngleXOffset)/3;
  zMed = (0-shkotAngleZOffset-frontShkatLen)/3;


  shkotAngleWorkRad = 2000;
  shkotAngleWorkYRotation = -41.9+10;



  translate([ 0 , 0 , alShtagLen ]) {
      
      rotate([ 0 , +90 , 0 ])
      GenShtag(alShtagLen);


      translate([ 0 , 0 , -alShtagOffset ]) {
      
        
        rotate([ 0 , -90 , 0 ])
        difference() {
          hull()  { 
  
            translate([ - 1 , 0 , 1 ]) 
            rotate([ 90 , 0 , 0 ])
            cylinder( r = r1 , h = wid , center = true );
    
            translate([  - frontShkatLen , 0 , 1 ]) 
            rotate([ 90 , 0 , 0 ])
            cylinder( r = r1 , h = wid , center = true );
          
            rotate([0 , topAngle-180 , 0 ])
            rotate([left? 90:-90 , 0 , 0 ])
            RearShkat_5140_5060();
    
            translate([- shkotAngleZOffset , 0 ,shkotAngleXOffset ]) 
            rotate([ 90 , 0 , 0 ])
            cylinder( r = r1 , h = wid , center = true );
  
          }
        
          translate([0, (left?1:-1), 1])
          hull()  { 
  
            translate([ - 1 , 0 , 1 ]) 
            rotate([ 90 , 0 , 0 ])
            cylinder( r = r1 , h = wid , center = true );
    
            translate([  - frontShkatLen , 0 , 1 ]) 
            rotate([ 90 , 0 , 0 ])
            cylinder( r = r1 , h = wid , center = true );
          
            rotate([0 , topAngle-180 , 0 ])
            rotate([left? 90:-90 , 0 , 0 ])
            RearShkat_5140_5060();
    
            translate([- shkotAngleZOffset , 0 ,shkotAngleXOffset ]) 
            rotate([ 90 , 0 , 0 ])
            cylinder( r = r1 , h = wid , center = true );
  
          }

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
