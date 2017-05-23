/*
 * XPlate.scad
 * 
 * Created by Diego Viejo
 * 
 * 28/Jun/2016
 * 
 */

include<./extruderCommons.scad>

Height = 22;
Width = 38;


beltWidth = 7;
beltHeight = 4;
belt_tooth_distance = 2;
belt_tooth_ratio = 0.8;

topWidth = 9;
topHeight = 8;

XPlate(l=XPlateBelt1);
translate([-Width-10, 0, 0])
XPlate(l=XPlateBelt2);

//visual guides
*%translate([-35, XPlateBelt1-beltWidth/2, -beltHeight]) cube([100, beltWidth, beltHeight]);
*%translate([-35, XPlateBelt2-beltWidth/2, -beltHeight]) cube([100, beltWidth, beltHeight]);
*%translate([-35, XPlateBelt1-beltWidth/2, XMotorPulleyDiam]) cube([100, beltWidth, beltHeight]);
*%translate([-35, XPlateBelt2-beltWidth/2, XMotorPulleyDiam]) cube([100, beltWidth, beltHeight]);

*translate([Width+5, 0, 0]) XPlate();


module XPlate(l = XPlateBelt1)
rotate([90, 0, 0])
difference()
{
    cube([Width, l+beltWidth/2, Height]);
    
    //Extruder attachment
    for(i=[-1, 1])
    {
        translate([i*XPlateHoleDist + Width/2, -1, XPlateHeight/2]) rotate([-90, 0, 0]) 
            cylinder(d=3.2, h= 4, $fn=16);
        
        hull()
        {
            translate([i*XPlateHoleDist + Width/2, 2, XPlateHeight/2+0.5]) rotate([-90, 30, 0]) cylinder(d=6.7, h=2.5, $fn=6);
            translate([i*XPlateHoleDist + Width/2, 2, -5]) rotate([-90, 30, 0]) cylinder(d=6.7, h=2.5, $fn=6);
        }
    }
    
    //belt housing
    difference()
    {
        translate([(Width-4-XMotorPulleyDiam)/2, l-beltWidth/2, -1])
            cube([4+XMotorPulleyDiam, beltWidth+1, Height+2]);
        
        translate([(Width-6-XMotorPulleyDiam)/2, -1, XMotorPulleyDiam/2]) rotate([-90, 0, 0])
            cylinder(d=XMotorPulleyDiam, h=XPlateLength+2);
        translate([(Width+6+XMotorPulleyDiam)/2, -1, XMotorPulleyDiam/2]) rotate([-90, 0, 0])
            cylinder(d=XMotorPulleyDiam, h=XPlateLength+2);
    }
    //belt teeth
    translate([-1, l-beltWidth/2, XMotorPulleyDiam]) cube([Width+2, beltWidth+1, 0.7]);
    translate([-1, l+beltWidth/2, XMotorPulleyDiam]) rotate([60,0,0]) cube([Width+2, 2.5, 1]);
    for(i=[1:25])
    {
        translate([-3+i*belt_tooth_distance,l-beltWidth/2,XMotorPulleyDiam]) 
            cube([belt_tooth_distance-belt_tooth_ratio,beltWidth+1,2.5]);

    }
    
    //tensor bolts
    translate([-1, l, XMotorPulleyDiam/2]) rotate([0, 90, 0]) cylinder(d=3.3, h=Width/2, $fn=15);
    translate([Width/2-6.5, l, XMotorPulleyDiam/2]) rotate([0, 90, 0]) cylinder(d=7, h=6.5, $fn=25);
    translate([Width/2-9, l, XMotorPulleyDiam/2]) rotate([0, 90, 0]) cylinder(d=6.7, h=9, $fn=6);
    
}

