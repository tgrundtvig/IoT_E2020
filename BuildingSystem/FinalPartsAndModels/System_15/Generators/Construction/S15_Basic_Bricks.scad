use <../../../Common/Printables/Construction/Basic_Brick.scad>


S15_Basic_Brick(size_x=6,
                size_y=2,
                size_z=1,
                simplify=false,
                angular_resolution=8);
                
translate([-7*15,0,0])
S15_Basic_Brick_Printable(  size_x=6,
                            size_y=2,
                            size_z=1,
                            fix_overhang=true,
                            overhang_factor=0.8,
                            fitting=0.2,
                            angular_resolution=32);

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
                simplify=false,
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