//ToothShape2D(10);
//GrabWheel(16, 0.4);
//ToothHole(5,10,5,0.4);
/*
translate([15,0,3])
intersection()
{
    difference()
    {
        translate([0,0,-5])
        cube([500,500,10], center=true);
        StraightRailCut(1.5,2,2,3.95,26,0.4);
        CurveRailCut(1.5,2,2,3.95,160,100,0.4);
    }
    translate([-4,10,0])
    cube([20,60,6], center=true);
}
*/
/*
difference()
{
    GrabWheel(1.5,2,2,3.95,10,0.4);
    translate([0,0,1.5])
    cylinder(d=10.2, h=4, center=true, $fn=128);
}
*/


t1 = 3;
t2 = 3;
gearDist = 20;
width=4;
fitting = 0.2;

totalTeeth = t1+t2;


//NewTooth2(width,height,minR,maxR);


//translate([40,0,0])
TestWheel3(width, gearDist, totalTeeth, t1, fitting);
translate([0,gearDist,0])
if(t1%2==0)
{
    rotate([0,0,180/t2])
    TestWheel3(width, gearDist, totalTeeth, t2, fitting);
}
else
{
    TestWheel3(width, gearDist, totalTeeth, t2, fitting);
}



/*
difference()
{
    union()
    {
        translate([0,0,maxR])
        cube([width+2*maxR,2*(maxR+minR)+maxR,2*maxR], center=true);
        NewTooth(width,height,minR,maxR);
    }
    translate([0,minR+maxR,-height])
    rotate([180,0,0])
    NewTooth(width+20,height,minR,maxR);
    translate([0,minR+maxR,-height])
    rotate([200,0,0])
    NewTooth(width,height,minR,maxR);
}

CurveRail(2,3,2,3.95,23,100,0.4);
translate([-100,200,0])
rotate([0,0,180])
CurveRail(2,3,2,3.95,37,150,0.4);
*/

module TestWheel(width, height, minR, maxR, t, fitting)
{
    toothSpacing = 2*(minR+maxR);
    r=t*toothSpacing/(2*PI);
    difference()
    {
        union()
        {
            for(i=[0:t-1])
            {
                rotate([i*(360/t),0,0])
                translate([0,0,-r])
                NewTooth(width,height,minR-fitting,maxR-fitting);
            }
            rotate([0,90,0])
            cylinder(r=r,h=width+2*maxR, $fn=64, center=true);
        }
        for(i=[0:t-1])
        {
            rotate([(i+0.5)*(360/t),0,0])
            translate([0,0,-height-r])
            rotate([180,0,0])
            NewTooth(width,height,minR+fitting,maxR+fitting);
        }
        rotate([0,90,0])
        cylinder(r=r-5,h=width+2*maxR+2, $fn=64, center=true);
        
        rotate([0,90,0])
        translate([0,0,maxR+0.5*width])
        cylinder(r=r+height+minR+maxR,h=2*maxR, $fn=32, center=true);
        rotate([0,-90,0])
        translate([0,0,maxR+0.5*width])
        cylinder(r=r+height+minR+maxR,h=2*maxR, $fn=32, center=true);
        
    }
}

module GrabWheel(smallSize, largeSize, height, toothspacing, t, fitting)
{
    r=t*toothspacing/(2*PI);
    r2=r*(r/pow(r*r+0.75*largeSize*0.75*largeSize,0.5));
    //translate([0,0,r])
    translate([0,0,(largeSize-fitting)])
    rotate([0,90,0])
    union()
    {
        for(i=[0:t-1])
        {
            rotate([i*(360/t),0,0])
            translate([0,0,-r2])
            GrabTooth(smallSize,largeSize,height, fitting);
        }
        rotate([0,90,0])
        cylinder(r=r,h=2*(largeSize-fitting), $fn=256, center=true);
    }
}
    

module GrabTooth(smallSize, largeSize, height, fitting)
{
    translate([0,0,-height])
    hull()
    {
        translate([0,0,fitting])
        ToothShape2D(smallSize-fitting);
        translate([0,0,height-0.1])
        ToothShape2D(largeSize-fitting);
    }
}

module NewTooth(width, height, radiusMin, radiusMax)
{
    hull()
    {
        translate([0.5*width,0,0])
        sphere(r=radiusMax, $fn=16);
        translate([-0.5*width,0,0])
        sphere(r=radiusMax, $fn=16);
        translate([0.5*width,0,-height])
        sphere(r=radiusMin, $fn=16);
        translate([-0.5*width,0,-height])
        sphere(r=radiusMin, $fn=16);
    }
}

module TestWheel2(width, height, minR, maxR, t, fitting)
{
    toothSpacing = 2*(minR+maxR);
    r=t*toothSpacing/(2*PI);
    difference()
    {
        union()
        {
            for(i=[0:t-1])
            {
                rotate([0,0,i*(360/t)])
                translate([0,-r,0])
                NewTooth2(width,height,minR-fitting,maxR-fitting);
            }
            cylinder(r=r,h=width, $fn=64, center=true);
        }
        for(i=[0:t-1])
        {
            rotate([0,0,(i+0.5)*(360/t)])
            translate([0,-height-r,0])
            rotate([0,0,180])
            NewTooth2(width+2,height,minR+fitting,maxR+fitting);
        }
        cylinder(d=10.2,h=width+2*maxR+2, $fn=64, center=true);      
    }
}


module TestWheel3(width, gearDist, totalTeeth, numTeeth, fitting)
{
    teethR = 0.5*gearDist*PI/totalTeeth;
    gearR = numTeeth*gearDist/totalTeeth;
    difference()
    {
        union()
        {
            for(i=[0:numTeeth-1])
            {
                rotate([0,0,i*(360/numTeeth)])
                translate([0,-gearR,0])
                cylinder(r=teethR-fitting, h=width, center=true, $fn=16);
            }
            cylinder(r=gearR, h=width, $fn=64, center=true);
        }
        for(i=[0:numTeeth-1])
        {
            rotate([0,0,(i+0.5)*(360/numTeeth)])
            translate([0,-gearR,0])
            cylinder(r=teethR+fitting, h=width+2, center=true, $fn=16);
        }
        cylinder(d=3.4,h=width+2, $fn=64, center=true);      
    }
}

module NewTooth2(width, height, radiusMin, radiusMax)
{
    hull()
    {
        cylinder(r=radiusMax, h=width, center=true, $fn=32);
        translate([0,-height,0])
        cylinder(r=radiusMin, h=width, center=true, $fn=32);
    }
}
        

module ToothShape2D(size)
{
    hull()
    {
        translate([-0.5*size,0,0])
        cylinder(d=size, h=0.1, $fn=32);
        translate([0.5*size,0,0])
        cylinder(d=size, h=0.1, $fn=32);
    }
}

module ToothHole(smallSize, largeSize, height, fitting)
{
    union()
    {
        translate([0,0,-height])
        hull()
        {
            translate([0,0,0.05-fitting])
            cube([smallSize*1.5+fitting,smallSize+fitting,0.1], center=true);
            translate([0,0,height-0.05])
            cube([largeSize*1.5+fitting,largeSize+fitting,0.1], center=true);
        }
        translate([0,0,0.5])
        cube([largeSize*1.5+fitting,largeSize+fitting,1.01], center=true);
    }
}

module StraightRailCut(smallSize, largeSize, height, toothSpacing, t, fitting)
{
    //border = toothSpacing-largeSize;
    //length = t*toothSpacing+border;
    
    border = 1;
    length = t*4+border;
    translate([0,0,0.001])
    //translate([0,-border+0.5*largeSize,0])
        for(i=[0:t-1])
        {
            //translate([0,i*toothSpacing,0])
            translate([0,i*4,0])
            //ToothHole(smallSize,largeSize,height,fitting);
            GrabTooth(smallSize, largeSize, height, -fitting);
        }
    
}

module CurveRailCut(smallSize, largeSize, height, toothSpacing, t, curveRadius, fitting)
{
   //degreePerTooth = 360/(curveRadius*2*PI/toothSpacing);
   degreePerTooth = 360/(4*40);
   translate([-curveRadius,0,0.001])
   for(i=[0:t-1])
   {
     rotate([0,0,i*degreePerTooth])
     translate([curveRadius,0,0])
     //ToothHole(smallSize,largeSize,height,fitting);
     GrabTooth(smallSize, largeSize, height, -fitting);
   }
}

        