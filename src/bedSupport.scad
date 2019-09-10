/**
 * Bed supports
 * Created on 16/07/2019
 * Diego Viejo
 *
*/

platformHeight = 9;
Height = platformHeight+6;

module bedSquare(l = 6)
{
    difference()
    {
        hull()
        {
            translate([27.5, 7.5, 0]) cylinder(d=10, h=Height/2, $fn=20);
            translate([7.5, 27.5, 0]) cylinder(d=10, h=Height/2, $fn=20);
            translate([5, 27.5, 0]) cylinder(d=10, h=Height/2, $fn=20);
            translate([-10, -60, 0]) cylinder(d=10, h=Height/2, $fn=20);
        }
        
        //platform 
        translate([-0.5, -0.5, 3.15]) cube([40, 40, Height]);
        
        //connecting bolts
        #translate([7.5, 7.5, 2.3]) cylinder(d=3.2, h=Height/2+2, $fn=20);
        #translate([27.5, 7.5, 2.3]) cylinder(d=3.2, h=Height/2+2, $fn=20);
        #translate([7.5, 27.5, 2.3]) cylinder(d=3.2, h=Height/2+2, $fn=20);
        #translate([0, -40, 2.3]) cylinder(d=3.2, h=Height/2+2, $fn=20);
        #translate([7.5, 7.5, -1]) cylinder(d=6.5, h=3, $fn=l);
        #translate([27.5, 7.5, -1]) cylinder(d=6.5, h=3, $fn=l);
        #translate([7.5, 27.5, -1]) cylinder(d=6.5, h=3, $fn=l);
        #translate([0, -40, -1]) cylinder(d=6.5, h=3, $fn=l);
    
        //bed bolt
        translate([-10, -60, -1]) cylinder(d=2.7, h=Height/2+2, $fn=20);
        translate([-10, -60, Height/2-2.5]) cylinder(d=6.5, h=4, $fn=6);
    
    }
    
}

module bedFlat(l = 6)
{
    difference()
    {
        hull()
        {
            translate([-15, 7.5, 0]) cylinder(d=10, h=Height/2, $fn=20);
            translate([15, 7.5, 0]) cylinder(d=10, h=Height/2, $fn=20);
            translate([-15, 5, 0]) cylinder(d=10, h=Height/2, $fn=20);
            translate([15, 5, 0]) cylinder(d=10, h=Height/2, $fn=20);
            translate([0, -60, 0]) cylinder(d=10, h=Height/2, $fn=20);
        }
        
        //platform
        translate([-25, -0.5, 3.15]) cube([50, 40, Height]);
        
        //connecting bolts
        #translate([-15, 7.5, 2.3]) cylinder(d=3.2, h=Height/2+2, $fn=20);
        #translate([15, 7.5, 2.3]) cylinder(d=3.2, h=Height/2+2, $fn=20);
        #translate([0, -50, 2.3]) cylinder(d=3.2, h=Height/2+2, $fn=20);

        #translate([-15, 7.5, -1]) cylinder(d=6.5, h=3, $fn=l);
        #translate([15, 7.5, -1]) cylinder(d=6.5, h=3, $fn=l);
        #translate([0, -50, -1]) cylinder(d=6.5, h=3, $fn=l);
        
        //bed bolt
        translate([0, -60, -1]) cylinder(d=2.7, h=Height/2+2, $fn=20);
        translate([0, -60, Height/2-2.5]) cylinder(d=6.5, h=4, $fn=6);
    }
}

// squares
//bedSquare();
//translate([70, 0, 0]) mirror([1, 0, 0]) bedSquare(l=20);

//translate([110, 0, 0]) bedSquare(l=20);
//translate([180, 0, 0]) mirror([1, 0, 0]) bedSquare(l=6);

//middle flat
bedFlat();
translate([45, 0, 0]) mirror([1, 0, 0]) bedFlat(l=20);
