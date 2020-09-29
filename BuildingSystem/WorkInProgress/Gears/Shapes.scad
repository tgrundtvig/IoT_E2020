Pie2D(10, 270-30, 270+30, 10);
    
module Pie2D(r, fromAngle, toAngle, steps)
{
    stepSize = (toAngle-fromAngle)/steps;
    points = [
        for(i = [0:steps])
        [r * cos(fromAngle+i*stepSize), r * sin(fromAngle+i*stepSize)]
    ];
    polygon(concat([[0, 0]], points));
}
