/*
 Trig Wave
 Ira Greenberg, December, 2005
 Updated, January 14, 2014
 */

size(400, 200);
background(0);
stroke(255);
float angle = 0;
float amplitude = 10;
float x = 0, y = 0;
float xSpeed = 1;
float frequency = 3.0;

for (int i = 0; i< width; i+=xSpeed) {
  strokeWeight(30);
  x+= xSpeed;
  //sin
  y = height/3 + sin(radians(angle))*amplitude;
  point(x, y);
  //cosine
  y = 2*(height/3) + cos(radians(angle))*amplitude;
  point(x, y);
  angle+=frequency;
}

