use <Common/Sourced_Parts/Ballbearings/Ballbearing.scad>

module BB_3x8x3(stack_height=1)
{
    Ballbearing(inner_diameter=3*stack_height, outer_diameter=8, width=3);
}



module BB_3x8x3_Cutout(stack_height=1, axel_cutout=false, playroom=0.5, fitting=0.2)
{
    Ballbearing_Cutout( inner_diameter=3,
                        outer_diameter=8,
                        width=3*stack_height,
                        center_diameter=5 );
}

