use <Common/Util/Shapes/Box.scad>
use <Common/Printed_Parts/Construction/Axis_Holes.scad>


Half_Brick( size_x=7,
            size_y=4,
            unit_size=15,
            nut_height=3.5,
            wrench_size=5.8,
            axis_diameter=3,
            back=false,
            simplify=false,
            angular_resolution=8);


module Half_Brick(  size_x,
                    size_y,
                    unit_size,
                    nut_height,
                    wrench_size,
                    axis_diameter,
                    back=false,
                    simplify=false,
                    angular_resolution=8)
{
    space=unit_size*0.01;
    t=-0.5*unit_size;
    t_z = back ? 0 : (size_y-1)*unit_size;
    r_x = back ? 90 : -90;
    color("blue")
    translate([0,0,t_z])
    rotate([r_x,0,0])
    translate([t,t,t])
    if(simplify)
    {
        translate([space,space,space])
            Box([   size_x*unit_size-2*space,
                    size_y*unit_size-2*space,
                    0.5*unit_size-2*space    ],
                    t_x="pos",
                    t_y="pos",
                    t_z="pos");
    }
    else
    {   
        difference()
        {
            translate([space,space,space])
            Box([   size_x*unit_size-2*space,
                    size_y*unit_size-2*space,
                    0.5*unit_size-2*space    ],
                    t_x="pos",
                    t_y="pos",
                    t_z="pos");
            
            Z_Axis_Holes_Cutout(size_x=size_x,
                                size_y=size_y,
                                size_z=1,
                                unit_size=unit_size,
                                nut_height=nut_height,
                                wrench_size=wrench_size,
                                axis_diameter=axis_diameter,
                                fix_overhang=false,
                                overhang_factor=0,
                                fitting=0,
                                angular_resolution=angular_resolution); 
        }
    }
}

module Basic_Brick_Print(   size_x,
                            size_y,
                            size_z,
                            unit_size,
                            nut_height,
                            wrench_size,
                            axis_diameter,
                            fix_overhang=true,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    translate([0,0,-fitting])
    difference()
    {
        translate([fitting,fitting,fitting])
        Box([   size_x*unit_size-2*fitting,
                size_y*unit_size-2*fitting,
                size_z*unit_size-2*fitting    ],
                t_x="pos",
                t_y="pos",
                t_z="pos");
        
        XYZ_Axis_Holes_Cutout(  size_x=size_x,
                                size_y=size_y,
                                size_z=size_z,
                                unit_size=unit_size,
                                outer_nut_height=nut_height,
                                wrench_size=wrench_size,
                                axis_diameter=axis_diameter,
                                fix_overhang=fix_overhang,
                                overhang_factor=overhang_factor,
                                fitting=fitting,
                                angular_resolution=angular_resolution); 
    }
}