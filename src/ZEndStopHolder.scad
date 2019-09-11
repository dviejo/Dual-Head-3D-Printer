/**
 *
 * Created by Diego Viejo
 * 08/Septembre/2019
 * 
 * ZEndStopHolder
 * 
 */

Width = 14;
Height = 15;

Length1 = 37;
Length = 65;

difference()
{
    cube([Width, Length, Height]);
    
    hull()
    {
        translate([-1, -1, -1]) cube([Width-4+1, Length1-20+1, Height+2]);
        translate([-30,Length1-15, -1]) cube([30, 10, Height+2]);
    }
    
    hull()
    {
        translate([4, Length1-5, -1]) cube([Width, Length, Height+2]);
        translate([Width, Length1-20, -1]) cube([20, 20, Height+2]);
    }
    
    //T-Slot M5 holes
    translate([-1, Length1, Height/2]) rotate([0, 90, 0]) cylinder(d=5, h=20);
    translate([-1, Length1+20, Height/2]) rotate([0, 90, 0]) cylinder(d=5, h=20);
    
    //Mechanical endstop
    translate([-1, 3, Height-3]) rotate([0, 90, 0]) cylinder(d=1.75, h=20);
    translate([-1, 3+10, Height-3]) rotate([0, 90, 0]) cylinder(d=1.75, h=20);
    
}
