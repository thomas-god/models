

body_width = 20;
axle_length = body_width + 15;
axle_position = 20;


module wheel(wheel_radius = 8, wheel_thickness = 1) {
    side_sphere_radius = 15;
    hole_spacing = 2.5;
    hole_raidus = 1;
    cylinder_hole_height = wheel_radius * 2;

    difference() {
        sphere(r=wheel_radius);
        translate([0, -(side_sphere_radius + wheel_thickness/2), 0]) 
            sphere(r=side_sphere_radius);
        translate([0, +(side_sphere_radius + wheel_thickness/2), 0]) 
            sphere(r=side_sphere_radius);
        translate([hole_spacing, 0, hole_spacing])
            rotate([90, 0, 0])
            cylinder(h=cylinder_hole_height, r=hole_raidus, center=true);
        translate([-hole_spacing, 0, hole_spacing])
            rotate([90, 0, 0])
            cylinder(h=cylinder_hole_height, r=hole_raidus, center=true);
        translate([-hole_spacing, 0, -hole_spacing])
            rotate([90, 0, 0])
            cylinder(h=cylinder_hole_height, r=hole_raidus, center=true);
        translate([hole_spacing, 0, -hole_spacing])
            rotate([90, 0, 0])
            cylinder(h=cylinder_hole_height, r=hole_raidus, center=true);
    }
}

rotate([3, 0, 5]) {
// Car body
difference() {
    union() {
        cube([60, body_width ,10], center=true);
        translate([5, 0, 10]) 
            cube([30, body_width, 10], center=true);
        // Merging cubes to join the first two together
        translate([5, 0, 10 - 0.001]) 
            cube([30, body_width, 0.002], center=true);
    }
    translate([-20, 0, 5])
        cube([10, 10, 5], center=true);
        
}

// Wheels
// Operations are applied from the one closest to the object definition (create cylinder -> rotation -> translation)
wheel_dx = axle_length / 2;
translate([-axle_position, -wheel_dx, 0]) 
    rotate([0, 0, -15])
    wheel(wheel_radius = 6);
translate([-axle_position, wheel_dx, 0])
    rotate([0, 0, -15])
    wheel(wheel_radius = 6);
translate([axle_position, -wheel_dx, 0]) 
    wheel(wheel_radius = 10);
translate([axle_position, wheel_dx, 0]) 
    wheel(wheel_radius = 10);

// Wheel axles
translate([-axle_position, 0, 0]) 
    rotate([90, 0, 0]) 
    cylinder(h=axle_length, r=1, center=true);
translate([axle_position, 0, 0]) 
    rotate([90, 0, 0])
    cylinder(h=axle_length, r=1, center=true);
}