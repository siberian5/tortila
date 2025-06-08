
trosDia = 3;
tubeDia = 22;
triaSide = 565;
triaBack = 607;

CraspTria();

module CraspTria() {


    translate([302, 0, 0]) 
    rotate([0,0,57.5])
    translate([0, triaSide/2, 0]) 
    Side();
    
    translate([302, 0, 0]) 
    rotate([0,0,-57.5])
    translate([0, -triaSide/2, 0]) 
    Side();
    
    cylinder(h=tubeDia, r=tubeDia*2, center=true);
    
    rotate([0, 90, 0]) 
    cylinder(h=triaBack/2, r=tubeDia/2);
    
    rotate([0, 0, 120]) 
    rotate([0, 90, 0]) 
    cylinder(h=350, r=tubeDia/2);
    
    rotate([0, 0, -120]) 
    rotate([0, 90, 0]) 
    cylinder(h=350, r=tubeDia/2);
}

module Side() {
    rotate([-90,0,0]) 
    cylinder(h=triaSide, r=tubeDia/2, center=true);
    
    translate([0, triaSide/2, 0])
    cylinder(h=30, r=trosDia/2, center=true);
    
    translate([0, -triaSide/2, 0])
    cylinder(h=30, r=trosDia/2, center=true);

}
