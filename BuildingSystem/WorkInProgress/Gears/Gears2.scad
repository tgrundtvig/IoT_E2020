use <Shapes.scad>;

//RackTooth2D(2, 8, 20, 60, 1, 0);
//tooth_cutter(2, 8, 20, 60, 1, 0);
half_tooth_2D_show(8, 20, 70, 4, 32, 0, 10);

module RackTooth2D(base_height, tooth_height, pitch, angle, clearance, fitting)
{
    climb_width = tooth_height / tan(angle);
    flat_width = 0.5*(pitch-2*climb_width);
    d=clearance/tan(angle); 
    points =
    [
        [0, 0],
        [0, base_height + tooth_height - fitting],
        [0.5*flat_width-fitting, base_height + tooth_height - fitting],
        [0.5*flat_width+climb_width+d-fitting, base_height - clearance],
        [1.5*flat_width+climb_width-d-fitting, base_height - clearance],
        [1.5*flat_width + 2* climb_width + fitting, base_height + tooth_height - fitting],
        [pitch ,base_height + tooth_height - fitting],
        [pitch, 0]
    ];
    
    translate([-0.5*pitch,-(base_height+0.5*tooth_height)])
    polygon(points);
}




module tooth_cutter(base_height, tooth_height, pitch, angle, clearance, fitting)
{
    climb_width = tooth_height / tan(angle);
    flat_width = 0.5*(pitch-2*climb_width);
    d=clearance/tan(angle); 
    points =
    [
        [0, 0],
        [0, base_height + tooth_height - fitting],
        [0.5*flat_width-fitting, base_height + tooth_height - fitting],
        [0.5*flat_width+climb_width+d-fitting, base_height - clearance],
        [0.5*pitch, base_height - clearance],
        [0.5*pitch, 0]
    ];
    
    translate([-0.5*pitch,-(base_height+0.5*tooth_height)])
    polygon(points);
}

module tooth_2D(tooth_height, pitch, angle, clearance, total_teeth, fitting, resolution)
{
}

module half_tooth_2D(tooth_height, pitch, angle, clearance, total_teeth, fitting, resolution)
{
    r1 = total_teeth * pitch / (2*PI);
    r2 = r1 + 0.5*tooth_height+clearance;
    dAngle = 360/total_teeth;
    difference()
    {
        
        intersection()
        {
            Pie2D(r2, 270-0.5*dAngle, 270, 10);
            translate([0,-0.5*r2])
            square([pitch,r2], center = true);
        }
        translate([0,-r1])
        tooth_cutter(5, tooth_height, pitch, angle, clearance, fitting);
        
        for(i=[0:resolution])
        {
            translate([-i*(pitch/resolution),-2*r1])
            rotate(-i*(dAngle/resolution))
            translate([0, r1])
            tooth_cutter(5, tooth_height, pitch, angle, clearance, fitting);
        }
    }
    
}

module half_tooth_2D_show(tooth_height, pitch, angle, clearance, total_teeth, fitting, resolution)
{
    r1 = total_teeth * pitch / (2*PI);
    r2 = r1 + 0.5*tooth_height+clearance;
    dAngle = 360/total_teeth;  
    translate([0,-r1])
    tooth_cutter(5, tooth_height, pitch, angle, clearance, fitting);
    
    for(i=[0:resolution])
    {
        translate([-i*(pitch/resolution),-2*r1])
        rotate(-i*(dAngle/resolution))
        translate([0, r1])
        tooth_cutter(5, tooth_height, pitch, angle, clearance, fitting);
    }
}
            
/*
module BasicTooth2D(base_height, tooth_height, pitch, angle, clearance, clearance_resolution, fitting)
{
    climb_width = tooth_height / tan(angle);
    flat_width = 0.5*(pitch-2*climb_width);

    //create points for first half of clearance:
    center_y = sin(90-angle)*0.5*flat_width+base_height;
    center_x = pitch*0.5;
    r = (0.5*flat_width+fitting)/cos(90-angle);
    dAngle = 2*angle/clearance_resolution;
    
    
    points_first =
    [
        [0, 0],
        [0, base_height + tooth_height - fitting],
        [0.5*flat_width-fitting, base_height + tooth_height - fitting]
    ];
    
    clearance_points = [
    for(i = [0:clearance_resolution])
    [center_x + r * cos((270-angle)+i*dAngle), center_y + r * sin((270-angle)+i*dAngle)]
    ];
    
    points_last =
    [
        [1.5*flat_width + 2* climb_width + fitting, base_height + tooth_height - fitting],
        [pitch ,base_height + tooth_height - fitting],
        [pitch, 0]
    ];
    translate([-0.5*pitch,-(base_height+0.5*tooth_height)])
    polygon(concat(points_first, clearance_points, points_last));
}
*/