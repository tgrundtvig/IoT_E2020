include <Common/Util/Shapes.scad>

Show_Ballbearing();

module Show_Ballbearing()
{
    difference()
    {
        Box([30,30,7.5],t_z="neg");
        Ballbearing_Cutout( inner_diameter=8.2,
                            outer_diameter=22,
                            width=7*3,
                            center_diameter=12,
                            playroom=0.5,
                            fitting=0.2,
                            axel_cutout=false);
    }
    Ballbearing(inner_diameter=8.2, outer_diameter=22, width=7);
        
}

module Ballbearing(inner_diameter, outer_diameter, width)
{
    color("silver")
    difference()
    {
        Cylinder(diameter=outer_diameter, height=width, angular_resolution=64);
        Cylinder(diameter=inner_diameter, height=width+2, angular_resolution=64);
    }
}

module Ballbearing_Cutout(  inner_diameter,
                            outer_diameter,
                            width,
                            center_diameter,
                            playroom=0.5,
                            fitting=0.2,
                            axel_cutout=false)
{
    difference()
    {
        Cylinder(   diameter=outer_diameter+2*playroom+2*fitting,
                    height=width+2*playroom+2*fitting, angular_resolution=64);
        
        
        rotate([180,0,0])
        translate([0,0,-2*playroom-0.5*width-fitting])
        Cone(   bottom_diameter=center_diameter+4*playroom,
                top_diameter=center_diameter,
                height=2*playroom,
                angular_resolution=64,
                t_z="pos");
        translate([0,0,-2*playroom-0.5*width-fitting])
        //cylinder(d1=center_diameter+4*playroom, d2=center_diameter, h=2*playroom, $fn=64);
        Cone(   bottom_diameter=center_diameter+4*playroom,
                top_diameter=center_diameter,
                height=2*playroom,
                angular_resolution=64,
                t_z="pos");
        
        
        if(!axel_cutout)
        {
            cylinder(d=inner_diameter-2*fitting, h=width+2, center=true, $fn=64);
        }
        
    }
}