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


    
totalWidth = 467.5;
beamWidth = 400;
    
Nema17Width = 42.3; //3.5;
Nema17Holes = 31;

PlatformHoleSep = 20;
BeamHoleSep = 25;
BeamLength = 12.2;

Width = 90;
Length = 13;
Wall = 7;
Floor = 9;
Height = Nema17Width + Floor + 0;
motorAngle = 0; //27.5;

threadDiam = 13;
threadHoles = 30; //distance between holes in the nut
threadHolesV = 15; //distance between holes in the nut (Vertical)
threadWidth = 48;
threadLength = 17.15;
ThreadHeight = 30.2;
ThreadPos = 29.3 - 13 - threadLength/2;

//rotate([-90, 0, 0])
XEndV();

*translate([0, -15, 0])
mirror([0, 1, 0])
rotate([-90, 0, 0])
XEndV();

*color("red")
translate([Width-15, -Length+5-27/2, Floor]) cube([48,27,16]);

module XEndVBody()
union()
{
    cube([Width, Wall, Height]);
    translate([-10, -ThreadPos+Wall, 0]) 
        cube([threadWidth+2, ThreadPos, ThreadHeight]);
    *translate([threadWidth-10, -Length, -5]) 
        cube([Width-threadWidth+10, Length+Wall, Floor+5]);
    translate([-10, -Length, -5]) 
        cube([Width+10, Length+Wall, Floor+5]);
    
    difference()
    {
        translate([threadWidth-10, -Length, 0]) 
            cube([8, Length+Wall, 25]);
        translate([threadWidth-11, -Length, 25]) rotate([0, 90, 0])
            cylinder(d=32, h=10, $fn=4);
    }
}

module XEndVHoles()
{
    //ZAxis housing
    translate([15, -25, 17+Floor]) rotate([-90, 0, 0])
    {
        for(i=[-1, 1]) 
            for(j=[-1, 1])
                translate([i*PlatformHoleSep/2, j*PlatformHoleSep/2,0]) 
                    cylinder(d=3.4, h=Height+2);
    }
    translate([15, -Nema17Width/2-1, 17+Floor]) rotate([-90, 0, 0])
    {
        for(i=[-1, 1]) 
            for(j=[-1, 1])
                translate([i*PlatformHoleSep/2, j*PlatformHoleSep/2,0]) 
                    cylinder(d=6, h=Nema17Width/2+3);
    }
    
    
    //nema 17 housing
    translate([Width/2+7, -30, Height-20]) rotate([-90, 0, 0])
//        translate([-Nema17Holes/2, Nema17Holes/2, 0]) 
//            rotate(motorAngle) 
//                translate([Nema17Holes/2, -Nema17Holes/2, 0])
    {
        for(i=[-1, 1]) 
            for(j=[-1, 1])
                translate([i*(Nema17Holes/2), j*(Nema17Holes/2),0]) cylinder(d=3.4, h=Height+2);
        cylinder(d=23, h=Height+2);
        
        translate([Nema17Holes/2, Nema17Holes/2,30-Length-1]) cylinder(d=6, h=Length+4);
        translate([-Nema17Holes/2, Nema17Holes/2,30-Length-1]) cylinder(d=6, h=Length+4);

            hull()
            {
                cylinder(d=20, h=Height+2);
                translate([0, -35, 0]) cylinder(d=20, h=Height+2);
                translate([55, 5, 0]) cylinder(d=20, h=Height+2);
                translate([60, -10, 0]) cylinder(d=20, h=Height+2);
            }

    }
    
    //Thread nut holes
    //TODO adapt this to L and R sides. Now is for R
    translate([(threadWidth+threadHoles)/2-10, Wall+1, ThreadHeight/2]) rotate([90, 0, 0])
        cylinder(d=2.7, h=Height);

    translate([(threadWidth-threadHoles)/2-10, Wall+1, (ThreadHeight-threadHolesV)/2]) rotate([90, 0, 0])
        cylinder(d=2.7, h=Height);

    translate([(threadWidth-threadHoles)/2-10, Wall+1, (ThreadHeight+threadHolesV)/2]) rotate([90, 0, 0])
        cylinder(d=2.7, h=Height);
        
    translate([-10-1, -ThreadPos+Wall-30, 0]) cube([threadWidth+1, 30,ThreadHeight]);
    hull()
    {
        translate([threadWidth-10-2, -Length-2 ,-10]) cube([2, 2, 20]);
        translate([-10-1, -ThreadPos+Wall-Length-2 ,-10]) cube([(threadWidth+10-2)/2, Length+2, 20]);
    }
    

    //XAxis housing
    #translate([15+(totalWidth-beamWidth)/2+12.5, 20, -5+(Floor+5)/2]) //-5+(Floor+5)/2 = 2
        rotate([90, 0, 0]) cylinder(d=3.0, h=50); 
    translate([15+(totalWidth-beamWidth)/2+12.5+BeamHoleSep, 20, -5+(Floor+5)/2]) 
        rotate([90, 0, 0]) cylinder(d=3.0, h=50);
    
    translate([15+(totalWidth-beamWidth)/2-0.25, -1-Length-BeamLength/2, -10]) cube([Width, BeamLength, 33]);

    //fancy cuts
    translate([-1, -1, Height-15]) rotate([0, -30, 0]) cube([35, Wall+2, 15]);
    translate([Width-35, -1, Height/2]) cube([25, Wall+2, Height]);
}

module XEndV()
difference()
{
    XEndVBody();
    XEndVHoles();
}


