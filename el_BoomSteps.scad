



//$fn = 100;

mastDia = 69;
thicns = 2;
stepsH = 45.5;
stRad = 14;
holeRad = 8.5/2;

Steps();

module Steps() {


    translate([-thicns - mastDia/2,0,-stepsH/2]) {
    difference() {
        hull(){
            translate([0,0,thicns]) 
            rotate([90,0,0]) 
            cylinder(r = thicns, h = 2*thicns,center = true);

            translate([stRad-stepsH+10, 0, stepsH-stRad]) 
            rotate([90,0,0]) 
            cylinder(r = stRad, h = 2*thicns,center = true);

            translate([0,0,stepsH-thicns]) 
            rotate([90,0,0]) 
            cylinder(r = thicns, h = 2*thicns,center = true);
        }

        
        translate([stRad-stepsH+10, 0, stepsH-stRad]) 
        rotate([90,0,0]) 
        cylinder(r = holeRad, h = 2*thicns+1,center = true);

    }}

    difference() {
        cylinder(r = mastDia/2 + thicns, h = stepsH, center = true);
        cylinder(r = mastDia/2 , h = stepsH+1, center = true);
        
        tempA = mastDia+2*thicns;
        translate([tempA/2,0,0]) cube([tempA, tempA, stepsH+1], center = true);
    }
    

}
