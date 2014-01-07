/*
 Concave/Convex Curves
 Ira Greenberg, December, 2005
 Updated, January 7, 2014
 */

size(200, 200);
background(255);
int x = width/2, y = height/2;
int w = 100, h = 100;
strokeWeight(4);
fill(0);
arc(x, y-h/2, w, h, 0, PI);
noFill();
arc(x, y+h/2, w, h, PI, PI*2);

