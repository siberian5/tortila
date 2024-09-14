
ang2xy = 25.4141;
ang2xz = 30.59;

ang3xy = 39.9445;
ang3xz = 65.87;


sphereDia = 57;
horCylDia = 16;
//horCylLen = 62;
horCylLen = 67;
vertCylDia = 22;
vertCylTemp = 55;
heightDiff = 114;
tubeDia = 48;
midTubeLenTemp = 80;

plastinaWid = 56;
plastinaLen = 57;
plastinaThicn = 5;
plastinaHolesDia = 8.5;
plastinaHolesDiff = 32; 

sphereHeight =  heightDiff - sphereDia/2 - tubeDia/2; 

//echo("sh =", sphereHeight);

angCut = 45 - ang3xy/2;

//******************************
d = 17;       //!!!!!!!!!!!!!!!!
legPart = 13; //30; //!!!!!!!!!!!!!!!!


cutHeight = tubeDia/2 + d / (tan(angCut));
//echo(cutH =  cutHeight);
sz = 3*tubeDia;

PyraTop();

echo( "sphereHeight " , sphereHeight);

module PyraTop() {

//    $fn = 100;
    
    translate([0,0,sphereHeight])
    sphere(d = sphereDia);

    rotate([0,ang2xz+90,0]) 
    Plastina();

    translate([0,0,sphereHeight])     
    rotate([90,0,0])     
    cylinder(d = horCylDia,h=horCylLen, center=true);

    translate([0,0,sphereHeight])     
    rotate([180,0,0]) 
    cylinder(d = vertCylDia, h = vertCylTemp);

    difference(){

        rotate([90,0,0])
        cylinder(d = tubeDia, h = midTubeLenTemp,center=true);

        rotate([0,(90-ang3xz),0])
        translate([0,0,-cutHeight])
        rotate([angCut,0,0])
        translate([-sz/2,-sz,0]) 
        cube([sz,sz,sz]);

        rotate([0,(90-ang3xz),0])
        translate([0,0,-cutHeight])
        rotate([-angCut,0,0])
        translate([-sz/2,0,0]) 
        cube([sz,sz,sz]);
    
    }


    delt = 3*d;

    difference() {

        rotate([0,(90-ang3xz),0])
        translate([0,0,-cutHeight])
        rotate([2*angCut,0,0])
        translate([0,delt,cutHeight])
        rotate([90,0,0])
        cylinder(d = tubeDia, h = delt+legPart);

        rotate([0,(90-ang3xz),0])
        translate([0,0,-cutHeight])
        rotate([angCut,0,0])
        translate([-sz/2,0,0]) 
        cube([sz,sz,sz]);

    }

    difference() {

        rotate([0,(90-ang3xz),0])
        translate([0,0,-cutHeight])
        rotate([-2*angCut,0,0])
        translate([0,-delt,cutHeight])
        rotate([-90,0,0])
        cylinder(d = tubeDia, h = delt+legPart);

        rotate([0,(90-ang3xz),0])
        translate([0,0,-cutHeight])
        rotate([-angCut,0,0])
        translate([-sz/2,-sz,0]) 
        cube([sz,sz,sz]);

    }

}

module Plastina() {

    cornerRad = (plastinaWid - plastinaHolesDiff)/2;

    difference() {

        hull(){

            translate([0,plastinaHolesDiff/2,(plastinaLen - cornerRad)])
            rotate([0,90,0]) 
            cylinder(r=cornerRad, h=plastinaThicn, center=true);

            translate([0,-plastinaHolesDiff/2,(plastinaLen - cornerRad)])
            rotate([0,90,0]) 
            cylinder(r=cornerRad, h=plastinaThicn, center=true);

            translate([0,0,(plastinaLen-cornerRad)/2])
            cube([plastinaThicn,
            plastinaWid,(plastinaLen-cornerRad)],center=true);

        }

        translate([0,plastinaHolesDiff/2,(plastinaLen - cornerRad)])
        rotate([0,90,0]) 
        cylinder(d=plastinaHolesDia, h=plastinaThicn+2, center=true);

        translate([0,-plastinaHolesDiff/2,(plastinaLen - cornerRad)])
        rotate([0,90,0]) 
        cylinder(d=plastinaHolesDia, h=plastinaThicn+2, center=true);

    }
}



