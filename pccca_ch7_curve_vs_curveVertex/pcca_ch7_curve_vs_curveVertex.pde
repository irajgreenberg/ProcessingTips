/*
 curve() vs. curveVertex()
 Ira Greenberg, December, 2005
 Updated, January 7, 2014
 */

size(650, 225);
background(255);
rectMode(CENTER);
strokeWeight(2);

//curve()
noFill();
curve(92, 15, 92, 15, 134, 15, 175, 50);
curve(92, 15, 134, 15, 175, 50, 175, 175);
curve(134, 15, 175, 50, 175, 175, 75, 175);
curve(175, 50, 175, 175, 75, 175, 75, 75);
curve(175, 175, 75, 175, 75, 75, 150, 75);
curve(75, 175, 75, 75, 150, 75, 150, 150);
curve(75, 75, 150, 75, 150, 150, 100, 150);
curve(150, 75, 150, 150, 100, 150, 100, 150);

//control points
strokeWeight(1);
fill(255);
ellipse(92, 15, 8, 8);
ellipse(134, 15, 8, 8);
ellipse(175, 50, 8, 8);
ellipse(175, 175, 8, 8);
ellipse(75, 175, 8, 8);
ellipse(75, 75, 8, 8);
ellipse(150, 75, 8, 8);
ellipse(150, 150, 8, 8);
ellipse(100, 150, 8, 8);

//curveVertex - closed and unfilled
strokeWeight(2);
int x = 200;
beginShape();
curveVertex(92+x, 15);
curveVertex(92+x, 15);
curveVertex(134+x, 15);
curveVertex(175+x, 50);
curveVertex(175+x, 175);
curveVertex(75+x, 175);
curveVertex(75+x, 75);
curveVertex(150+x, 75);
curveVertex(150+x, 150);
curveVertex(100+x, 150);
curveVertex(100+x, 150);
endShape(CLOSE);

//control handles
strokeWeight(1);
fill(255);
ellipse(92+x, 15, 8, 8);
ellipse(134+x, 15, 8, 8);
ellipse(175+x, 50, 8, 8);
ellipse(175+x, 175, 8, 8);
ellipse(75+x, 175, 8, 8);
ellipse(75+x, 75, 8, 8);
ellipse(150+x, 75, 8, 8);
ellipse(150+x, 150, 8, 8);
ellipse(100+x, 150, 8, 8);

//curveVertex() - open and filled
x = 400;
strokeWeight(2);
fill(127);
beginShape();
curveVertex(92+x, 15);
curveVertex(92+x, 15);
curveVertex(134+x, 15);
curveVertex(175+x, 50);
curveVertex(175+x, 175);
curveVertex(75+x, 175);
curveVertex(75+x, 75);
curveVertex(150+x, 75);
curveVertex(150+x, 150);
curveVertex(100+x, 150);
curveVertex(100+x, 150);
endShape();

//control handles
strokeWeight(1);
fill(255);
ellipse(92+x, 15, 8, 8);
ellipse(134+x, 15, 8, 8);
ellipse(175+x, 50, 8, 8);
ellipse(175+x, 175, 8, 8);
ellipse(75+x, 175, 8, 8);
ellipse(75+x, 75, 8, 8);
ellipse(150+x, 75, 8, 8);
ellipse(150+x, 150, 8, 8);
ellipse(100+x, 150, 8, 8);

