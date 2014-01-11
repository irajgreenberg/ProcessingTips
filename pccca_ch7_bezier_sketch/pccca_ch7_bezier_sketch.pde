/*
 Bezier sketch
 Ira Greenberg, December, 2005
 Updated, January 11, 2014
 */
size(400, 400);
background(255);

/*Processing PVector class offers a convenient
 datatype for holding publically accessible x,y 
 coords, (pt.x or pt.y)*/
PVector pt1 = new PVector(150, 300);
PVector pt2 = new PVector(100, 100);
PVector pt3 = new PVector(300, 100);
PVector pt4 = new PVector(250, 300);
//plot curve
stroke(0);
bezier(pt1.x, pt1.y, pt2.x, pt2.y, pt3.x, pt3.y, pt4.x, pt4.y);
//draw control PVectors connected to anchor PVectors
stroke(150);
line(pt1.x, pt1.y, pt2.x, pt2.y);
line(pt3.x, pt3.y, pt4.x, pt4.y);
//control PVectors
ellipse(pt2.x, pt2.y, 10, 10);
ellipse(pt3.x, pt3.y, 10, 10);
//anchor PVectors
rectMode(CENTER);
rect(pt1.x, pt1.y, 10, 10);
rect(pt4.x, pt4.y, 10, 10);

