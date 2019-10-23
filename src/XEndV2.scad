/**
 * XEndV2.scad
 * 
 * Created by Diego Viejo
 * 23/oct/2019
 * 
 * This part connects X-plate with Z nut. It also serve as X-endstop holder and Z-endstop adjustment screw
 */

    
Width = 79.5;
Length = 44;
Height = 4;

XRail = 7;
endstopSeparation = 10;

threadHoles = 30; //distance between holes in the nut
threadHolesV = 15; //distance between holes in the nut (Vertical)
ThreadPos = 8.55;

//rotate([-90, 0, 0])
XEndV();

*translate([0, -15, 0])
mirror([0, 1, 0])
rotate([-90, 0, 0])
XEndV();


module XEndVBody()
union()
{
    cube([Width, Length, Height]);
    
    hull()
    {
        difference()
        {
            translate([8.6+threadHoles/2, 0, ThreadPos]) rotate([-90, 0, 0]) cylinder(d=22, h=Height);
            translate([0, -1, -Height]) cube([Width, Height+2, Height]);
        }
        cube([Width-XRail, Height, Height]);
    }
    
    //zendstop adjustment socket
    hull()
    {
        translate([8.6+threadHoles-4, 0, 0]) cube([8, Height, 12.5]);
        translate([8.6+threadHoles-4, 12.5, 0]) cube([8, Height, Height]);
    }
    
    //xend platform
    hull()
    {
        translate([Width-XRail-12, 0, 0]) cube([12, 15, 15]);
        translate([Width-XRail-17, 0, 0]) cube([15, 15, 4]);
    }

}

module XEndVHoles()
{
        
    //Z lead screw nut holes
    #translate([8.6, 21.5, -1])
        cylinder(d=3.3, h=Height+2);
    #translate([8.6, 21.5+threadHolesV, -1])
        cylinder(d=2.7, h=Height+2);
    #translate([8.6+threadHoles, 21.5+threadHolesV/2, -1]) 
        cylinder(d=2.7, h=Height+2);
        
    //thread rod
    #translate([8.6+threadHoles/2, -1, ThreadPos]) rotate([-90, 0, 0]) cylinder(d=10, h=Length+2);
    translate([8.6+threadHoles/2, -1, ThreadPos]) rotate([-90, 0, 0]) cylinder(d=11.5, h=Height+5);
    for(i=[-8, 8])
        translate([8.6+threadHoles/2+i, -1, ThreadPos]) rotate([-90, 0, 0]) 
            cylinder(d=3, h=Height+2);
    
    //zendstop adjustment socket
    #translate([8.6+threadHoles, -1, Height + 7/2])  rotate([-90, 0, 0]) cylinder(d=2.6, h=20, $fn=10);
    translate([8.6+threadHoles, -1, Height + 7/2])  rotate([-90, 0, 0]) cylinder(d=6.5, h=4, $fn=6);

    //x endstop
    for(i = [-1, 1])
    {        
        hull()
        {
            translate([Width-XRail-10, (15+i*endstopSeparation)/2, 5]) cylinder(d=1.5, h=10, $fn=10);
            translate([Width-XRail-2, (15+i*endstopSeparation)/2, 5]) cylinder(d=1.5, h=10, $fn=10);
        }
        hull()
        {
            translate([Width-XRail-10, (15+i*endstopSeparation)/2, 13]) cylinder(d1=1.5, d2=2.15, h=2.15, $fn=10);
            translate([Width-XRail-2, (15+i*endstopSeparation)/2, 13]) cylinder(d1=1.5, d2=2.15, h=2.15, $fn=10);
        }
    }

            
    //X-Motor holes
    translate([46.6, 34.5, -1]) cylinder(d=7, h=Height+2);
    #translate([77.6, 34.5, -1]) cylinder(d=3, h=Height+2);
            
    //X rail and fancy cuts
    translate([Width-XRail, -1, -1]) cube([7+1, 15+2+1, Height+2]);
    
    difference()
    {
        translate([45, 38, -1]) cube([35, 8, Height+2]);
        translate([45, 30, -1]) rotate(45) cube([10, 10, Height+2]);
    }
    *translate([Width+1, 31.5, -1]) rotate(45) cube([10, 10, Height+2]);
}

module XEndV()
difference()
{
    XEndVBody();
    XEndVHoles();
}


