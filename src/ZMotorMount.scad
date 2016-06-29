/**
 * ZMotorMount.scad
 * 
 * Created by Diego Viejo
 * 
 * 11/May/2016
 * 
 */

Floor = 5;
Width = 42.3 + 5 + 5;
Wall = 8;
Length = 42.3 + Wall + 20;
Height = 40;
MotorPos = 20 + 29.3;

Nema17Holes = 31;

ZMotor();
translate([-10, 0, 0]) mirror([1, 0, 0]) 
ZMotor();


module ZMotor()
difference()
{
    union()
    {
        cube([Width, Length, Floor]);
        cube([Width, Wall+20, Height]); 
        
        translate([0, 20, 0])
        hull()
        {
            cube([5, Wall, Floor]);
            translate([0, Wall+25, 0]) cube([5, Wall, Floor]);
            translate([0, 0, 25]) cube([5, Wall, Floor]);
        }
        translate([Width-5, 20, 0])
        hull()
        {
            cube([5, Wall, Floor]);
            translate([0, Wall+25, 0]) cube([5, Wall, Floor]);
            translate([0, 0, 25]) cube([5, Wall, Floor]);
        }
    }
    
    translate([(Width-20.5)/2, -1, -1]) cube([20.5, 20.5+1, Height+2]);
    
    translate([-1, 10, 10]) rotate([0, 90, 0]) cylinder(d=5.5, h=Width+2);
    translate([-1, 10, Height-10]) rotate([0, 90, 0]) cylinder(d=5.5, h=Width+2);
    
    //Motor's holes
    for(i=[-1, 1]) for(j=[-1, 1])
        hull()
        {
            translate([(Width+i*Nema17Holes)/2-1.5, MotorPos+(j*Nema17Holes)/2, -1]) cylinder(d=3.4, h=Floor+2);
            translate([(Width+i*Nema17Holes)/2+1.5, MotorPos+(j*Nema17Holes)/2, -1]) cylinder(d=3.4, h=Floor+2);
        }
    translate([Width/2, MotorPos, -1]) cylinder(d=27, h=Floor+2);
    
    for(i=[0, 1]) for(j=[0, 1])
        translate([i*Width, j*Length, -1]) rotate(0) cylinder(d=7, h=Height+2, $fn=4);
    
    translate([(Width-20.5)/2, 0, -1]) rotate(0) cylinder(d=4, h=Height+2, $fn=4);
    translate([(Width+20.5)/2, 0, -1]) rotate(0) cylinder(d=4, h=Height+2, $fn=4);
    
}
