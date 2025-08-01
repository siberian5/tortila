

sideA = 1500;
sideC = 5650;
sideB = 4960;

bcCosA = ( sideB*sideB + sideC*sideC -  sideA*sideA) / 2;

aDegs = acos(bcCosA / (sideB * sideC ));

sideA2 = sideC * sin(aDegs);
sideB2 = sideC * cos(aDegs);

dH = sideB2 - sideB;

echo ( "sideA2", sideA2) ;
echo ( "sideB2", sideB2) ;
echo ( "dH", dH) ;


// translate([sideA2, 0, -dH])
// rotate([0, -aDegs, 0])
Staksel_perspective(3.5, 5.65, 0.15);

// (площадь кв мв, длина передней шк-ны м, коэффициент подъёма заднего угла ( 0 ... 1 )
module Staksel_perspective(s, fstSka, shkotHeightK){
  
  pt = 1;

  fstSkaLen = 1000 * fstSka;
  heightBLen = s * 2 /  fstSka * 1000;

  echo("stacksel heightBLen = ", heightBLen) ;

  offsetBLen = fstSkaLen * shkotHeightK;
  
  echo("stacksel offsetBLen = ", offsetBLen) ;


  hull()  { 
 
   // Начало
    translate([ -pt , 0 , pt ]) 
    rotate([ 90 , 0 , 0 ])
    cylinder( r = pt , h = pt , center = true );

    // Верхний угол
    translate([-pt, 0 , pt + fstSkaLen ]) 
    rotate([ 90 , 0 , 0 ])
    cylinder( r = pt , h = pt , center = true );

    // задний угол
    translate([ -pt-heightBLen , 0 , pt + offsetBLen]) 
    rotate([ 90 , 0 , 0 ])
    cylinder( r = pt , h = pt , center = true );
  
  }
  
  translate([ -pt-heightBLen/3, 0 , pt + (offsetBLen + fstSkaLen)/3 ])
  sphere(d = 30);

  // Угол наклона плоскости шкота
  alfa = atan((fstSkaLen/2-offsetBLen)/heightBLen);
    
  translate([ -pt-heightBLen , 0 , pt + offsetBLen]) 
  rotate([ 0 , -alfa , 0 ])
  cylinder( r = pt*2000 , h = pt , center = true );

}
