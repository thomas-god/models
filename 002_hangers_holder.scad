use <parts/countersink.scad>

$fa = 1;
$fs = 0.4;
eps = 0.1;

length = 40;
width = 20;
span = 20;
depth = 5;
dx = 40;
radius = 15;
n_holes = max(1, floor(length / dx));
side_dx = (length - (n_holes-1) * dx) / 2;

module hole(length = 10, height = 5, depth = 5) {
    cube([length, height, depth], center=true);
    translate([length/2,0,0]) cylinder(h=depth, r= height/2, center=true);
    translate([-length/2,0,0]) cylinder(h=depth, r= height/2, center=true);
}

module holder() {
    difference() {
        cube([length, width, depth]);

        for ( i = [1:n_holes]) {
            translate([side_dx + (i-1)*dx, width/2, depth/2])
            hole(depth=depth*2, height=12, length=12);
           
        }
    }
}

module side() {
    rotate([-90, 0,0])
    difference() {
        cube([width, width, depth], center=true);
        countersink(height=depth*1.1, base_radius=1.6, top_radius =3.6);
    }
}

rotate([90, 0, 0]) {
    holder();
    translate([0, -3*depth/4, -span/2+depth/2]) cube([length, depth, span]);
    translate([-width/2 + eps, -depth/4, depth/2]) side();
    translate([length+width/2 - eps, -depth/4, depth/2]) side();
}