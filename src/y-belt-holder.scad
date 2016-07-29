// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// Modified by Diego Viejo

//GT2 there is bunch of GT2 belts with different tooth-to-tooth distance
//adjust to your needs
belt_tooth_distance = 2;
belt_tooth_ratio = 0.8; //0.675//0.5;

beltDepth = 28-19;

module belt_holder_base(){
 translate([-23-8.5,0,-1]) cube([23,15,16]); 
 translate([-23-8.5,11,-1]) cube([23,17,16]);
 translate([-40,24,-1]) cube([40,4,16]);	
}

module belt_holder_beltcut(){
 position_tweak=-0.2;
 // Belt slit
 translate([-66,-0.5+beltDepth,4]) cube([67,0.8,15]);
 // Smooth insert cutout
 translate([-66,-0.5+beltDepth,12]) rotate([45,0,0]) cube([67,15,15]);
 // Individual teeth
 for ( i = [0 : 23] ){
  translate([0-i*belt_tooth_distance+position_tweak,-0.5+beltDepth-1.5,4]) 
    cube([belt_tooth_distance-belt_tooth_ratio,2.3,15]);
 }
 // Middle opening
 translate([-2-20,-1,4]) cube([4,11,15]);	
}

module belt_holder_holes(){
 translate([-4.65,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
 translate([-40+4.65,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
}

// Final part
module belt_holder(){
 difference(){
  belt_holder_base();
  belt_holder_beltcut();
  belt_holder_holes();
 }
}

belt_holder();