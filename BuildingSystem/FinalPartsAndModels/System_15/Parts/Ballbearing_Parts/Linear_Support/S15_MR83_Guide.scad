include <Common/Util/Shapes.scad>
use <System_15/Generators/Construction/S15_Axis_Hole_Cutout.scad>
use <Common/Sourced_Parts/Ballbearings/BB_3x8x3.scad>





difference()
{
    hull()
    {
        Box([15,28,7.5], t_z="neg");
        translate([7.5,0,0])
        Cylinder(diameter=28, height=7.5, t_z="neg", angular_resolution=64);
        translate([-7.5,0,0])
        Cylinder(diameter=28, height=7.5, t_z="neg", angular_resolution=64);
    }
    t=10.9;
    translate([-7.5,0,-7.5])
    S15_Axis_Hole_Cutout(1);
    translate([7.5,0,-7.5])
    S15_Axis_Hole_Cutout(1);
    translate([t,t,0])
    BB_3x8x3_Cutout();
    translate([t,-t,0])
    BB_3x8x3_Cutout();
    translate([-t,t,0])
    BB_3x8x3_Cutout();
    translate([-t,-t,0])
    BB_3x8x3_Cutout();
}
    