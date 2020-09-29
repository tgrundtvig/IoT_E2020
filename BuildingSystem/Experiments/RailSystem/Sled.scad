width = 34;
length = 24;
height = 5;

translate([-25,0,4])
rotate([0,180,0])
TractionSledTop();
translate([-5,0,4])
TractionSledBottom();




//translate([5,0,3+4])
translate([20,0,2.5])
rotate([0,90,0])
WheelMount();

translate([10,0,2.5])
rotate([0,90,0])
WheelMount();


/*
translate([0,0,7])
rotate([0,90,0])
difference()
{
    cylinder(d=30, h=4, center=true, $fn=128);
    cylinder(d=3.4, h=5, center=true, $fn=32);
}
*/

module WheelMount()
{
    difference()
    {
        union()
        {
            cube([5,20,7], center=true);
            rotate([0,-90,0])
            translate([0,0,0.2])
            cylinder(d=5,h=5.4, center=true, $fn=32);
        }   
        translate([0,5,0])
        cylinder(d=3.4,h=12, center=true, $fn=32);
        translate([0,-5,0])
        cylinder(d=3.4,h=12, center=true, $fn=32);
        rotate([0,90,0])
        translate([0,0,0])
        cylinder(d=3.4,h=12, center=true, $fn=32);
    }
}
        
//Sled();
//BallbearingCutout();
//SingleWheel2();

module HalfSled()
{
    difference()
    {
        Sled();
        translate([0.5*width+5,0,-0.5*height])
        cube([width,length*3,height+2], center=true);
    }
}

module BB3x10x4Holder()
{
    translate([0,5,0])
    difference()
    {
        translate([0,0,-2.5])
        union()
        {
            cube([20,10,5], center=true);
            translate([0,5,0])
            cylinder(d=20,h=5, center=true, $fn=128);
        }
        translate([0,17,-2.5])
        cube([22,10,7], center=true);
        translate([0,10,0])
        BallbearingCutout();
        translate([5,0,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
        translate([-5,0,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32); 
    }
}

module SingleWheel()
{
    difference()
    {
        translate([0,0,-0.5*height])
        cylinder(d=width-6, h=height, $fn= 64, center=true);
        translate([0.5*width+5,0,-0.5*height])
        cube([width,length*3,height+2], center=true);
        
        translate([-(0.5*width-5),0,0])
        BallbearingCutout();
        
        translate([0,0,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
        translate([0,10,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
        translate([0,-10,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32);     
    }
}

module SingleWheel2()
{
    difference()
    {
        union()
        {
            translate([0,3,-2])
            cylinder(d=10, h=4, $fn=64, center=true);
            translate([0,19,-2])
            cube([10,32,4], center=true);
        }
        translate([0,0,0])
        BallbearingCutout();
        translate([0,10,0])
        cylinder(d=3.4,h=10, center=true, $fn=32);
        translate([0,20,0])
        cylinder(d=3.4,h=10, center=true, $fn=32);
        translate([0,30,0])
        cylinder(d=3.4,h=10, center=true, $fn=32);
    }
}


module Sled()
{
    translate([-10,0,4])
    SledTop();
    translate([10,0,4])
    SledBottom();
}

module SledBase()
{
    difference()
    {
        translate([0,0,-2])
        union()
        { 
            cube([18,20,4], center=true);
            translate([0,10,0])
            cylinder(d=18, h=4, $fn=64, center=true);
            translate([0,-10,0])
            cylinder(d=18, h=4, $fn=64, center=true);
        }
        translate([7,12,0])
        BallbearingCutout();
        translate([-7,12,0])
        BallbearingCutout();
        translate([7,-12,0])
        BallbearingCutout();
        translate([-7,-12,0])
        BallbearingCutout();
        /*
        translate([5,0,0])
        rotate([0,90,0])
        ballbearingCutout();
        translate([-5,0,0])
        rotate([0,90,0])
        ballbearingCutout();
        rotate([0,90,0])
        cylinder(d=3.4,h=21,center=true, $fn=32);
        */
    }
}

module TractionSledBase()
{
    difference()
    {
        translate([0,0,-2])
        union()
        { 
            cube([18,32,4], center=true);
            translate([0,16,0])
            cylinder(d=18, h=4, $fn=64, center=true);
            translate([0,-16,0])
            cylinder(d=18, h=4, $fn=64, center=true);
        }
        translate([7,18,0])
        BallbearingCutout();
        translate([-7,18,0])
        BallbearingCutout();
        translate([7,-18,0])
        BallbearingCutout();
        translate([-7,-18,0])
        BallbearingCutout();
        
    }
}

module TractionSledTop()
{
    difference()
    {
        rotate([0,180,0])
        difference()
        {
            TractionSledBase();
            translate([5,5,0])
            cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
            translate([-5,5,0])
            cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
            translate([5,-5,0])
            cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
            translate([-5,-5,0])
            cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
        }
        translate([0,0,7])
        rotate([0,90,0])
        cylinder(d=30, h=4.6, center=true, $fn=128);
    }     
}

module TractionSledBottom()
{
    difference()
    {
        TractionSledBase();
        translate([5,5,-4])
        ScrewCutout(5);
        translate([-5,5,-4])
        ScrewCutout(5);
        translate([5,-5,-4])
        ScrewCutout(5);
        translate([-5,-5,-4])
        ScrewCutout(5);
        translate([0,0,7])
        rotate([0,90,0])
        cylinder(d=30, h=4.6, center=true, $fn=128);
    }
}

module SledTop()
{
    difference()
    {
        SledBase();
        translate([0,5,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
        translate([0,-5,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
        translate([5,0,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
        translate([-5,0,0])
        cylinder(d=3.4,h=2*height+1, center=true, $fn=32);
    }
}

module SledBottom()
{
    difference()
    {
        SledBase();
        translate([0,5,-4])
        ScrewCutout(5);
        translate([0,-5,-4])
        ScrewCutout(5);
        translate([5,0,-4])
        ScrewCutout(5);
        translate([-5,0,-4])
        ScrewCutout(5);
    }
}

module ScrewCutout(length)
{
    translate([0,0,-1])
    union()
    {
        cylinder(d=3.4, h=length+2, $fn=32);
        hull()
        {
            cylinder(d=6, h=3, $fn=32);
            cylinder(d=3.4, h=4, $fn=32);
        }
    }
}

module BallbearingCutout()
{
    difference()
    {
        cylinder(d=12, h=4.8, $fn=64, center=true);
        cylinder(d=2.8, h=6, $fn=32, center=true);
        translate([0,0,-3])
        cylinder(d=5, h=2, $fn=32, center=true);
        translate([0,0,3])
        cylinder(d=5, h=2, $fn=32, center=true);
    }
}
        
    