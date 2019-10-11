/**
 Layer Fan Holder
 
 Created by Diego Viejo
 
 27/Sept/2019

 
 This file contains parts needed for attaching a layer fan to a DDG bondtech extruder with a
 mosquito hotend. The idea is to use mosquito fan back holes to attach it.
 
*/

MosquitoHolesDist = 20;
MosquitoHeight = 47;
MosquitoLength = 13;

// Part1. Using a BQ layer fan

BQHorDist = 12;
BQVertDist = 15;
BQLowerDist = 32;
BQLength = MosquitoLength+5;

extraWidth = 8;

module BQHolder()
difference()
{
    union()
    {
        hull()
        {
            rotate([90, 0, 0]) cylinder(d=6, h=BQLength+5, $fn=20);
            translate([MosquitoHolesDist+extraWidth, 0, 0]) rotate([90, 0, 0]) cylinder(d=6, h=BQLength+5, $fn=20);
        }
        hull()
        {
            rotate([90, 0, 0]) cylinder(d=6, h=BQLength+5, $fn=20);
            translate([6, 0, 0]) rotate([90, 0, 0]) cylinder(d=6, h=BQLength+5, $fn=20);
            translate([0, 0, -8]) rotate([90, 0, 0]) cylinder(d=6,h=BQLength+5, $fn=20);
            
        }
        hull()
        {
            rotate([90, 0, 0]) cylinder(d=6, h=BQLength+5, $fn=20);
            translate([0, 0, -MosquitoHeight+BQLowerDist-3]) rotate([90, 0, 0]) cylinder(d=6, h=BQLength+5, $fn=20);
        }
    }
    
    //Mosquito attachment
    rotate([90, 0, 0]) translate([extraWidth, 0, -10]) cylinder(d=3.2, h=BQLength + 20, $fn=20);
    rotate([90, 0, 0]) translate([MosquitoHolesDist+extraWidth, 0, -10]) cylinder(d=3.2, h=BQLength+20, $fn=20);

    //mosquito core
    difference()
    {
        translate([3, -BQLength, -15]) cube([30, BQLength+2, 20]);
        
        translate([0, -BQLength-13, -16]) rotate(45) cube([12, 12, 22]);
    }
    
    //bqFanHoles
    translate([10, -4, -MosquitoHeight+BQLowerDist]) rotate([0, -90, 0]) cylinder(d=2.5, h=40);
    translate([10, -4, -MosquitoHeight+BQLowerDist+BQVertDist]) rotate([0, -90, 0]) cylinder(d=2.5, h=40);
    translate([10, -4-BQHorDist, -MosquitoHeight+BQLowerDist]) rotate([0, -90, 0]) cylinder(d=2.5, h=40);
}

rotate([90, 0, 0])
    BQHolder();

translate([0, -10, 0]) mirror([0, 1, 0]) rotate([90, 0, 0])
    BQHolder();
