/*
 * XPlate.scad
 * 
 * Created by Diego Viejo
 * 
 * 28/Jun/2016
 * 
 */

Height = 3.5;
extraH = 2.5;
Width = 38;
Length = 40+11;

beltWidth = 7.5;
beltHeight = 4;
belt_tooth_distance = 2;
belt_tooth_ratio = 0.8;

topWidth = 9;
topHeight = 8;

leftFront();
translate([Width+5, 0, 0]) leftFront();

translate([-15, 0, 0])
    topArm();
translate([-27, 0, 0])
    topArm();
translate([-39, 0, 0])
    topArm(clip=38, clear=23);
translate([-51, 0, 0])
    topArm(clip=38, clear=23);

module leftFront()
difference()
{
    union()
    {
        cube([Width, Length, Height]);
        for(i=[0, 20]) for(j=[0, 20])
            translate([9+i, 10+j, 0]) cylinder(d=5, h=Height+extraH, $fn=25);
    }
    
    for(i=[0, 20]) for(j=[0, 20])
        translate([9+i, 10+j, -1]) cylinder(d=3, h=Height+extraH+2, $fn=15);
    
    for(i=[0, 20])
    {
        translate([9+i, Length-6/2, -1]) cylinder(d=3, h=Height+extraH+2, $fn=15);
        translate([9+i, Length-6/2, Height-2]) cylinder(d=6, h=4, $fn=6);
        translate([9+i, 10+20, -0.2]) cylinder(d1=6.3, d2=3, h=2.2, $fn=15);
    }
}


module topArm(clip = 23, clear=38)
difference()
{
    cube([topWidth, Length, topHeight]);
    
    translate([topWidth/2, 10, -1]) cylinder(d=3, h=topHeight+2, $fn=15);
    translate([topWidth/2, 10, -0.2]) cylinder(d1=6, d2=3, h=2.2, $fn=15);
    translate([topWidth/2, Length-3, -1]) cylinder(d=3, h=topHeight+2, $fn=15);
    translate([topWidth/2, Length-3, -0.2]) cylinder(d1=6, d2=3, h=2.2, $fn=15);
    
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