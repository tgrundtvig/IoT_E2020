//PlateUpTo(12);

UBrick(9,6,10,3.4,0.2);

//BasicBrick(10,1,1,10,3.4,0.2);

module PlateOfBricks(UpTo)
{
    for(i=[1:UpTo])
    {
            translate([i*5,i*15,0])
            BasicBrick(i,1,1,10,3.4,0.2);
            translate([i*5 + UpTo*5 + 10,i*15,0])
            BasicBrick(UpTo-i+1,1,1,10,3.4,0.2);
    }
}

module LBrick(sizeX, sizeY, unitSize, boltHoleD, sizeFitting)
{
    difference()
    {
        union()
        {
            cube([sizeX*unitSize-2*sizeFitting,
                  unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([0.5*unitSize*(sizeX-1),0.5*unitSize*(sizeY-1),0])
            cube([unitSize-2*sizeFitting,
                  sizeY*unitSize-2*sizeFitting,
                  unitSize], center=true);
        }
          
        for(x=[0:sizeX-2])
        {
  
                translate([ (-0.5*sizeX + 0.5 + x) * unitSize, 0, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(y=[0:sizeY-1])
        {
  
                translate([0.5*unitSize*(sizeX-1),  y*unitSize, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        for(x=[0:sizeX-1])
        {
          
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize,
                          (0.5*sizeY-0.5)*unitSize,
                          0 ])
            rotate([90,0,0])
            cylinder(d=boltHoleD, h=sizeY*unitSize+2, $fn=64, center=true);
        }
        
        for(y=[0:sizeY-1])
        {
            translate([ 0,
                        y * unitSize,
                        0])
            rotate([0,90,0])
            cylinder(d=boltHoleD, h=sizeX*unitSize+2, $fn=64, center=true);
            
        }
    }
}

module TBrick(sizeX, sizeY, unitSize, boltHoleD, sizeFitting)
{
    difference()
    {
        union()
        {
            cube([sizeX*unitSize-2*sizeFitting,
                  unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([0.5*unitSize*(sizeX-1),0,0])
            cube([unitSize-2*sizeFitting,
                  sizeY*unitSize-2*sizeFitting,
                  unitSize], center=true);
        }
          
        for(x=[0:sizeX-2])
        {
  
                translate([ (-0.5*sizeX + 0.5 + x) * unitSize, 0, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(y=[0:sizeY-1])
        {
  
                translate([0.5*unitSize*(sizeX-1),  (-0.5*sizeY + 0.5 + y) * unitSize, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        for(x=[0:sizeX-1])
        {
          
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize,
                            0,
                            (-0.5*1 + 0.5 + 0) * unitSize ])
                rotate([90,0,0])
                cylinder(d=boltHoleD, h=sizeY*unitSize+2, $fn=64, center=true);
        }
        
        for(y=[0:sizeY-1])
        {
            if( (sizeY % 2 == 1) || 
                (sizeY % 2 == 0 && !close(y,sizeY/2-1) && !close(y,sizeY/2) )     )
            {
                translate([ 0,
                            (-0.5*sizeY + 0.5 + y) * unitSize,
                            (-0.5*1 + 0.5 + 0) * unitSize ])
                rotate([0,90,0])
                cylinder(d=boltHoleD, h=sizeX*unitSize+2, $fn=64, center=true);
            }
            
        }
    }
}

module HBrick(sizeX, sizeY, unitSize, boltHoleD, sizeFitting)
{
    difference()
    {
        union()
        {
            cube([sizeX*unitSize-2*sizeFitting,
                  unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([0.5*unitSize*(sizeX-1),0,0])
            cube([unitSize-2*sizeFitting,
                  sizeY*unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([-0.5*unitSize*(sizeX-1),0,0])
            cube([unitSize-2*sizeFitting,
                  sizeY*unitSize-2*sizeFitting,
                  unitSize], center=true);
        }
        
        for(x=[1:sizeX-2])
        {
                translate([ (-0.5*sizeX + 0.5 + x) * unitSize, 0, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(y=[0:sizeY-1])
        {
                translate([0.5*unitSize*(sizeX-1),  (-0.5*sizeY + 0.5 + y) * unitSize, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(y=[0:sizeY-1])
        {
  
                translate([-0.5*unitSize*(sizeX-1),  (-0.5*sizeY + 0.5 + y) * unitSize, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(x=[0:sizeX-1])
        {
          
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize,
                            0,
                            (-0.5*1 + 0.5 + 0) * unitSize ])
                rotate([90,0,0])
                cylinder(d=boltHoleD, h=sizeY*unitSize+2, $fn=64, center=true);
        }
        
        for(y=[0:sizeY-1])
        {
            if( (sizeY % 2 == 1) || 
                (sizeY % 2 == 0 && !close(y,sizeY/2-1) && !close(y,sizeY/2) )     )
            {
                translate([ 0,
                            (-0.5*sizeY + 0.5 + y) * unitSize,
                            (-0.5*1 + 0.5 + 0) * unitSize ])
                rotate([0,90,0])
                cylinder(d=boltHoleD, h=sizeX*unitSize+2, $fn=64, center=true);
            }
            
        }
    }
}

module UBrick(sizeX, sizeY, unitSize, boltHoleD, sizeFitting)
{
    difference()
    {
        union()
        {
            translate([0,-0.5*unitSize*(sizeY-1),0])
            cube([sizeX*unitSize-2*sizeFitting,
                  unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([0.5*unitSize*(sizeX-1),0,0])
            cube([unitSize-2*sizeFitting,
                  sizeY*unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([-0.5*unitSize*(sizeX-1),0,0])
            cube([unitSize-2*sizeFitting,
                  sizeY*unitSize-2*sizeFitting,
                  unitSize], center=true);
        }
        
        for(x=[1:sizeX-2])
        {
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize, 0.5*unitSize*(sizeY-1), 0])
            cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true); 
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize, -0.5*unitSize*(sizeY-1), 0])
            cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);
        }
        
        for(y=[0:sizeY-1])
        {
                translate([0.5*unitSize*(sizeX-1),  (-0.5*sizeY + 0.5 + y) * unitSize, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(y=[0:sizeY-1])
        {
  
                translate([-0.5*unitSize*(sizeX-1),  (-0.5*sizeY + 0.5 + y) * unitSize, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(x=[0:sizeX-1])
        {
          
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize,
                            0,
                            (-0.5*1 + 0.5 + 0) * unitSize ])
                rotate([90,0,0])
                cylinder(d=boltHoleD, h=sizeY*unitSize+2, $fn=64, center=true);
        }
        
        for(y=[0:sizeY-1])
        {
            translate([ 0,
                        (-0.5*sizeY + 0.5 + y) * unitSize,
                        (-0.5*1 + 0.5 + 0) * unitSize ])
            rotate([0,90,0])
            cylinder(d=boltHoleD, h=sizeX*unitSize+2, $fn=64, center=true);
        }
    }
}

module Frame(sizeX, sizeY, unitSize, boltHoleD, sizeFitting)
{
    difference()
    {
        union()
        {
            translate([0,0.5*unitSize*(sizeY-1),0])
            cube([sizeX*unitSize-2*sizeFitting,
                  unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([0,-0.5*unitSize*(sizeY-1),0])
            cube([sizeX*unitSize-2*sizeFitting,
                  unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([0.5*unitSize*(sizeX-1),0,0])
            cube([unitSize-2*sizeFitting,
                  sizeY*unitSize-2*sizeFitting,
                  unitSize], center=true);
            translate([-0.5*unitSize*(sizeX-1),0,0])
            cube([unitSize-2*sizeFitting,
                  sizeY*unitSize-2*sizeFitting,
                  unitSize], center=true);
        }
        
        for(x=[1:sizeX-2])
        {
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize, 0.5*unitSize*(sizeY-1), 0])
            cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true); 
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize, -0.5*unitSize*(sizeY-1), 0])
            cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);
        }
        
        for(y=[0:sizeY-1])
        {
                translate([0.5*unitSize*(sizeX-1),  (-0.5*sizeY + 0.5 + y) * unitSize, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(y=[0:sizeY-1])
        {
  
                translate([-0.5*unitSize*(sizeX-1),  (-0.5*sizeY + 0.5 + y) * unitSize, 0])
                cylinder(d=boltHoleD, h=unitSize+2, $fn=64, center=true);   
        }
        
        for(x=[0:sizeX-1])
        {
          
            translate([ (-0.5*sizeX + 0.5 + x) * unitSize,
                            0,
                            (-0.5*1 + 0.5 + 0) * unitSize ])
                rotate([90,0,0])
                cylinder(d=boltHoleD, h=sizeY*unitSize+2, $fn=64, center=true);
        }
        
        for(y=[0:sizeY-1])
        {
            translate([ 0,
                        (-0.5*sizeY + 0.5 + y) * unitSize,
                        (-0.5*1 + 0.5 + 0) * unitSize ])
            rotate([0,90,0])
            cylinder(d=boltHoleD, h=sizeX*unitSize+2, $fn=64, center=true);
        }
    }
}

module Plate(sizeX, sizeY, unitSize, boltHoleD, sizeFitting)
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

function close(a,b) = abs(a-b) < 0.01;