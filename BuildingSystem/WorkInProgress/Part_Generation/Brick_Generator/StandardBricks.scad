// Author: Tobias Grundtvig
use <../Bolts/Bolts.scad>


//Dimensions:
g_unit_size = 15;
g_bolt_diameter = 3;
g_nut_hole_width = 5.8;
g_nut_hole_depth = 3.5;

//Printer config
g_fitting = 0.2;
g_fix_overhang = true;
g_overhang_factor = 0.8; //How many vertical units per horizontal unit

//derived subunit size
g_subg_unit_size = g_unit_size / 6;


//Unit and subunit translations
module translate_units(v=[0,0,0])
{
    translate([g_unit_size*v[0], g_unit_size*v[1], g_unit_size*v[2]])
        children();
}

module translate_subunits(v=[0,0,0])
{
    translate([subg_unit_size*v[0], subg_unit_size*v[1], subg_unit_size*v[2]])
        children();
}


Plate_Of_Bricks(10, $fn=32);

//U_Brick(9,6,10,3.4,0.2);
//Basic_Brick(size_x=2, size_y=1, size_z=1, simplify=false, $fn=16);
//Half_Brick(size_x=6, size_y=4, $fn=16); 
//Basic_Brick_Printable(size_x=2, size_y=1, size_z=1, fix_overhang=true, fitting=0.2, $fn=32);

/*
Hole_Cutout(length=2,
            g_unit_size=10,
            g_bolt_diameter=3,
            g_nut_hole_width=5.5,
            g_nut_hole_depth=3,
            turned=true,
            center=true,
            fix_overhang=true,
            fitting=0,
            $fn=32            );
*/
//Half_Brick(10,1,,10,3.4,0.2);

module Plate_Of_Bricks(UpTo, $fn=$fn)
{
    for(i=[2:UpTo])
    {
            translate([i*(g_unit_size/2),(i-1)*(g_unit_size+5),0])
            Basic_Brick_Printable(i,1,1,true,0.2,$fn);
            translate([5+(i+UpTo+2)*(g_unit_size/2),(i-1)*(g_unit_size+5),0])
            Basic_Brick_Printable(UpTo-i+2,1,1,true,0.2,$fn);
    }
}

module Basic_Brick(size_x, size_y, size_z, simplify=false, $fn=$fn)
{
    color("blue")
    if(simplify)
    {
        cube([size_x*g_unit_size, size_y*g_unit_size, size_z*g_unit_size], center=true);
    }
    else
    {
        Basic_Brick_Printable(size_x=size_x, size_y=size_y, size_z=size_z, $fn=$fn);
    }
}

module Basic_Brick_Printable(size_x, size_y, size_z, fix_overhang=false, fitting=0, $fn=$fn)
{
    difference()
    {
        cube([  size_x*g_unit_size-2*fitting,
                size_y*g_unit_size-2*fitting,
                size_z*g_unit_size-fitting    ], center=true);
        if(size_x <= 2)
        {
            X_Axis_Holes(   size_x, size_y, size_z,
                            fix_overhang=fix_overhang, fitting=fitting, $fn=$fn);
        }
        
        if(size_y <= 2)
        {    
            Y_Axis_Holes(   size_x, size_y, size_z,
                            fix_overhang=fix_overhang, fitting=fitting, $fn=$fn);
        }
        
        if(size_z <= 2)
        {
            Z_Axis_Holes(   size_x, size_y, size_z,
                            fix_overhang=fix_overhang, fitting=fitting, $fn=$fn);
        }       
    }
}

module Half_Brick_Printable(size_x, size_y, fitting=0) //A basic brick with only z-axis holes
{
    difference()
    {
        cube([  size_x*g_unit_size-2*fitting,
                size_y*g_unit_size-2*fitting,
                g_unit_size*0.5 /*-2*fitting*/    ], center=true);
        rotate([180,0,0])
        Z_Axis_Holes(size_x, size_y, 0.5, nut_count=1, fix_overhang=false, fitting=fitting, $fn=$fn);
    }
}

module Half_Brick(size_x, size_y) //A plate, half the size in the Z-axis
{
    color("blue")
    Half_Brick_Printable(size_x, size_y); 
}

module Frame(size_x, size_y, g_unit_size, g_bolt_diameter, fitting)
{
    difference()
    {
        union()
        {
            translate([0,0.5*g_unit_size*(size_y-1),0])
            cube([size_x*g_unit_size-2*fitting,
                  g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([0,-0.5*g_unit_size*(size_y-1),0])
            cube([size_x*g_unit_size-2*fitting,
                  g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([0.5*g_unit_size*(size_x-1),0,0])
            cube([g_unit_size-2*fitting,
                  size_y*g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([-0.5*g_unit_size*(size_x-1),0,0])
            cube([g_unit_size-2*fitting,
                  size_y*g_unit_size-2*fitting,
                  g_unit_size], center=true);
        }
        
        for(x=[1:size_x-2])
        {
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size, 0.5*g_unit_size*(size_y-1), 0])
            cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true); 
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size, -0.5*g_unit_size*(size_y-1), 0])
            cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);
        }
        
        for(y=[0:size_y-1])
        {
                translate([0.5*g_unit_size*(size_x-1),  (-0.5*size_y + 0.5 + y) * g_unit_size, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(y=[0:size_y-1])
        {
  
                translate([-0.5*g_unit_size*(size_x-1),  (-0.5*size_y + 0.5 + y) * g_unit_size, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(x=[0:size_x-1])
        {
          
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size,
                            0,
                            (-0.5*1 + 0.5 + 0) * g_unit_size ])
                rotate([90,0,0])
                cylinder(d=g_bolt_diameter, h=size_y*g_unit_size+2, $fn=64, center=true);
        }
        
        for(y=[0:size_y-1])
        {
            translate([ 0,
                        (-0.5*size_y + 0.5 + y) * g_unit_size,
                        (-0.5*1 + 0.5 + 0) * g_unit_size ])
            rotate([0,90,0])
            cylinder(d=g_bolt_diameter, h=size_x*g_unit_size+2, $fn=64, center=true);
        }
    }
}

module L_Brick(size_x, size_y, g_unit_size, g_bolt_diameter, fitting)
{
    difference()
    {
        union()
        {
            cube([size_x*g_unit_size-2*fitting,
                  g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([0.5*g_unit_size*(size_x-1),0.5*g_unit_size*(size_y-1),0])
            cube([g_unit_size-2*fitting,
                  size_y*g_unit_size-2*fitting,
                  g_unit_size], center=true);
        }
          
        for(x=[0:size_x-2])
        {
  
                translate([ (-0.5*size_x + 0.5 + x) * g_unit_size, 0, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(y=[0:size_y-1])
        {
  
                translate([0.5*g_unit_size*(size_x-1),  y*g_unit_size, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        for(x=[0:size_x-1])
        {
          
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size,
                          (0.5*size_y-0.5)*g_unit_size,
                          0 ])
            rotate([90,0,0])
            cylinder(d=g_bolt_diameter, h=size_y*g_unit_size+2, $fn=64, center=true);
        }
        
        for(y=[0:size_y-1])
        {
            translate([ 0,
                        y * g_unit_size,
                        0])
            rotate([0,90,0])
            cylinder(d=g_bolt_diameter, h=size_x*g_unit_size+2, $fn=64, center=true);
            
        }
    }
}

module T_Brick(size_x, size_y, g_unit_size, g_bolt_diameter, fitting)
{
    difference()
    {
        union()
        {
            cube([size_x*g_unit_size-2*fitting,
                  g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([0.5*g_unit_size*(size_x-1),0,0])
            cube([g_unit_size-2*fitting,
                  size_y*g_unit_size-2*fitting,
                  g_unit_size], center=true);
        }
          
        for(x=[0:size_x-2])
        {
  
                translate([ (-0.5*size_x + 0.5 + x) * g_unit_size, 0, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(y=[0:size_y-1])
        {
  
                translate([0.5*g_unit_size*(size_x-1),  (-0.5*size_y + 0.5 + y) * g_unit_size, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        for(x=[0:size_x-1])
        {
          
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size,
                            0,
                            (-0.5*1 + 0.5 + 0) * g_unit_size ])
                rotate([90,0,0])
                cylinder(d=g_bolt_diameter, h=size_y*g_unit_size+2, $fn=64, center=true);
        }
        
        for(y=[0:size_y-1])
        {
            if( (size_y % 2 == 1) || 
                (size_y % 2 == 0 && !close(y,size_y/2-1) && !close(y,size_y/2) )     )
            {
                translate([ 0,
                            (-0.5*size_y + 0.5 + y) * g_unit_size,
                            (-0.5*1 + 0.5 + 0) * g_unit_size ])
                rotate([0,90,0])
                cylinder(d=g_bolt_diameter, h=size_x*g_unit_size+2, $fn=64, center=true);
            }
            
        }
    }
}

module H_Brick(size_x, size_y, g_unit_size, g_bolt_diameter, fitting)
{
    difference()
    {
        union()
        {
            cube([size_x*g_unit_size-2*fitting,
                  g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([0.5*g_unit_size*(size_x-1),0,0])
            cube([g_unit_size-2*fitting,
                  size_y*g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([-0.5*g_unit_size*(size_x-1),0,0])
            cube([g_unit_size-2*fitting,
                  size_y*g_unit_size-2*fitting,
                  g_unit_size], center=true);
        }
        
        for(x=[1:size_x-2])
        {
                translate([ (-0.5*size_x + 0.5 + x) * g_unit_size, 0, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(y=[0:size_y-1])
        {
                translate([0.5*g_unit_size*(size_x-1),  (-0.5*size_y + 0.5 + y) * g_unit_size, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(y=[0:size_y-1])
        {
  
                translate([-0.5*g_unit_size*(size_x-1),  (-0.5*size_y + 0.5 + y) * g_unit_size, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(x=[0:size_x-1])
        {
          
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size,
                            0,
                            (-0.5*1 + 0.5 + 0) * g_unit_size ])
                rotate([90,0,0])
                cylinder(d=g_bolt_diameter, h=size_y*g_unit_size+2, $fn=64, center=true);
        }
        
        for(y=[0:size_y-1])
        {
            if( (size_y % 2 == 1) || 
                (size_y % 2 == 0 && !close(y,size_y/2-1) && !close(y,size_y/2) )     )
            {
                translate([ 0,
                            (-0.5*size_y + 0.5 + y) * g_unit_size,
                            (-0.5*1 + 0.5 + 0) * g_unit_size ])
                rotate([0,90,0])
                cylinder(d=g_bolt_diameter, h=size_x*g_unit_size+2, $fn=64, center=true);
            }
            
        }
    }
}

module U_Brick(size_x, size_y, g_unit_size, g_bolt_diameter, fitting)
{
    difference()
    {
        union()
        {
            translate([0,-0.5*g_unit_size*(size_y-1),0])
            cube([size_x*g_unit_size-2*fitting,
                  g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([0.5*g_unit_size*(size_x-1),0,0])
            cube([g_unit_size-2*fitting,
                  size_y*g_unit_size-2*fitting,
                  g_unit_size], center=true);
            translate([-0.5*g_unit_size*(size_x-1),0,0])
            cube([g_unit_size-2*fitting,
                  size_y*g_unit_size-2*fitting,
                  g_unit_size], center=true);
        }
        
        for(x=[1:size_x-2])
        {
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size, 0.5*g_unit_size*(size_y-1), 0])
            cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true); 
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size, -0.5*g_unit_size*(size_y-1), 0])
            cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);
        }
        
        for(y=[0:size_y-1])
        {
                translate([0.5*g_unit_size*(size_x-1),  (-0.5*size_y + 0.5 + y) * g_unit_size, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(y=[0:size_y-1])
        {
  
                translate([-0.5*g_unit_size*(size_x-1),  (-0.5*size_y + 0.5 + y) * g_unit_size, 0])
                cylinder(d=g_bolt_diameter, h=g_unit_size+2, $fn=64, center=true);   
        }
        
        for(x=[0:size_x-1])
        {
          
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size,
                            0,
                            (-0.5*1 + 0.5 + 0) * g_unit_size ])
                rotate([90,0,0])
                cylinder(d=g_bolt_diameter, h=size_y*g_unit_size+2, $fn=64, center=true);
        }
        
        for(y=[0:size_y-1])
        {
            translate([ 0,
                        (-0.5*size_y + 0.5 + y) * g_unit_size,
                        (-0.5*1 + 0.5 + 0) * g_unit_size ])
            rotate([0,90,0])
            cylinder(d=g_bolt_diameter, h=size_x*g_unit_size+2, $fn=64, center=true);
        }
    }
}


module Z_Axis_Holes(size_x, size_y, size_z, nut_count=2, fix_overhang=false, fitting=0, $fn=$fn)
{
    for(x=[0:size_x-1])
    {
        for(y=[0:size_y-1])
        {
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size,
                        (-0.5*size_y + 0.5 + y) * g_unit_size,
                        0 ])
            Hole_Cutout(length=size_z, nut_count=nut_count, center=true, fix_overhang=fix_overhang, fitting=fitting, $fn=$fn);
        }
    }
}

module Y_Axis_Holes(size_x, size_y, size_z, nut_count=2, fix_overhang=false, fitting=0, $fn=$fn)
{
    for(x=[0:size_x-1])
    {
        for(z=[0:size_z-1])
        {
            translate([ (-0.5*size_x + 0.5 + x) * g_unit_size,
                        0,
                        (-0.5*size_z + 0.5 + z) * g_unit_size ])
            rotate([90,0,0])
            Hole_Cutout(length=size_y, nut_count=nut_count, center=true, fix_overhang=fix_overhang, fitting=fitting, $fn=$fn);
        }
    }
}

module X_Axis_Holes(size_x, size_y, size_z, nut_count=2, fix_overhang=false, fitting=0, $fn=$fn)
{
    for(y=[0:size_y-1])
    {
        for(z=[0:size_z-1])
        {
            translate([ 0,
                        (-0.5*size_y + 0.5 + y) * g_unit_size,
                        (-0.5*size_z + 0.5 + z) * g_unit_size ])
            rotate([0,90,0])
            Hole_Cutout(length=size_x, nut_count=nut_count, center=true, fix_overhang=fix_overhang, fitting=fitting, $fn=$fn);
        }
    }
}

module Hole_Cutout( length,
                    nut_count=2,
                    turned=false,
                    center=false,
                    fix_overhang=true,
                    fitting=0.2,
                    $fn=$fn             )
{
    t = center ? length*g_unit_size/2 : 0;
    translate([0,0,-t])
    union()
    {
        if(nut_count > 0)
        {
            translate([0,0,-1])
            Hex_Nut_Cutout( thread_diameter=g_bolt_diameter,
                            wrench_size= g_nut_hole_width,
                            height=g_nut_hole_depth+1,
                            turned=turned,
                            center=false,
                            fix_overhang=fix_overhang,
                            fitting=g_fitting);
        }
        cylinder(d=g_bolt_diameter+2*fitting, h=length*g_unit_size+2*fitting+1, $fn=$fn);
        if(nut_count > 1)
        {
            translate([0,0,length*g_unit_size+1])
            rotate([180,0,0])
            Hex_Nut_Cutout( thread_diameter=g_bolt_diameter,
                            wrench_size= g_nut_hole_width,
                            height=g_nut_hole_depth+1,
                            turned=turned,
                            center=false,
                            fix_overhang=fix_overhang,
                            fitting=g_fitting);
        }
        
    }
}
