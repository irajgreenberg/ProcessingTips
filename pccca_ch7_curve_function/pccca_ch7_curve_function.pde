/*
 Curve Function
 -Based on a Catmull-Rom Spline implementation
 Ira Greenberg, December, 2005
 Updated, January 7, 2014
 */

size(500, 500);
background(255);

PVector p0 = new PVector(150, 100);
PVector p1 = new PVector(350, 100);
PVector p2 = new PVector(350, 300);
PVector p3 = new PVector(150, 300);
PVector p4 = new PVector(100, 400);

//curve segments
curve(p4.x, p4.y, p0.x, p0.y, p1.x, p1.y, p2.x, p2.y);
curve(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
curve(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
curve(p2.x, p2.y, p3.x, p3.y, p4.x, p4.y, p0.x, p0.y );

//control points
ellipse(p0.x, p0.y, 10, 10);
ellipse(p1.x, p1.y, 10, 10);
ellipse(p2.x, p2.y, 10, 10);
ellipse(p3.x, p3.y, 10, 10);
ellipse(p4.x, p4.y, 10, 10);


