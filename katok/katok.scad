use <side.scad>;


diam=300;
lenMain=1100;    // вместе с удлинителями

module Katok() {

    rotate([-90,0,0]) 
    cylinder(h=lenMain, r=diam/2, center=true);

    translate([0,-(lenMain/2),0])
    rotate([90,0,0]) 
    Side();
    
    translate([0,(lenMain/2),0])
    rotate([-90,0,0]) 
    Side();
    
//    rotate([0,0,0]) 
//    translate([0,-lenMain/2, diam/2])
    //Bort(); 


    rotate([0,60,0]) 
    translate([0,-lenMain/2, diam/2])
    Bort(); 
    
    rotate([0,-60,0]) 
    translate([0,-lenMain/2, diam/2])
    rotate([0,180,0]) 
    Bort(); 

}

liamkaWidth=160; // 1/6 длины окружности катка: треть сверху, от оставшихся третей половину оставить.
cornerCutRad=50;
module Bort() {
      cube([liamkaWidth/2, lenMain, 1]);

      //first
      hull() {

        translate([cornerCutRad, cornerCutRad, 0])
        cylinder(h=1, r=50, center=true);
        //+ 
        translate([liamkaWidth/2+cornerCutRad, cornerCutRad, 0])
        cylinder(h=1, r=50, center=true);

        //1/4
        translate([cornerCutRad, lenMain/4, 0])
        cylinder(h=1, r=50, center=true);

      }

      //middle
      hull() {
      
        //1/4
        translate([cornerCutRad, lenMain/4, 0])
        cylinder(h=1, r=50, center=true);

        //middle
        translate([liamkaWidth/2+cornerCutRad, lenMain/2, 0])
        cylinder(h=1, r=50, center=true);
      
        //3/4
        translate([cornerCutRad, lenMain*3/4, 0])
        cylinder(h=1, r=50, center=true);
      }

      //last
      hull() {
        
        //3/4
        translate([cornerCutRad, lenMain*3/4, 0])
        cylinder(h=1, r=50, center=true);

        translate([cornerCutRad, lenMain-cornerCutRad, 0])
        cylinder(h=1, r=50, center=true);
        //+
        translate([liamkaWidth/2+cornerCutRad, lenMain-cornerCutRad, 0])
        cylinder(h=1, r=50, center=true);
      }
}

Katok();

