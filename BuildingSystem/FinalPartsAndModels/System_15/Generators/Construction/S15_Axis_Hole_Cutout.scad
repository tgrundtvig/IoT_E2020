use <Common/Printed_Parts/Construction/Axis_Holes.scad>

S15_Axis_Hole_Cutout(height_in_units=2);
     
module S15_Axis_Hole_Cutout(height_in_units,
                            turned=false,
                            fix_overhang=true,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32)
{
    translate([0,0,15*height_in_units/2])
    Axis_And_Nuts_Cutout(   axis_length=height_in_units*15,
                            nut_dist=height_in_units*15,
                            nut_height=3.5*2,
                            wrench_size=5.8,
                            axis_diameter=3,
                            turned=turned,
                            fix_overhang=fix_overhang,
                            overhang_factor=overhang_factor,
                            fitting=fitting,
                            angular_resolution=angular_resolution);
}
