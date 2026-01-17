$fa = 1;
$fs = 0.4;

// Car body
cube([60, 20 ,10], center=true);
translate([5, 0, 10]) cube([30, 20, 10], center=true);
// Merging cubes to join the first two together
translate([5, 0, 10 - 0.001]) cube([30, 20, 0.002], center=true);

// Wheels
// Operations are applied from the one closest to the object definition (create cylinder -> rotation -> translation)
translate([-20, -15, 0]) rotate([90, 0, 0]) cylinder(h=3, r=8, center=true);
translate([-20, 15, 0]) rotate([90, 0, 0]) cylinder(h=3, r=8, center=true);
translate([20, -15, 0]) rotate([90, 0, 0]) cylinder(h=3, r=8, center=true);
translate([20, 15, 0]) rotate([90, 0, 0]) cylinder(h=3, r=8, center=true);

// Wheel axles
translate([-20, 0, 0]) rotate([90, 0, 0]) cylinder(h=20 + (20-15+0.001)*2 , r=1, center=true);
translate([20, 0, 0]) rotate([90, 0, 0]) cylinder(h=20 + (20-15)*2 , r=1, center=true);