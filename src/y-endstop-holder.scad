/**
 * Y-EndStop-Holder.scad
 *
 * Created by Diego Viejo
 * 29-July-2019
 *
 */

 
Width = 18;
Length = 27;
Height = 12;

difference()
{
    cube([Width, Length, Height]);
    
    translate([8, -Length+20, -1]) cube([Width, Length, Height+2]);
    translate([-1, -1, 6]) cube([Width+2, 20+1, Height]);
    
    translate([2, 2, -1]) cylinder(d=1.5, h=Height+2, $fn=20);
    translate([2, 12, -1]) cylinder(d=1.5, h=Height+2, $fn=20);

    translate([3, Length-3, -1]) cylinder(d=3, h=Height+2, $fn=20);
    translate([12+3, Length-3, -1]) cylinder(d=3, h=Height+2, $fn=20);
}
