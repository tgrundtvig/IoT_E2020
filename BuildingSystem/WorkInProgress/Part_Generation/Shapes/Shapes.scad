//Pie2D(10, 45, 90, 10);
//Circle_Segment_2D(10, 45, 44, $fn=16);
//Pie_2D(diameter=10,from_angle=0, to_angle=90, steps=32);
//Cylinder_Segment(bottom_diameter=30, top_diameter=10, height=10, from_angle=370, to_angle=45, $fn=64);
Flat_Ring_Segment(40,50,5,45,135, center=true, $fn=64);


module Pie_2D(diameter, from_angle=0, to_angle=90, steps=32)
{
    step_size = from_angle < to_angle ?
                (to_angle-from_angle)/steps :
                (360 - (from_angle-to_angle))/steps;
    r=diameter/2;
    points = from_angle < to_angle ?
        [
            for(i = [0:steps])
            [r * cos(from_angle+i*step_size), r * sin(from_angle+i*step_size)]
        ] :
        [
            for(i = [0:steps])
            [r * cos(from_angle+i*step_size), r * sin(from_angle+i*step_size)]
        ];
            
    polygon(concat([[0, 0]], points));
}

module Circle_Segment_2D(diameter=1, from_angle=0, to_angle=45, $fn=$fn)
{
    intersection()
    {
        circle(d=diameter, $fn=$fn);  
        Pie_2D
        (
            diameter=diameter*2,
            from_angle=from_angle,
            to_angle=to_angle,
            steps = 8
        );       
    }
}

module Cylinder_Segment(bottom_diameter, top_diameter, height, from_angle, to_angle, center = false, $fn=$fn)
{
    intersection()
    {
        cylinder(d1=bottom_diameter, d2=top_diameter, h=height, center=center, $fn=$fn);
        linear_extrude(height=height, center=center)
        {
            Pie_2D
            (
                diameter=max(bottom_diameter,top_diameter)*2,
                from_angle=from_angle,
                to_angle=to_angle,
                steps = 8
            );
        }        
    }
        
}

module Flat_Ring(inner_diameter, outer_diameter, height, center=false, $fn=$fn)
{
    difference()
    {
        cylinder(d=outer_diameter, h=height, center=center, $fn=$fn);
        translate([0,0,-1])
        cylinder(d=inner_diameter, h=height+3, center=center, $fn=$fn);
    }
}

module Flat_Ring_Segment(inner_diameter, outer_diameter, height, from_angle=0, to_angle=90, center=false, $fn=$fn)
{
    intersection()
    {
        linear_extrude(height=height, center=center)
        {
            Pie_2D
            (
                diameter=outer_diameter*2,
                from_angle=from_angle,
                to_angle=to_angle,
                steps = 8
            );
        }
        Flat_Ring(  inner_diameter=inner_diameter,
                    outer_diameter=outer_diameter,
                    height=height,
                    center=center,
                    $fn=$fn);
    }
}
