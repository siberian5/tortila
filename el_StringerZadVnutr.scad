use <el_StringerZadVnesh.scad>;

StringerZadVnutr();

stringerR = 35/2;
length = 2100;
probkaThk = 5;
shpHoleR = 7/2;
//b1 = 15;
//b2 = 435;
//b3 = 450;
//b4 = 2100 - 15;
doskaHole =235;
podShvHole=450+370;
rudderHole=450+370+1010;



module StringerZadVnutr() {


    difference() {

        StringerZadVnesh();

        translate([-doskaHole,0,0])
        rotate([90,0,0]) 
        cylinder(h=2*stringerR+2,r=shpHoleR, center=true);

        translate([-podShvHole,0,0]) 
        rotate([90,0,0]) 
        cylinder(h=2*stringerR+2,r=shpHoleR, center=true);

        translate([-rudderHole,0,0]) 
        rotate([90,0,0]) 
        cylinder(h=2*stringerR+2,r=shpHoleR, center=true);

    }
}
