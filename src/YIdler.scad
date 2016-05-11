/**
 * 
 * YIdler.scad
 * 
 * Created by Diego Viejo
 * 
 * 04/May/2016
 * 
 */



Width = 60;
Length = 24;
Height = 6;

Wall = 16;
Floor = 6;
mainDiam = 20;

IdlerDiam = 16;

beltWidth = 7.5;

YIdler();

module YIdler()
difference()
{
    cube([Width, Length, 20]);
    
    translate([Wall+mainDiam/2, -1, Floor+mainDiam/2])
    hull()
    {
        rotate([-90, 0, 0]) cylinder(d=mainDiam, h=Length+2);
        translate([0, 0, 30]) rotate([-90, 0, 0]) cylinder(d=mainDiam, h=Length+2);
        translate([50, 0, 0]) rotate([-90, 0, 0]) cylinder(d=mainDiam, h=Length+2);
    }
    
    translate([8, (Length-beltWidth)/2, -1]) cube([Width, beltWidth, 40]);
    
    translate([9.1, -1, 8]) rotate([-90, 0, 0]) cylinder(d=4, h=Length+2);
    translate([9.1, -1, 8]) rotate([-90, 0, 0]) cylinder(d=8, h=2);

    hull()
    {
        translate([9.1, 5, 8]) rotate([-90, 0, 0]) cylinder(d=18, h=Length-10, $fn=20);
        translate([19, 5, 19]) rotate([-90, 0, 0]) cylinder(d=18, h=Length-10, $fn=20);
    }
    
    hull()
    {
        translate([Width/2, 4, -1]) cylinder(d=5.5, h=10, $fn=15);
        translate([Width-5, 4, -1]) cylinder(d=5.5, h=10, $fn=15);
    }
    hull()
    {
        translate([Width/2, Length - 4, -1]) cylinder(d=5.5, h=10, $fn=15);
        translate([Width-5, Length - 4, -1]) cylinder(d=5.5, h=10, $fn=15);
    }
}