/*
 1st degree polynomial
 y = 3x
 Ira Greenberg, December, 2005
 Updated, January 7, 2014
 */

size(200, 200);
background(255);
strokeWeight(3);
float x = 0, y = 0;
for (int i=0; i<100; i++) {
  x = i;
  y = 2*x;
  point(x, y);
}

