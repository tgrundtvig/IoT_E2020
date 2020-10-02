use <Hex_Nut.scad>

translate([-5,0,0])
M3_Hex_Nut();

translate([5,0,0])
color("red")
Hex_Nut_Cutout( thread_diameter=3,
                wrench_size=5.5,
                height=2,
                fix_overhang=true);


module M3_Hex_Nut(turned=false, simplify=false)
{
    color("grey")
    Hex_Nut(thread_diameter=3,
            wrench_size=5.5,
            height=2,
            turned=turned,
            simplify=simplify);
}

module M3_Hex_Nut_Cutout(turned=false, fix_overhang=false, overhang_factor=0.8, fitting=0.2)
{
    color("grey")
    Hex_Nut(thread_diameter=3,
            wrench_size=5.5,
            height=2,
            turned=turned,
            fix_overhang=fix_overhang,
            overhang_factor=overhang_factor,
            fitting=fitting);
}
    