/*
 Curves II
 Ira Greenberg, December 4, 2005
 Updated January 7, 2014
 */
 
int particles = 25;
float[]x = new float[particles];
float[]y = new float[particles];
float[]xSpeed = new float[particles];
float[]ySpeed = new float[particles];
float[]accel = new float[particles];
float gravity = .75;

void setup(){
  size(800, 400);
  background(0);
  strokeWeight(1.5);
  stroke(255);

  //fill speed arrays with initial values
  for ( int i =0; i< particles; i++){
    xSpeed[i] = random(.75, 1.2);
    accel[i] = random(.005, .2);
  }

  for ( int i =0; i< particles; i++){
    //stop  particle on collision with right edge of display window
    while(x[i]<width){
      x[i]+=xSpeed[i];

      // double assignment creates y acceleration
      ySpeed[i] += accel[i];
      y[i]+=ySpeed[i];
      point(x[i], y[i]);

      // check ground dection only
      if ( y[i]>=height){
        // reverse particle direction
        ySpeed[i]*=-1;
        // lower particle speed
        ySpeed [i]*=gravity;
        // keep particle from sliding out of window
        y[i]=height;
      }
    }
  }
}


