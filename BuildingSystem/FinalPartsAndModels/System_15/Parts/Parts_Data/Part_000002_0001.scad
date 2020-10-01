// Part number: 000002
// Part version: 0001
// Part name: M3 Hex bolt, 25 mm length, Wrench size = 2.0 mm
// Sourced part, non-printable


Part_000002_0001_Show();

module Part_000002_0001_Show(simplified=true)
{
    if(simplified)
    {
        p_000002_0001_M3_Bolt(25, head_in=false, center=false, $fn=8)
    }
    else
    {
        p_000002_0001_M3_Bolt(length, head_in=false, center=false, $fn=16)
    }
}

module p_000002_0001_M3_Bolt(length, head_in=false, center=false, $fn=$fn)
{
    color("grey")
    p_000002_0001_Bolt(head_diameter=5, head_height=3, bolt_diameter=3, bolt_length=length, head_in=head_in, center=center, $fn = $fn);
}

module Bolt(head_diameter, wrench_size, head_height, bolt_diameter, bolt_length,  head_in = false, center=false, $fn=$fn)
{
    t = center ? 
        (head_in ?
            (head_height + bolt_length)/2 :  //center, head in
            head_height + bolt_length/2      //center, head out
        ) :                    
        (head_in ?                     
            0 :                         //no center, head in
            head_height                 //no center, head out
        );
    translate([0,0,-t])
    union()
    {
        difference()
        {
            cylinder(d=head_diameter, h=head_height, $fn=$fn);
            translate([0,0,-1])
            cylinder(d=head_diameter, h=head_height/2+1, $fn=6);
        } 
        translate([0,0,head_height])
        cylinder(d=bolt_diameter, h=bolt_length, $fn=$fn);
    }
}