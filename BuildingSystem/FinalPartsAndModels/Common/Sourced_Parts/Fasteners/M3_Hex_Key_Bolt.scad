use <Common/Sourced_Parts/Fasteners/Hex_Key_Bolt.scad>

translate([-5,0,0])
M3_Hex_Key_Bolt( length = 25, simplify=false);

translate([5,0,0])
M3_Hex_Key_Bolt_Cutout( length = 25, fitting=0.2);




module M3_Hex_Key_Bolt( length, simplify=false)
{
    ar = simplify ? 8 : 16;
    color("grey")
    Hex_Key_Bolt(   head_diameter=5,
                    wrench_size=2,
                    head_height=2,
                    bolt_diameter=3,
                    bolt_length=25,
                    angular_resolution=ar,
                    simplify=simplify);
}



module M3_Hex_Key_Bolt_Cutout(  length,
                                head_in=false,
                                fix_overhang=false,
                                overhang_factor=0.8,
                                fitting=0,
                                angular_resolution=64 )
{
    color("red")
    Hex_Key_Bolt_Cutout(head_diameter=5,
                        head_height=2,
                        bolt_diameter=3,
                        bolt_length=length,
                        fix_overhang=fix_overhang,
                        overhang_factor=overhang_factor,
                        fitting=fitting,
                        angular_resolution=angular_resolution);
}