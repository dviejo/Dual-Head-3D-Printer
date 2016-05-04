/**
 * YPlateSide.scad
 * 
 * Created by Diego Viejo
 * 04/May/2016
 * 
 */

//SC10UU dimmensions
SCWidth = 40;
SCHoleX = 21;
SCLength = 35 + 2;
SCHoleY = 28;
SCHoleDiam = 5 + 0.5;


Width = SCWidth;
Length = SCLength+20;
Height = 6;


mainBlock();

module mainBlock()
difference()
{
    cube([Width, Length, Height]);
    
    for(i = [-1, 1]) for(j = [-1, 1])
        translate([(SCWidth+i*SCHoleX)/2, (SCLength+j*SCHoleY)/2, -1]) cylinder(d=SCHoleDiam, h=Height+2);
    
    translate([Width/2, Length-5, -1]) cylinder(d=3.3, h=Height+2, $fn=15);
    translate([Width/2, Length-5, Height-2]) cylinder(d=5.5, h=Height+2, $fn=6);
    
}