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

XPlate();

//visual guides
%translate([-35, XPlateBelt1-beltWidth/2, -beltHeight]) cube([100, beltWidth, beltHeight]);
%translate([-35, XPlateBelt2-beltWidth/2, -beltHeight]) cube([100, beltWidth, beltHeight]);
%translate([-35, XPlateBelt1-beltWidth/2, XMotorPulleyDiam]) cube([100, beltWidth, beltHeight]);
%translate([-35, XPlateBelt2-beltWidth/2, XMotorPulleyDiam]) cube([100, beltWidth, beltHeight]);

*translate([Width+5, 0, 0]) XPlate();

*translate([-15, 0, 0])
    topArm();
*translate([-27, 0, 0])
    topArm();
*translate([-39, 0, 0])
    topArm(clip=38, clear=23);
*translate([-51, 0, 0])
    topArm(clip=38, clear=23);

module XPlate(l = XPlateBelt1)
difference()
{
    cube([Width, l+beltWidth/2, Height]);
    
    //Extruder attachment
    for(i=[-1, 1])
    {
        translate([i*XPlateHoleDist + Width/2, -1, XPlateHeight/2]) rotate([-90, 0, 0]) cylinder(d=3.2, h=25, $fn=16);
        
        hull()
        {
            translate([i*XPlateHoleDist + Width/2, 2, XPlateHeight/2+0.5]) rotate([-90, 30, 0]) cylinder(d=6.7, h=2.5, $fn=6);
            translate([i*XPlateHoleDist + Width/2, 2, -5]) rotate([-90, 30, 0]) cylinder(d=6.7, h=2.5, $fn=6);
        }
    }
    
    //belt housing
    difference()
    {
        translate([(Width-8-XMotorPulleyDiam)/2, XPlateBelt1-beltWidth/2, -1])
            cube([8+XMotorPulleyDiam, beltWidth+1, Height+2]);
        
        translate([(Width-8-XMotorPulleyDiam)/2, -1, XMotorPulleyDiam/2]) rotate([-90, 0, 0])
            cylinder(d=XMotorPulleyDiam, h=XPlateLength+2);
        translate([(Width+8+XMotorPulleyDiam)/2, -1, XMotorPulleyDiam/2]) rotate([-90, 0, 0])
            cylinder(d=XMotorPulleyDiam, h=XPlateLength+2);
    }
    
}


module topArm(clip = 23, clear=38)
difference()
{
    cube([topWidth, XPlateLength, topHeight]);
    
    translate([topWidth/2, 10, -1]) cylinder(d=3, h=topHeight+2, $fn=15);
    translate([topWidth/2, 10, -0.1]) cylinder(d1=6.5, d2=3, h=2.2, $fn=15);
    translate([topWidth/2, XPlateLength-3, -1]) cylinder(d=3, h=topHeight+2, $fn=15);
    translate([topWidth/2, XPlateLength-3, -0.1]) cylinder(d1=6.5, d2=3, h=2.2, $fn=15);
    
    //clip
    translate([-1, clip, topHeight-0.7]) cube([topWidth+2, beltWidth, 2]);
    for ( i = [-1 : 4] )
    {
        translate([i*belt_tooth_distance, clip, topHeight-1.5]) 
            cube([belt_tooth_distance-belt_tooth_ratio, beltWidth,2]);
 }
    
    //clearance
    translate([-1, clear, topHeight-beltHeight]) cube([topWidth+2, beltWidth, beltHeight+1]);
}