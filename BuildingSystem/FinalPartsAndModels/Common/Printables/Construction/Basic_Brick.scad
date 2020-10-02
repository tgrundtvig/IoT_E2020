use <../../Util/Shapes/Box.scad>
use <Bolt_Holes.scad>
                                
Basic_Brick(size_x=6,
            size_y=2,
            size_z=1,
            unit_size=15,
            nut_depth=2,
            wrench_size=5.5,
            bolt_diameter=3,
            simplify=true,
            angular_resolution=8);
translate([0,-30,0])          
Basic_Brick(size_x=6,
            size_y=2,
            size_z=1,
            unit_size=15,
            nut_depth=2,
            wrench_size=5.5,
            bolt_diameter=3,
            simplify=false,
            angular_resolution=8);


translate([-7*15,0,0])
Basic_Brick_Printable(  size_x=6,
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