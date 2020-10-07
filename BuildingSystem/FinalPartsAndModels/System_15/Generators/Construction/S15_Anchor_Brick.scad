use <Common/Printed_Parts/Construction/Anchor_Brick.scad>

difference()
{
    S15_Anchor_Brick_Print(size_x=3, size_y=3);
    translate([0,0,0.4])
    cylinder(d=22, h=7.5, $fn=64);
    translate([0,0,-1])
    cylinder(d=16, h=2, $fn=64);
}

translate([50,0,0])
difference()
{
    S15_Anchor_Brick_Print(size_x=3, size_y=3);
    translate([0,0,-1])
    cylinder(d=16, h=9.5, $fn=64);
}

module S15_Anchor_Brick_Print(  size_x,
                                size_y,
                                fix_overhang=true,
                                overhang_factor=0.8,
                                fitting=0.2 )
{                    
    Anchor_Brick_Print( size_x=size_x,
                        size_y=size_y,
                        unit_size=15,
                        outer_nut_height=3.5,
                        inner_nut_height=2.5,
                        wrench_size=5.8,
                        axis_diameter=3,
                        fix_overhang=true,
                        overhang_factor=0.8,
                        fitting=0.2,
                        angular_resolution=32);
}