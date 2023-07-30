module Ballon50(){
    
    cylLen = 2720; //435; //3450;
    dia = 506;
    dx = 935;
    dx1 = 935-1820;
    dfront = 240;
    hfront = 172;
    drear = 334;
    dx2 = dx+cylLen;
    

    hull(){
    
        translate([-dx,0,0]) 
        rotate([0,-90,0])    
        cylinder(d=dia,h=cylLen);

        translate([-dx,0,0]) 
        rotate([0,86,0]) 
        cylinder(d1=dia, d2=dfront,h=1820);

        translate([-dx1,0,(dia/2 - dfront/2)-10]) 
        rotate([0,90,0]) 
        cylinder(d1 = dfront,d2=0, h=172);

     
        translate([-dx2,0,0]) 
        rotate([0,-86,0]) 
        cylinder(d1=dia, d2=drear,h=1260);


        translate([-dx2-1260,0,(dia/2 - drear/2)]) 
        rotate([0,-90,0]) 
        cylinder(d1 = drear,d2=0, h=249);

    }
}
