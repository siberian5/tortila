
Us(150);


vantaDia = 3;

module Us(usLen) {

    rotate([0, 180, 0])
    translate([-usLen, 0, 0])
    {


      rotate([0, 90, 0])
      cylinder(h=usLen, r=vantaDia/2);

    }
}
