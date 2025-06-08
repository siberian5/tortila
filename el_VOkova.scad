
VOkova();

mastDia = 69;


// Ограничение по высоте оковки "снаружи"
okH = 96.5;
thikns = 2; 
// Высота "уха"
okH1 = 66;
bigR = 20;
holeR = 6;
frontLen = 44;


module VOkova() {
        
   
    // Вырез трубы
    // скошенный кусок трубы, из которого вырезали ещё.
    difference() {
        // скошенный кусок трубы
        intersection() {
            // кусок трубы
            difference() {
                cylinder( h = okH , d = mastDia + 2*thikns );

                translate([ 0 , 0 , -1/2 ]) 
                cylinder( h = okH + 1 , d = mastDia );
    
                translate([ - mastDia/2 - 15 , 0 , okH/2 + 1 ])
                cube([ mastDia , mastDia + 2 , okH + 2 ] , center=true );
                
                // Дырки под болты
                translate([ 0 , 0, okH -14 ]) 
                rotate([90, 0, 0])
                translate([ 0 , 0, -40 ]) 
                cylinder( h = 80, d = 7 );
            }

            translate([ mastDia/2 + 1 , 0 , 0 ])
            rotate([ 0 , 60 , 0 ])
            translate([ -mastDia , 0 , okH1/2 ]) 
            cube([ mastDia * 2 , mastDia + 2 , okH1 ] , center=true );

        }

        translate([ mastDia/2 + 2 , 0 , okH1 ]) 
        rotate([ 0 , 43 , 0 ])
        translate([ -mastDia , 0 , okH1/2 ])
        cube([ mastDia * 2 , mastDia + 5 , okH1 ] , center=true );

    }

    // УХО
    difference() {
    hull() {
        translate([ mastDia/2 + frontLen - bigR , 0 , bigR ]) 
        rotate([ 90 , 0 , 0 ]) 
        cylinder( h = thikns * 2 , r = bigR , center=true );

        translate([ mastDia/2 + thikns/2 , 0 , okH1/2 ])
        cube([ thikns , thikns , okH1 ] , center=true );
    }

    hull() {

        translate([ mastDia/2 + frontLen - bigR , 0 , bigR ]) 
        rotate([ 90 , 0 , 0 ]) 
        cylinder( h = thikns * 2 + 2 , r = holeR , center=true );

        translate([ mastDia/2 + frontLen - bigR - 8 , 0 , bigR + 8 ]) 
        rotate([ 90 , 0 , 0 ]) 
        cylinder( h = thikns * 2 + 2 , r = holeR , center=true );
    }}
}
