/**
 * XEndStopHolder.scad
 *
 * Created by Diego Viejo
 * 6 - Sept - 2019
 *
 *      b
 *  -----------
 *  |        *|
 *  |         | d       a = 15 + c + d
 *  |        --         b = b1 + b2
 * a|        |  15mm    * = 3mm. diam. hole
 *  |        --
 *  |         | c
 *  ----------- 
 *     b1    ,b2
 * 
 */

c = 5;
d = 23;
a = 15 + c + d;
b2 = 7;
b1 = 27;
b = b1 + b2;

endstopSeparation = 10;


module XEndStopHolder()
difference()
{
    union()
    {
        cube([b, a, 4]);
        
        //zendstop adjustment socket
        hull()
        {
            translate([3, 0, 0]) cube([7, 7, 4+7]);
            
            cube([15, 7, 4]);
        }
        
        //xend platform
        hull()
        {
            translate([b1-12.15, 0, 0]) cube([12, c+15+c, 15]);
            translate([b1-17, 0, 0]) cube([15, c+15+c, 4]);
        }
    }
    
    translate([b1-0.15, c-0.15, -1]) cube([60, 15 + 2*0.15, 15 + 1]);
    
    //attaching hole
    translate([b-3, a-3, -1]) cylinder(d=3, h=4+2, $fn=20);
    
    //x endstop
    for(i = [-1, 1])
    {
        hull()
        {
            translate([b1-10, c + (15+i*endstopSeparation)/2, 5]) cylinder(d=1.5, h=11);
            translate([b1-2, c + (15+i*endstopSeparation)/2, 5]) cylinder(d=1.5, h=11);
        }
        hull()
        {
            translate([b1-10, c + (15+i*endstopSeparation)/2, 13]) cylinder(d=2.15, h=11);
            translate([b1-2, c + (15+i*endstopSeparation)/2, 13]) cylinder(d=2.15, h=11);
        }
    }
    
    
    //zendstop adjustment socket
    translate([3 + 7/2, -1, 4 + 7/2])  rotate([-90, 0, 0]) cylinder(d=2.6, h=20, $fn=10);
    translate([3 + 7/2, 7-3, 4 + 7/2])  rotate([-90, 0, 0]) cylinder(d=6.5, h=5, $fn=6);
    
    //fancy
    translate([0, a, 0]) rotate(45) cube(15, center=true);
}

XEndStopHolder();
translate([b*2+5, 0, 0]) mirror([1, 0 ,0]) XEndStopHolder();
