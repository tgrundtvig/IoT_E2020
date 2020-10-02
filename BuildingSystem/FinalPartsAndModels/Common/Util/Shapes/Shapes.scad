// Auther: Tobias Grundtvig
// Date: Oct 1, 2020
//
// A file to include all the shapes in one use <> statement.


// 2D shapes
use <Pie_2D.scad>
use <Circle_Segment_2D.scad>


// 3D shapes
use <Box.scad>
use <Cylinder.scad>
use <Cone.scad>
use <Flat_Ring.scad>
use <Cylinder_Segment.scad>
use <Cone_Segment.scad>
use <Flat_Ring_Segment.scad>


translate([-40,-20,0])
Box([5,10,7]);
translate([-20,-20,0])
Cylinder(diameter=10, height=5);
translate([0,-20,0])
Cone(bottom_diameter=10, top_diameter=5, height=5);
translate([20,-20,0])
Flat_Ring(inner_diameter=5, outer_diameter=10, height=5);

translate([-20,-40,0])
Cylinder_Segment(diameter=10, height=5, from_angle=45, to_angle=315);
translate([-15,-40,0])
Cylinder_Segment(diameter=10, height=5, from_angle=315, to_angle=45);

translate([0,-40,0])
Cone_Segment(bottom_diameter=10, top_diameter=5, height=5, from_angle=45, to_angle=315);
translate([5,-40,0])
Cone_Segment(bottom_diameter=10, top_diameter=5, height=5, from_angle=315, to_angle=45);

translate([20,-40,0])
Flat_Ring_Segment(inner_diameter=5, outer_diameter=10, height=5, from_angle=45, to_angle=315);
translate([25,-40,0])
Flat_Ring_Segment(inner_diameter=5, outer_diameter=10, height=5, from_angle=315, to_angle=45);




translate([-40,20,0])
{
    Pie_2D(diameter=10, from_angle=45, to_angle=315, steps=32);
    translate([2,0,0])
    Pie_2D(diameter=10, from_angle=315, to_angle=45, steps=32);
}

translate([-20,20,0])
{
    Circle_Segment_2D(diameter=10, from_angle=45, to_angle=315);
    translate([2,0,0])
    Circle_Segment_2D(diameter=10, from_angle=315, to_angle=45);
}