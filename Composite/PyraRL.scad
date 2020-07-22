use <../Parts/ShplRoz.scad>;

    legLen = 1347;
    holeOffset = 20;
    diamVnesh = 48.5;
/*
    platformThickns = 5;
    ushiThickns = 6;
    lenA = 40;
    shplintDia = 8.5;
    shplintHoleHeight = 15;
*/

//translate([legLen+holeOffset,0,0]) 
PyraRL();

module PyraRL() {
    
//    $fn = 50;
    
    translate([-holeOffset,0,0]) 
    rotate([0,-90,0]) 
    cylinder(h=legLen, d=diamVnesh);        

    rotate([90,0,0]) 
    ShplRoz();

//    translate([-holeOffset*2-legLen,0,0]) rotate([90,0,180]) ShplRoz();

    translate([ -holeOffset - 12 , 0 , 0 ]) 
    rotate([ 0 , -90 , 0 ]) 
    cylinder( h=4 , d=diamVnesh + 8);        
    


}
