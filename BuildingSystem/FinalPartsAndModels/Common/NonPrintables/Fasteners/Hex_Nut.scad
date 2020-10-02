use <../../Util/Shapes/Cylinder.scad>

translate([-5,0,0])
color("grey")
Hex_Nut(thread_diameter=3,
        wrench_size=5.5,
        height=2,
        turned=true,
        simplify=true);

translate([5,0,0])
color("red")
Hex_Nut_Cutout( thread_diameter=3,
                wrench_size=5.5,
                height=2,
                turned=true,
                fix_overhang=true,
                overhang_factor=0.8,
                fitting=0.2);


module Hex_Nut( thread_diameter,
                wrench_size,
                height,
                turned=false,
                simplify=false)
{
    rot = turned ? 30 : 0;
    diameter = 2*wrench_size/sqrt(3);
    rotate([0,0,rot])
    if(simplify)
    {
        Cylinder(   diameter=diameter,
                    height=height,
                    angular_resolution=6);
    }
    else
    {
        difference()
        {
            Cylinder(   diameter=diameter,
                        height=height,
                        angular_resolution=6);
            Cylinder(   diameter=thread_diameter,
                        height=height+1,
                        angular_resolution=16);
        }
    }
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