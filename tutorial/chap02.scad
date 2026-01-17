$fa = 1;
$fs = 0.4;

body_width = 20;
wheel_radius = 7;
wheel_width = 2;
axle_length = body_width + 10;
axle_position = 20;

// Car body
rotate([3, 0, 5]) {
    cube([60, body_width ,10], center=true);
translate([5, 0, 10]) 
    cube([30, body_width, 10], center=true);
// Merging cubes to join the first two together
translate([5, 0, 10 - 0.001]) 
    cube([30, body_width, 0.002], center=true);


// Wheels
// Operations are applied from the one closest to the object definition (create cylinder -> rotation -> translation)
wheel_dx = axle_length / 2;
translate([-axle_position, -wheel_dx, 0]) 
    rotate([90, 0, -20]) 
    cylinder(h=wheel_width, r=wheel_radius, center=true);
translate([-axle_position, wheel_dx, 0]) 
    rotate([90, 0, -20]) 
    cylinder(h=wheel_width, r=wheel_radius, center=true);
translate([axle_position, -wheel_dx, 0]) 
    rotate([90, 0, 0]) 
    cylinder(h=wheel_width, r=wheel_radius, center=true);
translate([axle_position, wheel_dx, 0]) 
    rotate([90, 0, 0]) 
    cylinder(h=wheel_width, r=wheel_radius, center=true);

// Wheel axles
translate([-axle_position, 0, 0]) 
    rotate([90, 0, 0]) 
    cylinder(h=axle_length, r=1, center=true);
translate([axle_position, 0, 0]) 
    rotate([90, 0, 0])
    cylinder(h=axle_length, r=1, center=true);
}