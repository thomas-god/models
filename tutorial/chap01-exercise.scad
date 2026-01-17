// Tabletop
cube([50, 50, 5], center=true);

// Legs
translate([50/2-2/2, 50/2-2/2, -50/2 - 5/2]) cylinder(h=60, r=2, center=true);
translate([-(50/2-2/2), 50/2-2/2, -50/2 - 5/2]) cylinder(h=60, r=2, center=true);
translate([50/2-2/2, -(50/2-2/2), -50/2 - 5/2]) cylinder(h=60, r=2, center=true);
translate([-(50/2-2/2), -(50/2-2/2), -50/2 - 5/2]) cylinder(h=60, r=2, center=true);