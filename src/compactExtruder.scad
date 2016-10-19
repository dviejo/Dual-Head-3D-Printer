/**
 * DViejosCompactExtruder
 * 
 * created by Diego Viejo
 * 
 * Bill Of Materials
 * 
 * 2 m3x16 bolts (hotend)- check
 * 2 m3 nuts
 * 2 m3x20 bolts (xcarriage) - check
 * 2 m3x12 bolts (stepper) - check
 * 2 m3x30 bolts (stepper) - check
 * 1 m3x10 bolt (idler) - check
 * 8 m3 washers
 * 
 * 1 nema 17 stepper (high current + high torque recommended)
 * 1 5mm ID tracker pulley. MK7 or MK8(recommended)
 * 2 springs 10mm OD
 * 
 * Important! Remember to adjust tracker pulley and filament widths in
 * extruderCommons.scad file to fit your needs. Constants trackerDiam and filament_d.
 */

include<./extruderCommons.scad>
include<./idler.scad>

carriagePos = -4.5;



module DViejosCompactExtruder()
{
  difference()
  {
    union()
    {
      base("add");
      
      translate([-trackerDiam/2 - AjusteNozzle+2, 5, -baseHeight - mainHeight/2-offset])
	hull()
	{
	  for(i = [-1, 1])
	  {
	    for(j = [-1, 0])
	    {
	      translate([i*15.5, j*20, 0]) cylinder(r=5, h=baseHeight + mainHeight/2 + offset + diam/2 + 2 - 0.6);
	      
	    }
	  }
	}
    //lower plate
      translate([-trackerDiam/2 - AjusteNozzle+2, 5, -baseHeight - mainHeight/2-offset])
	hull()
	{
	  for(i = [-1, 1])
	  {
	    for(j = [-1, 0])
	    {
	      translate([i*15.5, j*30, 0]) cylinder(r=5, h=10);
	      
	    }
	  }
	}
    }
    
    
    translate([0, carriagePos-4.5, 0]) rotate([-90, 0, 0]) extruderMount();
    
    base("remove");
    
    //xcarriage holes
    for(i=[-1, 1]) for(j=[0, 1])
    {
      translate([i*10.75, carriagePos-j*20, -25]) cylinder(d=5.5, h=50);
      translate([i*10.75, carriagePos-j*20, baseHeight - mainHeight/2 - offset - 5]) cylinder(d=9, h=50);
    }
  }
}

DViejosCompactExtruder();
translate([-45, 10, mountB_H3+0.25+2]) rotate([-90, 0, 90])  //uncomment this for printing, comment for modeling
    extruderMountB();
translate([42, 25, -baseHeight - mainHeight/2-offset]) rotate(210) idler();