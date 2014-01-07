/*
 Waves with Damping
 Ira Greenberg, December, 2005
 Updated January 7, 2014
 */

size(400, 200);
background(0);

float angle = 0;
float amplitude = 30;
float x = 0, y = 0;
float xSpeed = 1;
float frequency = 6.0;
float damping = .994;
stroke(255);
strokeWeight(3);

for (int i=0; i<width; i+=xSpeed) {
  x += xSpeed;
  //sin
  y = height/3 + sin(radians(angle))*amplitude;
  point(x, y);
  //cosine
  y = 2*(height/3) + cos(radians(angle))*amplitude;
  point(x, y);
  amplitude*=damping;
  angle+=frequency;
}

