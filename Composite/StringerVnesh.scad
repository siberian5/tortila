use <../Parts/StringerZadVnesh.scad>;
use <../Parts/StringerPered.scad>;


StringerVnesh();

//stringerR = 35/2;
lengthPered = 2200;
b1 = 15;
xoffset =b1 - lengthPered; 
//probkaThk = 5;
//shpHoleR = 7/2;
//b2 = 435;
//b3 = 450;
//b4 = 2100 - 15;
//doskaHole =235;
//podShvHole=450+370;
//rudderHole=450+370+1010;



module StringerVnesh() {

    StringerPered();
    translate([xoffset,0,0]) StringerZadVnesh();

}
