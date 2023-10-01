sphereDia = 500;
torchit = 50;

module Side() {

    difference(){

        translate([0,0,-(sphereDia/2 - torchit)])
        sphere(d = sphereDia);

        translate([0,0,-500])
        cylinder(h=1000, r=1000, center=true);
    }
}

Side();
