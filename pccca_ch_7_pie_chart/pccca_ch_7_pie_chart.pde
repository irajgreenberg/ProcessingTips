/*
 Pie Chart
 Ira Greenberg, December, 2005
 Updated, January 7, 2014
 */
 
size(400, 400);
background(0);
stroke(127);
fill(0);
int radius = 150;
int[]angs = {40, 10, 20, 35, 55, 30, 60, 110};
float lastAng = 0;
for (int i=0; i<angs.length; i++){
  fill(random(255));
  arc(width/2, height/2, radius*2, radius*2, lastAng, lastAng+=radians(angs[i]));
}


