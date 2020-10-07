// Part number: 000001
// Part version: 0001
// Part name: M3 Hex Nut, 2 mm height, size 5.5
// Sourced part, non-printable


Part_000001_0001_Show();

module Part_000001_0001_Show(simplified=true)
{
    if(simplified)
    {
        p_000001_0001_M3_Hex_Nut($fn=8);
    }
    else
    {
        p_000001_0001_M3_Hex_Nut($fn=16);
    }
}

module p_000001_0001_M3_Hex_Nut(turned=false, center=false)
{
    color("grey")
    p_000001_0001_Hex_Nut(  thread_diameter=3,
                            wrench_size=5.5,
                            height=2,
                            turned=turned,
                            center=center,
                            $fn=$fn);
}

module p_000001_0001_Hex_Nut(thread_diameter, wrench_size, height, turned= false, center=false, $fn=$fn)
{
    rot = turned ? 30 : 0;
    t = center ? 0 : height/2;
    translate([0,0,t])
    rotate([0,0,rot])
    difference()
    {
        cylinder(d=2*wrench_size/sqrt(3), h=height, center=true, $fn=6);
        cylinder(d=thread_diameter, h=height+1, center=true, $fn=$fn);
    }
}