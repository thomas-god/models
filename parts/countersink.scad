module countersink(base_radius = 2, top_radius = 1.6, height = 2) {
    scale_ration = top_radius / base_radius;
    linear_extrude(height,center=true, scale=scale_ration) {
        circle(base_radius);
    }
}

countersink();