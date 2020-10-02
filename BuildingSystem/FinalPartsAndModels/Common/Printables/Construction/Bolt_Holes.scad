use <../../Util/Shapes/Cylinder.scad>
use <../../NonPrintables/Fasteners/Hex_Nut.scad>


XYZ_Axis_Holes_Cutout(  size_x=6,
                        size_y=2,
                        size_z=1,
                        unit_size=15,
                        nut_depth=2,
                        wrench_size=5.5,
                        bolt_diameter=3,
                        fix_overhang=true,
                        overhang_factor=0.8,
                        fitting=0.2,
                        angular_resolution=32);

module Bolt_Hole_Cutout(brick_width,
                        nut_depth,
                        wrench_size,
                        bolt_diameter,
                        turned=false,
                        fix_overhang=true,
                        overhang_factor=0.8,
                        fitting=0.2,
                        angular_resolution=32)
{
    translate([0,0,-brick_width/2])
    union()
    {
        Hex_Nut_Cutout( thread_diameter=bolt_diameter,
                        wrench_size= wrench_size,
                        height=nut_depth*2,
                        turned=turned,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting);

        Cylinder(   diameter=bolt_diameter+2*fitting,
                    height=brick_width+2*fitting,
                    t_z="pos",
                    angular_resolution=angular_resolution);
        translate([0,0,brick_width])
            Hex_Nut_Cutout( thread_diameter=bolt_diameter,
                            wrench_size= wrench_size,
                            height=nut_depth*2,
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
                            nut_depth,
                            wrench_size,
                            bolt_diameter,
                            fix_overhang=false,
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
            Bolt_Hole_Cutout(   size_x*unit_size,
                                nut_depth=nut_depth,
                                wrench_size=wrench_size,
                                bolt_diameter=bolt_diameter,
                                turned=true,
                                fix_overhang=fix_overhang,
                                overhang_factor=overhang_factor,
                                fitting=fitting,
                                angular_resolution=angular_resolution);
        }
    }
}

module Y_Axis_Holes_Cutout( size_x,
                            size_y,
                            size_z,
                            unit_size,
                            nut_depth,
                            wrench_size,
                            bolt_diameter,
                            fix_overhang=false,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    for(x=[0:size_x-1])
    {
        for(z=[0:size_z-1])
        {
            translate([(x+0.5)*unit_size, 0.5*size_y*unit_size,(z+0.5)*unit_size,])
            rotate([90,0,0])
            Bolt_Hole_Cutout(   size_y*unit_size,
                                nut_depth=nut_depth,
                                wrench_size=wrench_size,
                                bolt_diameter=bolt_diameter,
                                turned=false,
                                fix_overhang=fix_overhang,
                                overhang_factor=overhang_factor,
                                fitting=fitting,
                                angular_resolution=angular_resolution);
        }
    }
}

module Z_Axis_Holes_Cutout( size_x,
                            size_y,
                            size_z,
                            unit_size,
                            nut_depth,
                            wrench_size,
                            bolt_diameter,
                            turned=false,
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
            Bolt_Hole_Cutout(   size_z*unit_size,
                                nut_depth=nut_depth,
                                wrench_size=wrench_size,
                                bolt_diameter=bolt_diameter,
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
                                nut_depth,
                                wrench_size,
                                bolt_diameter,
                                fix_overhang=false,
                                overhang_factor=0.8,
                                fitting=0.2,
                                angular_resolution=32)
{
    X_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
                    
    Y_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
                    
    Z_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
}

module XY_Axis_Holes_Cutout(size_x,
                            size_y,
                            size_z,
                            unit_size,
                            nut_depth,
                            wrench_size,
                            bolt_diameter,
                            fix_overhang=false,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    X_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
                    
    Y_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
}

module XZ_Axis_Holes_Cutout(size_x,
                            size_y,
                            size_z,
                            unit_size,
                            nut_depth,
                            wrench_size,
                            bolt_diameter,
                            fix_overhang=true,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    X_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
                    
    Z_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
}

module YZ_Axis_Holes_Cutout(size_x,
                            size_y,
                            size_z,
                            unit_size,
                            nut_depth,
                            wrench_size,
                            bolt_diameter,
                            fix_overhang=true,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    Y_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
                    
    Z_Axis_Holes_Cutout(size_x=size_x,
                        size_y=size_y,
                        size_z=size_z,
                        unit_size=unit_size,
                        nut_depth=nut_depth,
                        wrench_size=wrench_size,
                        bolt_diameter=bolt_diameter,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
}

    