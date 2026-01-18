use <parts/countersink.scad>
$fa = 1;
$fs = 0.4;

width = 100;
height = 20;
depth = 3;
radius=10;
lip_length = 5;
epsilon = 0.01;

module pipe(length, outer_radius, width, lip_length) {
    inner_radius = outer_radius - width;
    difference() {
        cylinder(h=length, r=outer_radius, center=true);
        translate([0, -outer_radius, 0]) 
            cube([outer_radius * 2, outer_radius * 2, length * 1.1], center=true);
        cylinder(h=length*1.1, r=inner_radius, center=true);
    }
    translate([outer_radius - width/2, -lip_length/2 + epsilon, 0])
        cube([width, lip_length, length], center=true);    
    translate([-(outer_radius - width/2), -lip_length/2 + epsilon, 0])
        cube([width, lip_length, length], center=true);
}

module main() {
    difference() {
        cube([width, height, depth], center=true);
        translate([width/3,0,0])
            countersink(height=depth*1.1, base_radius=1.6, top_radius =3.5);
        translate([-width/3,0,0])
            countersink(height=depth*1.1, base_radius=1.6, top_radius =3.5);
    }
    translate([0, height/2 + lip_length * 0.8, radius - depth/2 ])
    rotate([0,90,0])
        pipe(length = width, width= depth, outer_radius=radius, lip_length=lip_length);
}



main();