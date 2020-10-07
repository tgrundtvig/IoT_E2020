include <Common/Util/Shapes.scad>


//Test();
SG_90_Micro_Servo();

module Test()
{
    difference()
    {
        Box([35,30,7],t_y="neg", t_z="neg");
        rotate([0,180,0])
        rotate([-90,0,0])
        SG_90_Micro_Servo();
    }
}

module SG_90_Micro_Servo()
{
    union()
    {
        translate([0,0,-4.8])
        Box([23.5,13,23.5],t_z="neg");
        translate([0,0,-9.2])
        Box([32.5, 13, 3],t_z="neg");
        translate([0,0,-21.5])
        Box([50,5,2],t_x="neg", t_z="neg");
        translate([-(23.5-13)/2,0,0])
        Cylinder(diameter=13,height=5, t_z="neg", angular_resolution=64);
        translate([-4+(14.5-12.4),0,0])
        union()
        {
            Box([5.3, 5.3,5.3], t_z="neg");
            translate([0.5*5.3,0,0])
            Cylinder(diameter=5.3,height=5, t_z="neg", angular_resolution=64);
        }
    }
}