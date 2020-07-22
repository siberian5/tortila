ShplRoz();

    gikLen = 2200;
    diamVnesh = 48.5;
    platformThickns = 5;
    ushiThickns = 6;
    lenA = 40;
    shplintDia = 8.5;
    shplintHoleHeight = 15;

module ShplRoz() {

    intersection() {
        
        union() {
            
            //Цилиндр
            translate([+platformThickns-1,0,0]) 
            rotate([0,-90,0]) 
            cylinder(h=shplintHoleHeight+platformThickns, d=diamVnesh);   // Эта часть такая, какая нужна.    

            // Сфера
            sphere(d = ushiThickns*4.5);
       } 

       ConicBar();

    }

    //Цилиндр затычки, высотой 4мм 
    translate([-shplintHoleHeight-1,0,0]) 
    rotate([0,-90,0]) 
    cylinder(h=platformThickns-1, d=diamVnesh);    

}




module ConicBar() {
    
    intersection() { 

        union() {
                                        
            // Шайба 1мм
            translate([-shplintHoleHeight,0,0]) 
            rotate([0,-90,0]) 
            cylinder(h=1, d=diamVnesh);
    
            // Захваты упора с дырками.
            difference(){ 
                    
                // Захваты упора.
                union() {  
                    translate([-shplintHoleHeight,ushiThickns /2 ,-diamVnesh/2]) 
                    cube([lenA,ushiThickns ,diamVnesh]);    

                    translate([-shplintHoleHeight,-3*ushiThickns /2 ,-diamVnesh/2]) 
                    cube([lenA,ushiThickns ,diamVnesh]);
                        
                }
                    
                // Дырки для шплинта ( вырез цилиндра )
                translate([0 ,-1-ushiThickns*3/2,0]) 
                rotate([-90,0,0]) 
                cylinder(h=ushiThickns *3+2, d=shplintDia); 

            }
        
            // Стыки
            difference() {

                translate([-shplintHoleHeight,3*ushiThickns /2 ,-diamVnesh/2]) 
                cube([ushiThickns,ushiThickns ,diamVnesh]);    

                translate([-shplintHoleHeight + ushiThickns,5*ushiThickns/2,-diamVnesh/2]) 
                rotate([0,0,0]) 
                cylinder(h=diamVnesh, d=ushiThickns*2  );       
            }
            difference() {

                translate([-shplintHoleHeight,-5*ushiThickns /2 ,-diamVnesh/2]) 
                cube([ushiThickns,ushiThickns ,diamVnesh]);      

                translate([-shplintHoleHeight + ushiThickns,-5*ushiThickns/2,-diamVnesh/2]) 
                rotate([0,0,0]) 
                cylinder(h=diamVnesh, d=ushiThickns*2  );       
            }   
        
        }

        // Конус. Нужно оставить то, что в нём.
        translate([-shplintHoleHeight-1,0,0]) 
        rotate([0,90,0]) 
        cylinder(h=platformThickns*8, d1=diamVnesh, d2=0);   // Пересекаем с этим конусом.
   
    } // Пересечение
}   // Модуль ConicBar

