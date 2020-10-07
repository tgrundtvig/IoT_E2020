include <Common/Util/Shapes.scad>
use <Common/Sourced_Parts/Fasteners/Hex_Nut.scad>


XYZ_Axis_Holes_Cutout(  size_x=6,
                        size_y=2,
                        size_z=1,
                        unit_size=15,
                        inner_nut_height=2,
                        outer_nut_height=3.5,
                        wrench_size=5.8,
                        axis_diameter=3,
                        inner_nuts=false,
                        fix_overhang=true,
                        overhang_factor=0.8,
                        fitting=0.2,
                        angular_resolution=32);                       

/*
module Axis_Hole_Cutout(brick_width,
                        nut_height,
                        wrench_size,
                        axis_diameter,
                        turned=false,
                        fix_overhang=true,
                        overhang_factor=0.8,
                        fitting=0.2,
                        angular_resolution=32)
{
    Axis_And_Nuts_Cutout(   axis_length=brick_width,
                            nut_dist=brick_width,
                            nut_height=nut_height*2,
                            wrench_size=wrench_size,
                            axis_diameter=axis_diameter,
                            turned=turned,
                            fix_overhang=fix_overhang,
                            overhang_factor=overhang_factor,
                            fitting=fitting,
                            angular_resolution=angular_resolution);
}*/

module Axis_And_Nuts_Cutout(axis_length,
                            nut_dist,
                            nut_height,
                            wrench_size,
                            axis_diameter,
                            turned=false,
                            dist_type="center",
                            fix_overhang=true,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    t = dist_type == "inner" ? nut_height / 2 :
        dist_type == "outer" ? -nut_height / 2 : 0;
    nut_t = nut_dist/2 + t;
    union()
    {
        translate([0,0,-nut_t])
        Hex_Nut_Cutout( thread_diameter=axis_diameter,
                        wrench_size= wrench_size,
                        height=nut_height,
                        turned=turned,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting);

        Cylinder(   diameter=axis_diameter+2*fitting,
                    height=axis_length+2*fitting,
                    angular_resolution=angular_resolution);
        translate([0,0,nut_t])
            Hex_Nut_Cutout( thread_diameter=axis_diameter,
                            wrench_size= wrench_size,
                            height=nut_height,
                            turned=turned,
                            fix_overhang=fix_overhang,
                            overhang_factor=overhang_factor,
                            fitting=fitting);
        }
}


module X_Axis_Holes_Cutout( size_x,
                            size_y,
                            size_z,
                            unit_size,
                            nut_height,
                            wrench_size,
                            axis_diameter,
                            inner_nuts = false,
                            fix_overhang = false,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    for(y=[0:size_y-1])
    {
        for(z=[0:size_z-1])
        {
            translate([0.5*size_x*unit_size, (y+0.5)*unit_size, (z+0.5)*unit_size,])
            rotate([0,90,0])
            if(inner_nuts)
            {
                Axis_And_Nuts_Cutout(   axis_length=size_x*unit_size+2,
                                        nut_dist=size_x*unit_size-3,
                                        nut_height=nut_height,
                                        wrench_size=wrench_size,
                                        axis_diameter=axis_diameter,
                                        dist_type="outer",
                                        turned=true,
                                        fix_overhang=false,
                                        overhang_factor=overhang_factor,
                                        fitting=fitting,
                                        angular_resolution=angular_resolution);
            }
            else
            {
                Axis_And_Nuts_Cutout(   axis_length=size_x*unit_size+2,
                                        nut_dist=size_x*unit_size,
                                        nut_height=nut_height*2,
                                        wrench_size=wrench_size,
                                        axis_diameter=axis_diameter,
                                        turned=false,
                                        fix_overhang=fix_overhang,
                                        overhang_factor=overhang_factor,
                                        fitting=fitting,
                                        angular_resolution=angular_resolution);
            }
        }
    }
}

module Y_Axis_Holes_Cutout( size_x,
                            size_y,
                            size_z,
                            unit_size,
                            nut_height,
                            wrench_size,
                            axis_diameter,
                            inner_nuts = false,
                            fix_overhang=false,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    for(x=[0:size_x-1])
    {
        for(z=[0:size_z-1])
        {
            translate([(x+0.5)*unit_size, 0.5*size_y*unit_size, (z+0.5)*unit_size,])
            rotate([90,0,0])
            if(inner_nuts)
            {
                Axis_And_Nuts_Cutout(   axis_length=size_y*unit_size+2,
                                        nut_dist=size_y*unit_size-3,
                                        nut_height=nut_height,
                                        wrench_size=wrench_size,
                                        axis_diameter=axis_diameter,
                                        dist_type="outer",
                                        turned=false,
                                        fix_overhang=fix_overhang,
                                        overhang_factor=overhang_factor,
                                        fitting=fitting,
                                        angular_resolution=angular_resolution);
            }
            else
            {
                Axis_And_Nuts_Cutout(   axis_length=size_y*unit_size+2,
                                        nut_dist=size_y*unit_size,
                                        nut_height=nut_height*2,
                                        wrench_size=wrench_size,
                                        axis_diameter=axis_diameter,
                                        turned=true,
                                        fix_overhang=fix_overhang,
                                        overhang_factor=overhang_factor,
                                        fitting=fitting,
                                        angular_resolution=angular_resolution);
            }
        }
    }
}

module Z_Axis_Holes_Cutout( size_x,
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
    for(x=[0:size_x-1])
    {
        for(y=[0:size_y-1])
        {
            translate([(x+0.5)*unit_size, (y+0.5)*unit_size, 0.5*size_z*unit_size])
            Axis_And_Nuts_Cutout(   axis_length=size_z*unit_size,
                                    nut_dist=size_z*unit_size,
                                    nut_height=nut_height*2,
                                    wrench_size=wrench_size,
                                    axis_diameter=axis_diameter,
                                    turned=false,
                                    fix_overhang=fix_overhang,
                                    overhang_factor=overhang_factor,
                                    fitting=fitting,
                                    angular_resolution=angular_resolution);
        }
    }
}

module XYZ_Axis_Holes_Cutout(   size_x,
                                size_y,
                                size_z,
                                unit_size,
                                inner_nut_height,
                                outer_nut_height,
                                wrench_size,
                                axis_diameter,
                                inner_nuts=false,
                                fix_overhang=false,
                                overhang_factor=0.8,
                                fitting=0.2,
                                angular_resolution=32)
{
    X_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_height=inner_nuts ? inner_nut_height : outer_nut_height,
                        wrench_size=wrench_size,
                        axis_diameter=axis_diameter,
                        inner_nuts=inner_nuts,
                        fix_overhang=inner_nuts ? false : fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
                    
    Y_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_height=inner_nuts ? inner_nut_height : outer_nut_height,
                        wrench_size=wrench_size,
                        axis_diameter=axis_diameter,
                        inner_nuts=inner_nuts,
                        fix_overhang=inner_nuts ? false : fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
                    
    Z_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_height=outer_nut_height,
                        wrench_size=wrench_size,
                        axis_diameter=axis_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
}