/**
 * XEnd.scad
 * 
 * Created by Diego Viejo
 * 10/may/2016
 * 
 */


Nema17Width = 43.5;
Nema17Holes = 31;

PlatformHoleSep = 20;
BeamHoleSep = 30;

Width = 85;
Length = 35;
Wall = 7;
Height = Nema17Width + Wall;

//TODO Comprobar estas medidas
threadDiam = 16;
threadHoles = 35; //distance between holes in the nut
threadWidth = 45;


XEndV();
translate([0, -Length-1, 0])
    XEndH();


module XEndVBody()
{
    cube([Width, Wall, Height]);
}

module XEndVHoles()
{
    //ZAxis housing
    translate([15, -1, 15+Wall]) rotate([-90, 0, 0])
    {
        for(i=[-1, 1]) 
            for(j=[-1, 1])
                translate([i*PlatformHoleSep/2, j*PlatformHoleSep/2,0]) 
                    cylinder(d=3.4, h=Wall+2);
    }
    
    
    //nema 17 housing
    translate([Width/2+10, -1, Height/2+Wall]) rotate([-90, 0, 0])
    {
        for(i=[-1, 1]) 
            for(j=[-1, 1])
                translate([i*(Nema17Holes/2), j*(Nema17Holes/2),0]) cylinder(d=3.4, h=Wall+2);
        cylinder(d=23, h=Height+2);
        
        hull()
        {
            cylinder(d=20, h=Height+2);
            translate([0, -40, 0]) cylinder(d=20, h=Height+2);
            translate([50, 0, 0]) cylinder(d=20, h=Height+2);
        }
    }
    
    //Horizontal part connections
    for(i=[-1, 0, 1])
        translate([Width/2-i*(Width-10)/2, -1, Wall/2]) 
            rotate([-90, 0, 0]) cylinder(d=3.4, h=Wall+2);
            
    //fancy cuts
    translate([-1, -1, Height-15]) rotate([0, -30, 0]) cube([35, Wall+2, 15]);
    translate([Width-15, -1, Height/2]) rotate([0, 45, 0]) cube([30, Wall+2, 15]);
}

module XEndV()
difference()
{
    XEndVBody();
    XEndVHoles();
}


module XEndHBody()
{
    cube([Width+10, Length, Wall]);
}

module XEndHHoles()
{
    //XAxis housing
    translate([Width+5, Length-20, -1]) cylinder(d=3.4, h=Wall+2);
    translate([Width+5-BeamHoleSep, Length-20, -1]) cylinder(d=3.4, h=Wall+2);
    
    //Beam nut attachment
    //TODO comprobar distancia entre ambos XEnds para ajustar el tamaño de la pieza
    // vertical y la posición de estos agujeros
    // El centro de cada pieza vertical de aluminio está a 15mm del borde externo
    // Distancia entre piezas verticales de aluminio: ???.?? mm
    // Distancia del primer agujero del Beam al borde: ??.?? mm
    // Longitud del Beam = 400mm
    translate([threadWidth/2, Length-Nema17Width/2, -1]) 
        cylinder(d=threadDiam, h=Wall+2);
    
    for(i=[-1, 1])
        translate([(threadWidth+i*threadHoles)/2, Length-Nema17Width/2, -1]) 
            cylinder(d=3.4, h=Wall+2);
    
    //Vertical part connections
    for(i=[-1, 0, 1])
    {
        translate([Width/2-i*(Width-10)/2, Length+1, Wall/2]) 
            rotate([90, 0, 0]) cylinder(d=3.4, h=15);
        hull()
        {
            translate([Width/2-i*(Width-10)/2, Length-3, 0]) 
                rotate([90, 30, 0]) cylinder(d=6, h=2, $fn=6);
            translate([Width/2-i*(Width-10)/2, Length-3, Wall]) 
                rotate([90, 30, 0]) cylinder(d=6, h=2, $fn=6);
        }
    }
    
}

module XEndH()
difference()
{
    XEndHBody();
    XEndHHoles();
}
