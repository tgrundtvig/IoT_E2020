use <../../Util/Shapes/Cylinder.scad>

color("grey")
translate([-5,0,0])
    Hex_Key_Bolt(   head_diameter=5,
                    wrench_size=2,
                    head_height=2,
                    bolt_diameter=3,
                    bolt_length=25,
                    angular_resolution=16,
                    simplify=false);

color("red")
translate([5,0,0])
    Hex_Key_Bolt_Cutout(head_diameter=5,
                        head_height=2,
                        bolt_diameter=3,
                        bolt_length=25,
                        fix_overhang=true,
                        overhang_factor=0.8,
                        fitting=0.2,
                        angular_resolution=32);

module Hex_Key_Bolt(head_diameter,
                    wrench_size,
                    head_height,
                    bolt_diameter,
                    bolt_length,
                    angular_resolution=32,
                    simplify=false)
{
    translate([0, 0, -head_height])
    union()
    {
        if(simplify)
        {
            Cylinder(   diameter=head_diameter,
                        height=head_height,
                        t_z="pos",
                        angular_resolution=angular_resolution   );
        }
        else
        {
            difference()
            {
                Cylinder(   diameter=head_diameter,
                            height=head_height,
                            t_z="pos",
                            angular_resolution=angular_resolution   );
                translate([0,0,-1])
                    Cylinder(   diameter=wrench_size,
                                height=head_height/2+1,
                                t_z="pos",
                                angular_resolution=6);
            }
        }
        translate([0,0,head_height])
        Cylinder(   diameter=bolt_diameter,
                    height=bolt_length,
                    t_z="pos",
                    angular_resolution=angular_resolution   );
    }
}

module Hex_Key_Bolt_Cutout( head_diameter,
                            head_height,
                            bolt_diameter,
                            bolt_length,
                            head_in = false,
                            fix_overhang=false,
                            overhang_factor=0.8,
                            fitting=0,
                            angular_resolution=16)
{
    fitted_head_diameter = head_diameter+2*fitting;
    fitted_bolt_diameter = bolt_diameter+2*fitting;
    fitted_head_height = head_height + 2*fitting;
    translate([0, 0,-head_height-fitting])
    union()
    {
        //Head
        Cylinder(   diameter=fitted_head_diameter,
                    height=fitted_head_height,
                    t_z="pos",
                    angular_resolution=angular_resolution);
        //Bolt
        translate([0,0,head_height+fitting])
            Cylinder(   diameter=fitted_bolt_diameter,
                        height=bolt_length+fitting,
                        t_z="pos",
                        angular_resolution=angular_resolution);
        
        //Overhang
        if(fix_overhang)
        {
            hull()
            {
                Cylinder(   diameter=fitted_head_diameter,
                            height=fitted_head_height,
                            t_z="pos",
                            angular_resolution=angular_resolution   );
                translate([0, 0, fitted_head_height])
                    Cylinder(   diameter=fitted_bolt_diameter,
                                height=(fitted_head_diameter-fitted_bolt_diameter)*overhang_factor/2,
                                t_z="pos",
                                angular_resolution=angular_resolution);
            }
        }
    }
}