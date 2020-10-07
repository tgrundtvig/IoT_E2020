include <Common/Util/Shapes.scad>
use <Common/Printed_Parts/Construction/Axis_Holes.scad>

Anchor_Brick_Print( size_x=1,
                    size_y=1,
                    unit_size=15,
                    outer_nut_height=3.5,
                    inner_nut_height=2.5,
                    wrench_size=5.8,
                    axis_diameter=3,
                    fix_overhang=true,
                    overhang_factor=0.8,
                    fitting=0.2,
                    angular_resolution=32);


module Anchor_Brick_Print(  size_x,
                            size_y,
                            unit_size,
                            outer_nut_height,
                            inner_nut_height,
                            wrench_size,
                            axis_diameter,
                            fix_overhang=true,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    translate([-0.5*size_x*unit_size,-0.5*size_y*unit_size,0])
    difference()
    {
        translate([fitting,fitting,0])
        Box([   size_x*unit_size-2*fitting,
                size_y*unit_size-2*fitting,
                0.5*unit_size],
                t_x="pos",
                t_y="pos",
                t_z="pos");
        
        XYZ_Axis_Holes_Cutout(  size_x=size_x,
                                size_y=size_y,
                                size_z=2,
                                unit_size=unit_size,
                                outer_nut_height=outer_nut_height,
                                inner_nut_height=inner_nut_height,
                                inner_nuts=true,
                                wrench_size=wrench_size,
                                axis_diameter=axis_diameter,
                                fix_overhang=fix_overhang,
                                overhang_factor=overhang_factor,
                                fitting=fitting,
                                angular_resolution=angular_resolution); 
    }
}