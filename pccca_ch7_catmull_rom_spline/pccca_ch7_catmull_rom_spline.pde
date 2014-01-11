/*
 Catmull-Rom spline curve
 Curve Tightness
 Ira Greenberg, December, 2005
 Updated, January 14, 2014
 */
 
size(600, 400);
background(0);
stroke(255);
strokeWeight(2);
int curveWdth = 50;
int cols = 5;
int xPadding = (width-curveWdth*cols)/(cols+1);
int x = xPadding;

for (int i=-2; i<3; i++) {
  curveTightness(i);
  PVector p0 = new PVector(x, 100);
  PVector p1 = new PVector(x+curveWdth, 100);
  PVector p2 = new PVector(x+curveWdth, 300);
  PVector p3 = new PVector(x, 300);
  PVector p4 = new PVector(x, 200);
  x+=curveWdth+xPadding;

  //curve segments
  noFill(); // comment this line out  to see how the curve fills
  curve(p4.x, p4.y, p0.x, p0.y, p1.x, p1.y, p2.x, p2.y);
  curve(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  curve(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
  curve(p2.x, p2.y, p3.x, p3.y, p4.x, p4.y, p0.x, p0.y );

  //control PVectors
  fill(255);
  ellipse(p0.x, p0.y, 5, 5);
  ellipse(p1.x, p1.y, 5, 5);
  ellipse(p2.x, p2.y, 5, 5);
  ellipse(p3.x, p3.y, 5, 5);
  ellipse(p4.x, p4.y, 5, 5);
}

