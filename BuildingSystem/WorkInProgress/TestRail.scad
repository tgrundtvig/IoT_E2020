
curve();

module curve()
{
    intersection()
    {
        cube([300,300,20]);
        rotate_extrude(convexity = 10, $fn=256)
        translate([150,0,0])
        polygon(points=[
                        [-42.5,0],
                        [-42.5,2],
                        [-20.5,2],
                        [-20.5,14],
                        [-17.5,14],
                        [-17.5,2],
                        [17.5,2],
                        [17.5,14],
                        [20.5,14],
                        [20.5,2],
                        [42.5,2],
                        [42.5,0]]);
    }
}

module straight()
{
    union()
    {
        translate([-40,0,1])
        cube([5,180,2], center=true);
        translate([40,0,1])
        cube([5,180,2], center=true);
        translate([-19,0,7])
        cube([3,180,14], center=true);
        translate([19,0,7])
        cube([3,180,14], center=true);
        for(i=[-2:2])
        {
            translate([0,i*(175/4),1])
            cube([80,5,2], center=true);
        }
    }
}

