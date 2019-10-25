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

fanPlateHeight = 2.5;
fanPlateLength = 35.6;
fanPlateWidth = 19.2;
fanPlateDiam = 50;
//fanHolesDiam = 57.5; not used
ductPos = 4;
fanPosY = 15;
fanPosX = 4.5; 

module fanPlate()
difference()
{
    union()
    {
        cylinder(r=24, h=fanPlateHeight);
        
        difference()
        {
            scale([1, 25/24, 1]) cylinder(r=24, h=fanPlateHeight);
            
            translate([-50, -50, -1]) cube([100, 50, fanPlateHeight+2]);
        }

        intersection()
        {
            scale([27/25, 1, 1]) cylinder(r=25, h=fanPlateHeight);
            
            translate([-100, 0, -1]) cube([100, 50, fanPlateHeight+2]);
        }
        
        translate([-27, -fanPlateLength, 0]) cube([fanPlateWidth, fanPlateLength, fanPlateHeight]);
        rotate(45) hull()
        {
            translate([0, 30, 0]) cylinder(d=7.3, h=fanPlateHeight);
            translate([0, -27, 0]) cylinder(d=7.3, h=fanPlateHeight);
        }
    }
    
    //fan intake hole
    translate([0, 0, -1]) cylinder(d=32, h=fanPlateHeight+2);
    //fan bolts
    rotate(45)
    {
        translate([0, 30, -1]) cylinder(d=2.5, h=fanPlateHeight+2);
        translate([0, -27, -1]) cylinder(d=2.5, h=fanPlateHeight+2);
    }
    
    //duct bolt
    translate([-27+fanPlateWidth/2, -fanPlateLength+ductPos, -1]) cylinder(d=2.5, h=fanPlateHeight+2);
    
    //attachment
    translate([-27+fanPosX, -fanPlateLength+fanPosY, -1]) 
        cylinder(d1=3, d2=6.5, h=fanPlateHeight+1.1, $fn=20);
    translate([-27+fanPosX+BQHorDist, -fanPlateLength+fanPosY, -1]) 
        cylinder(d1=2.8, d2=6.5, h=fanPlateHeight+1.1, $fn=20);
    translate([-27+fanPosX, -fanPlateLength+fanPosY+BQVertDist, -1]) 
        cylinder(d1=3, d2=6.5, h=fanPlateHeight+1.1, $fn=20);
    
    
}

*translate([0, 5, BQLength+5]) rotate([90, 0, 0])
    BQHolder();

*translate([0, -5, BQLength+5]) mirror([0, 1, 0]) rotate([90, 0, 0])
    BQHolder();

*translate([fanPlateDiam, 25.5, 0]) rotate(180) fanPlate();
translate([fanPlateDiam, -25.5, 0]) mirror([1, 0, 0]) 
    fanPlate();
