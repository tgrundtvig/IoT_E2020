//PlateUpTo(12);

//HalfBrick(10,3,10,3.4,0.2);

translate([0,-10,0])
BasicBrick(10,1,1,10,6.4,0.2);

translate([0,10,0])
BasicBrick(10,1,1,10,6.4,0.2);

/*
module PlateUpTo(UpTo)
{
    for(i=[1:UpTo])
    {
            translate([i*5,i*15,0])
            BasicBrick(i,1,1,10,6.4,0.2);
            translate([i*5 + UpTo*5 + 10,i*15,0])
            BasicBrick(UpTo-i+1,1,1,10,6.4,0.2);
    }
}
*/

module HalfBrick(sizeX, sizeY, unitSize, boltHoleD, sizeFitting)
{
    difference()
    {
        cube([  sizeX*unitSize-2*sizeFitting,
                sizeY*unitSize-2*sizeFitting,
                unitSize*0.5 /*-2*sizeFitting*/    ], center=true);
        for(x=[0:sizeX-1])
        {
            for(y=[0:sizeY-1])
            {
                translate([ (-0.5*sizeX + 0.5 + x) * unitSize,
                            (-0.5*sizeY + 0.5 + y) * unitSize,
                            0 ])
                cylinder(d=boltHoleD, h=0.5*unitSize+2, $fn=64, center=true);
            }
        }
   
    }
}

module BasicBrick(sizeX, sizeY, sizeZ, unitSize, boltHoleD, sizeFitting)
{
    difference()
    {
        cube([  sizeX*unitSize-2*sizeFitting,
                sizeY*unitSize-2*sizeFitting,
                sizeZ*unitSize /*-2*sizeFitting*/    ], center=true);
        for(x=[0:sizeX-1])
        {
            for(y=[0:sizeY-1])
            {
                translate([ (-0.5*sizeX + 0.5 + x) * unitSize,
                            (-0.5*sizeY + 0.5 + y) * unitSize,
                            0 ])
                cylinder(d=boltHoleD, h=sizeZ*unitSize+2, $fn=64, center=true);
            }
        }
        for(x=[0:sizeX-1])
        {
            for(z=[0:sizeZ-1])
            {
                translate([ (-0.5*sizeX + 0.5 + x) * unitSize,
                            0,
                            (-0.5*sizeZ + 0.5 + z) * unitSize ])
                rotate([90,0,0])
                cylinder(d=boltHoleD, h=sizeY*unitSize+2, $fn=64, center=true);
            }
        }
        for(y=[0:sizeY-1])
        {
            for(z=[0:sizeZ-1])
            {
                translate([ 0,
                            (-0.5*sizeY + 0.5 + y) * unitSize,
                            (-0.5*sizeZ + 0.5 + z) * unitSize ])
                rotate([0,90,0])
                cylinder(d=boltHoleD, h=sizeX*unitSize+2, $fn=64, center=true);
            }
        }
    }
}