
intersection()
{
    union()
    {
        union()
        {
            difference()
            {
                cylinder(d=14, h = 10, $fn=64);
                translate([0,0,2])
                cylinder(d=11, h = 6, $fn=64);
                
            }
            translate([0,0,2])
            cylinder(d1=5,d2=2.8,h=1, $fn=64);
            translate([0,0,7])
            cylinder(d1=2.8, d2=5,h=1, $fn=64);

        }
        translate([0,0,0])
        cylinder(d=2.8, h = 10, $fn = 64);
    }
    translate([7,0,-1])
    cylinder(d=20, h=12, $fn=64);
}
difference()
{
    cylinder(d=20,h=10, $fn=32);
    translate([0,0,-1])
    cylinder(d=17,h=12, $fn=32);
}