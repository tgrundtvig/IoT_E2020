use <Common/Printed_Parts/Construction/Basic_Brick.scad>
//translate([10,0,0])
S15_Basic_Brick_Print(  size_x=12,
                        size_y=1,
                        size_z=1);
                      
//S15_Basic_Brick(size_x=1, size_y=1, size_z=1);

module S15_Basic_Brick( size_x,
                        size_y,
                        size_z,
                        simplify=false,
                        angular_resolution=8)
{
    Basic_Brick(size_x=size_x,
                size_y=size_y,
                size_z=size_z,
                unit_size=15,
                nut_height=2.5,
                wrench_size=5.5,
                axis_diameter=3,
                simplify=false,
                angular_resolution=8);
}

module S15_Basic_Brick_Print(   size_x,
                                size_y,
                                size_z,
                                fix_overhang=true,
                                overhang_factor=0.8,
                                fitting=0.2,
                                angular_resolution=32)
{
    Basic_Brick_Print(  size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=15,
                        nut_height=3.5,
                        wrench_size=5.8,
                        axis_diameter=3,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
}