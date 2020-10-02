// Part number: 000003
// Part version: 0001
// Part name: Basic 1x1x1 brick
// Printable part


translate([15,0,0])
Part_000003_0001_Show();
Part_000003_0001_Show(simplify=true);

translate([-30,0,0])
Part_000003_0001_Print();


module Part_000003_0001_Show(simplify=false)
{
    S15_Basic_Brick(size_x=1,
                    size_y=1,
                    size_z=1,
                    simplify=simplify,
                    angular_resolution=8);
}

module Part_000003_0001_Print(fix_overhangs=true, overhang_factor=0.8, fitting=0.2)
{
    S15_Basic_Brick_Printable(  size_x=1,
                            size_y=1,
                            size_z=1,
                            fix_overhang=fix_overhangs,
                            overhang_factor=overhang_factor,
                            fitting=fitting,
                            angular_resolution=32);
}

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
                nut_depth=3.5,
                wrench_size=5.5,
                bolt_diameter=3,
                simplify=simplify,
                angular_resolution=8);
}

module S15_Basic_Brick_Printable(   size_x,
                                    size_y,
                                    size_z,
                                    fix_overhang=true,
                                    overhang_factor=0.8,
                                    fitting=0.2,
                                    angular_resolution=32)
{
    Basic_Brick_Printable(  size_x=size_x,
                            size_y=size_y,
                            size_z=size_z,
                            unit_size=15,
                            nut_depth=3.5,
                            wrench_size=5.5,
                            bolt_diameter=3,
                            fix_overhang=fix_overhang,
                            overhang_factor=overhang_factor,
                            fitting=fitting,
                            angular_resolution=angular_resolution);
}

module Basic_Brick( size_x,
                    size_y,
                    size_z,
                    unit_size,
                    nut_depth,
                    wrench_size,
                    bolt_diameter,
                    simplify=false,
                    angular_resolution=8)
{
    space=unit_size*0.01;
    t=-0.5*unit_size;
    color("blue")  
    translate([t,t,t])
    if(simplify)
    {
        translate([space,space,space])
            Box([   size_x*unit_size-2*space,
                    size_y*unit_size-2*space,
                    size_z*unit_size-2*space    ],
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
                    size_z*unit_size-2*space    ],
                    t_x="pos",
                    t_y="pos",
                    t_z="pos");
            
            XYZ_Axis_Holes_Cutout(  size_x=size_x,
                                    size_y=size_y,
                                    size_z=size_z,
                                    unit_size=unit_size,
                                    nut_depth=nut_depth,
                                    wrench_size=wrench_size,
                                    bolt_diameter=bolt_diameter,
                                    fix_overhang=false,
                                    overhang_factor=0.8,
                                    fitting=0,
                                    angular_resolution=8); 
        }
    }
}

module Basic_Brick_Printable(   size_x,
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
                                nut_depth=nut_depth,
                                wrench_size=wrench_size,
                                bolt_diameter=bolt_diameter,
                                fix_overhang=fix_overhang,
                                overhang_factor=overhang_factor,
                                fitting=fitting,
                                angular_resolution=angular_resolution); 
    }
}

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

module Hex_Nut_Cutout(  thread_diameter,
                        wrench_size,
                        height,
                        turned=false,
                        fix_overhang=false,
                        overhang_factor=0.8,
                        fitting=0.2)
{
    fitted_wrench_size = wrench_size + 2*fitting;
    fitted_thread_diameter = thread_diameter+2*fitting;
    fitted_height = height + 2*fitting;
    rot = turned ? 30 : 0;
    diameter = 2*wrench_size/sqrt(3);
    rotate([0,0,rot]) 
    if(fix_overhang)
    {
        hull()
        {
            ch = fitted_height + 
                 (fitted_wrench_size-fitted_thread_diameter)*overhang_factor;
            
            Cylinder(   diameter=fitted_thread_diameter,
                        height=ch,
                        angular_resolution=32);
            
            Cylinder(   diameter=diameter,
                        height=fitted_height,
                        angular_resolution=6);
        }
    }
    else
    {
        Cylinder(   diameter=2*wrench_size/sqrt(3),
                    height=fitted_height,
                    angular_resolution=6);
    }    
}

module Box(dimensions, t_x="center", t_y="center", t_z="center")
{
    tx = t_x == "neg" ? -dimensions[0]/2 : 
            t_x == "pos" ? dimensions[0]/2 : 0;
    ty = t_y == "neg" ? -dimensions[1]/2 : 
            t_y == "pos" ? dimensions[1]/2 : 0;
    tz = t_z == "neg" ? -dimensions[2]/2 : 
            t_z == "pos" ? dimensions[2]/2 : 0;
    translate([tx, ty, tz])
        cube(dimensions, center=true);
}

module Cylinder(diameter, height, t_x="center", t_y="center", t_z="center", angular_resolution=32)
{
    tx = t_x == "neg" ? -diameter/2 : 
            t_x == "pos" ? diameter/2 : 0;
    ty = t_y == "neg" ? -diameter/2 : 
            t_y == "pos" ? diameter/2 : 0;
    tz = t_z == "neg" ? -height/2 : 
            t_z == "pos" ? height/2 : 0;
    translate([tx,ty,tz])
        cylinder(d=diameter, h=height, center=true, $fn=angular_resolution);
}
