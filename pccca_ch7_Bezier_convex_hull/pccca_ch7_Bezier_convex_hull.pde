/* Interpolating a Bézier 
 curve within a convex hull 
 **************************
 Click the screen a couple of
 times to iteratively generate 
 the curve
 
 Ira Greenberg, December, 2005
 Updated, January 7, 2014
 */

int startingPVectors = 3;
PVector[] bezier = new PVector[startingPVectors];

void setup(){
  size(600, 400);
  background(255);
  
  // create external bezier
  bezier[0] = new PVector(10, 390);
  bezier[1] = new PVector(300, 10);
  bezier[2] = new PVector(590, 390);
  // plot initial convex hull
  plot(bezier);
}

PVector[] plotBezier(PVector[] pts){
  PVector[] path = new PVector[pts.length+1];
  path[0] = pts[0];
  for (int i=1; i<path.length-1; i++){  
    path[i] = new PVector((pts[i-1].x+pts[i].x)/2,
(pts[i-1].y+pts[i].y)/2);
  }
  path[path.length-1] = pts[pts.length-1];
  plot(path);
  return path;
}

void plot(PVector[] pts){
  /*** render hull ***/
  if (pts.length==startingPVectors){
    noFill();
    stroke(0);
    strokeWeight(2);
    //path
    beginShape();
    for (int i=0; i<pts.length; i++){
      vertex(pts[i].x, pts[i].y);
    }
    endShape();

    //points
    fill(255);
    for (int i=0; i<pts.length; i++){
      if (i>0 && i<pts.length-1){
        rectMode(CENTER);
        // control point
        rect(pts[i].x, pts[i].y, 12, 12);
      } 
      else {
        // anchor points
        ellipse(pts[i].x, pts[i].y, 12, 12);
      }
    }
  } 
  /*** render interpolated path ***/
  else {
    // path
    noFill();
    stroke(100);
    strokeWeight(1);
    beginShape();
    for (int i=1; i<pts.length-1; i++){
      vertex(pts[i].x, pts[i].y);
    }
    endShape();
    // points
    fill(0);
    for (int i=1; i<pts.length-1; i++){
      ellipse(pts[i].x, pts[i].y, 4, 4);
    }
  }
}

/* draw function required when
 including mousePressed function*/
void draw(){}
void mousePressed(){
  bezier =  plotBezier(bezier);
}


