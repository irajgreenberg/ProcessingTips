/*
 Curve I
 Ira Greenberg, December 3, 2005
 Updated, January 14, 2014
 */
 
size(200, 200);
background(255);
int margin = height/15;
strokeWeight(5);

float x = margin, y = margin;
float xSpeed = 1.1, ySpeed = 1.02;
while(y<height-margin){
  point(x, y);
  x+=xSpeed; // arithmetic progression
  y*=ySpeed; // geometric progression
}


