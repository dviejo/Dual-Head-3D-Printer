/**
 * XEnd.scad
 * 
 * Created by Diego Viejo
 * 10/may/2016
 * 
 */


    //TODO comprobar distancia entre ambos XEnds para ajustar el tamaño de la pieza
    // vertical y la posición de estos agujeros
    // El centro de cada pieza vertical de aluminio está a 15mm del borde externo
    // Distancia entre piezas verticales de aluminio: 467.5 mm
    // Distancia del primer agujero del Beam al borde: 12.5 mm
    // Longitud del Beam = 400mm


Nema17Width = 42.3; //3.5;
Nema17Holes = 31;

PlatformHoleSep = 20;
BeamHoleSep = 25;

Width = 90;
Length = 25;
Wall = 6;
Floor = 9;
Height = Nema17Width + Floor;

//TODO Comprobar estas medidas
threadDiam = 13;
threadHoles = 30; //distance between holes in the nut
threadHolesV = 15; //distance between holes in the nut (Vertical)
threadWidth = 48;
threadLength = 17.15;
ThreadHeight = 30.2;
ThreadPos = 29.3 - 13;

rotate([-90, 0, 0])
XEndV();

translate([0, -10, 0])
mirror([0, 1, 0])
rotate([-90, 0, 0])
XEndV();

module XEndVBody()
union()
{
    cube([Width, Wall, Height]);
    translate([-10, -ThreadPos, 0]) 
        cube([threadWidth+2, ThreadPos+Wall, ThreadHeight]);
    translate([0, -ThreadPos, 0]) 
        cube([Width+2, ThreadPos+Wall, Floor]);
}

module XEndVHoles()
{
    //ZAxis housing
    translate([15, -25, 15+Floor]) rotate([-90, 0, 0])
    {
        for(i=[-1, 1]) 
            for(j=[-1, 1])
                translate([i*PlatformHoleSep/2, j*PlatformHoleSep/2,0]) 
                    cylinder(d=3.4, h=Height+2);
    }
    translate([15, -Nema17Width/2-1, 15+Floor]) rotate([-90, 0, 0])
    {
        for(i=[-1, 1]) 
            for(j=[-1, 1])
                translate([i*PlatformHoleSep/2, j*PlatformHoleSep/2,0]) 
                    cylinder(d=6, h=Nema17Width/2+1);
    }
    
    
    //nema 17 housing
    translate([Width/2+7, -30, Height-20]) rotate([-90, 0, 0])
    {
        for(i=[-1, 1]) 
            for(j=[-1, 1])
                translate([i*(Nema17Holes/2), j*(Nema17Holes/2),0]) cylinder(d=3.4, h=Height+2);
        cylinder(d=23, h=Height+2);
        
        translate([Nema17Holes/2, Nema17Holes/2,30-Length-1]) cylinder(d=6, h=Length+1);
        translate([-Nema17Holes/2, Nema17Holes/2,30-Length-1]) cylinder(d=6, h=Length+1);
    }
    difference()
    {
        translate([Width/2+7, -30, Height-20]) rotate([-90, 0, 0])
            hull()
            {
                cylinder(d=20, h=Height+2);
                translate([0, 20, 0]) cylinder(d=20, h=Height+2);
                translate([50, 0, 0]) cylinder(d=20, h=Height+2);
                translate([60, 20, 0]) cylinder(d=20, h=Height+2);
            }
        translate([-1, -Length-1, -1]) cube([Width+1+17, Length+Wall+1, Floor+1]);
    }
    
    //Thread nut holes
    translate([(threadWidth-threadHoles)/2-10, Wall+1, ThreadHeight/2]) rotate([90, 0, 0])
        cylinder(d=3.0, h=Height);
    translate([(threadWidth+threadHoles)/2-10, Wall+1, (ThreadHeight-threadHolesV)/2]) rotate([90, 0, 0])
        cylinder(d=3.0, h=Height);
    translate([(threadWidth+threadHoles)/2-10, Wall+1, (ThreadHeight+threadHolesV)/2]) rotate([90, 0, 0])
        cylinder(d=3.0, h=Height);
    

    //XAxis housing
    translate([15+(467.5-400)/2+12.5, -(Length-Wall)/2, -1]) cylinder(d=3.0, h=Floor+2); 
    translate([15+(467.5-400)/2+12.5+BeamHoleSep, -(Length-Wall)/2, -1]) cylinder(d=3.0, h=Floor+2);
    translate([15+(467.5-400)/2+12.5, -(Length-Wall)/2, -1]) cylinder(d=6.2, h=3, $fn=6); 
    translate([15+(467.5-400)/2+12.5+BeamHoleSep, -(Length-Wall)/2, -1]) cylinder(d=6.2, h=3, $fn=6);

    //fancy cuts
    translate([-1, -1, Height-15]) rotate([0, -30, 0]) cube([35, Wall+2, 15]);
    translate([Width-18, -1, Height/2]) cube([25, Wall+2, 30]);
}

module XEndV()
difference()
{
    XEndVBody();
    XEndVHoles();
}


