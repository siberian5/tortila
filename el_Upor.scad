Upor();


    uporWid = 50;
    thicns = 2;
    tubeDia = 48.5;
    shplintHoleDia = 8.5;
    shplintHoleHeig = 21;
    sphereRad = 13;



module Upor() {

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

}
