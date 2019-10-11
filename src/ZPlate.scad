/**
 * 
 * Zplate.scad
 * 
 * Created by Diego Viejo
 * 11/Oct/2019
 * 
 * This part has to connect z-rods with aluminium XPlate. It also has to work as holder
 * for Xendstop and for the adjustmen screw for the Z-endstop.
 * 
 */

Length = 80;
Width = 5;
Height = 40;
holeX1 = 4.5;
holeX2 = 35.5;
holeY1 = 20;
holeY2 = 27.5;
holeY3 = 35;

ZAxisX = holeX1 + (holeX2-holeX1)/2;
ZAxisY = 10; //CHECK THIS

module ZPlate()
difference()
{
    union()
    {
        cube([Length, Width, Height]);
        
        hull()
        {
            translate([ZAxisX, -ZAxisY, 0]) cylinder(d=22, h=6);
            cube([2*ZAxisX, Width, 6]);
            
        }
    }
    
    //XPlate junction holes
    translate([holeX1, -1, holeY1]) rotate([-90, 0, 0]) cylinder(d=3, h=Width+2);
    translate([holeX1, -1, holeY3]) rotate([-90, 0, 0]) cylinder(d=3, h=Width+2);
    translate([holeX2, -1, holeY2]) rotate([-90, 0, 0]) cylinder(d=3, h=Width+2);
    
    //Nut holder
    #translate([ZAxisX, -ZAxisY, -1]) cylinder(d=10.5, h=Height);
    for(i=[0, 90, 180, 270])
    #translate([ZAxisX, -ZAxisY, -1]) rotate(i)
        translate([16/2, 0, 0]) cylinder(d=3.3, h=6+2, $fn=15);
        
    //Fancy
    hull()
    {
        translate([2*ZAxisX+10, -1, 25]) rotate([-90, 0, 0]) cylinder(d=15, h=Width+2);
        translate([5*ZAxisX+10, -1, 25]) rotate([-90, 0, 0]) cylinder(d=15, h=Width+2);
        translate([2*ZAxisX+10, -1, 125]) rotate([-90, 0, 0]) cylinder(d=15, h=Width+2);
    }
}

ZPlate();
