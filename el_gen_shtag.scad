

diamGenShtag = 6;

//translate([-2000,0,0]) 
GenShtag(7570);

module GenShtag(shtagLen) {
   translate([shtagLen/2, 0, 0]) rotate([0,90,0]) cylinder(h=shtagLen, d=diamGenShtag, center=true);       
}
