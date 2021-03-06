/*
 Curve Ellipse
 Ira Greenberg, December 20, 2005
 revised November 15, 2006
 Updated, January 7, 2014
 */

float radius = 165;
float angle = 0;

//outer circle
float[]cx = new float[4];
float[]cy = new float[4];

//middle circle
float[]cx2 = new float[4];
float[]cy2 = new float[4];

void setup(){
  size(400, 400);
  background(255);
  strokeWeight(1.5);

  for (int i =0; i<4; i++){
    //outer ellipse
    cx[i] = width/2+cos(radians(angle))*radius;
    cy[i] = height/2+sin(radians(angle))*radius;

    //middle ellispe
    cx2[i] = width/2+cos(radians(angle))*(radius*.85);
    cy2[i] = height/2+sin(radians(angle))*(radius*.85);

    angle+=360.0/4.0;
  }

  //outer curve
  curveTightness(-3);
  curve(cx[3], cy[3], cx[0], cy[0], cx[1], cy[1], cx[2], cy[2]);
  curve(cx[0], cy[0], cx[1], cy[1], cx[2], cy[2], cx[3], cy[3]);
  curve(cx[1], cy[1], cx[2], cy[2], cx[3], cy[3], cx[0], cy[0]);
  curve(cx[2], cy[2], cx[3], cy[3], cx[0], cy[0], cx[1], cy[1]);

  //middle curve
  curveTightness(2);
  noFill();
  beginShape();
  curveVertex(cx2[3], cy2[3]);
  curveVertex(cx2[0], cy2[0]);
  curveVertex(cx2[1], cy2[1]);
  curveVertex(cx2[2], cy2[2]);
  curveVertex(cx2[3], cy2[3]);
  curveVertex(cx2[0], cy2[0]);
  curveVertex(cx2[1], cy2[1]);
  endShape();

  for (int i=0; i<4; i++){
    fill(255);
    ellipse(cx[i], cy[i], 10, 10);
    ellipse(cx2[i], cy2[i], 10, 10);
  }

  //inner curve
  curveEllipse(6, width/2, height/2, radius*.2, -8, 127, true);
  //inner, inner  curve
  curveEllipse(8, width/2, height/2, radius*.05, 0, 0, false);
}

// general spline ellipse plotting function
void curveEllipse(int pts, int x, int y, float radius, float tightness, 
 int fillCol, boolean isNodeVisible){
  float[]cx = new float[pts];
  float[]cy = new float[pts];
  float angle = 0;

  for (int i=0; i<pts; i++){
    cx[i] = x+cos(radians(angle))*(radius);
    cy[i] = y+sin(radians(angle))*(radius);
    angle+=360.0/pts;
  }

  curveTightness(tightness);
  beginShape();
  fill(fillCol);
  for (int i=0; i<pts; i++){
    if (i==0){
      curveVertex(cx[pts-1], cy[pts-1]);
    }
    curveVertex(cx[i], cy[i]);
    if (i==pts-1){
      curveVertex(cx[0], cy[0]);
      curveVertex(cx[1], cy[1]);
    }
  }
  endShape(CLOSE);
  // render control points
  if (isNodeVisible){
    fill(255);
    for (int i=0; i<pts; i++){
      ellipse(cx[i], cy[i], 10, 10);
    }
  }
}


