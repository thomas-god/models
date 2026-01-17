table_width = 40;
table_depth = 60;
table_height = 3;
leg_height = 30;
leg_radius = 2;

// Tabletop
cube([table_width, table_depth, table_height], center=true);


// Legs
leg_dx = table_width / 2 - leg_radius / 2;
leg_dy = table_depth / 2 - leg_radius / 2;
leg_dz = leg_height / 2 - table_height / 2;
translate([leg_dx, leg_dy, -leg_dz])
    cylinder(h=leg_height, r=leg_radius, center=true);
translate([leg_dx, -leg_dy, -leg_dz]) 
    cylinder(h=leg_height, r=leg_radius, center=true);
translate([-leg_dx, leg_dy, -leg_dz]) 
    cylinder(h=leg_height, r=leg_radius, center=true);
translate([-leg_dx, -leg_dy, -leg_dz]) 
    cylinder(h=leg_height, r=leg_radius, center=true);