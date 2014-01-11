/*
 Concentric Circles
 Ira Greenberg, December, 2005
 Updated, January 14, 2014
 */
size(200, 200);
background(255);
int x = width/2, y = height/2;
int w = 100, h = 100;
strokeWeight(4);
fill(0);
arc(x, y, w-50, h-50, 0, PI*2);
noFill();
arc(x, y, w, h, 0, TWO_PI);

