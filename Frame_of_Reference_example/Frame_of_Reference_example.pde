int faceCount = 50;
Plane[] p = new Plane[faceCount];
Cylinder[] c = new Cylinder[faceCount];

void setup() {
  size(800, 800, P3D);
  for (int i=0; i<faceCount; ++i) {

    // calc some random triangles in 3 space
    PVector val = new PVector(random(-width/2, width/2), random(-width/2, width/2), random(-width/2, width/2));
    PVector v0 = new PVector(random(-val.x, -val.x+100), random(-val.y, -val.y+100), random(-val.z, -val.z+100));
    PVector v1 = new PVector(random(-val.x, -val.x+100), random(-val.y, -val.y+100), random(-val.z, -val.z+100));
    PVector v2 = new PVector(random(-val.x, -val.x+100), random(-val.y, -val.y+100), random(-val.z, -val.z+100));
    p[i] = new Plane( new PVector[] {
      v0, v1, v2
    } 
    );
    
    // build some cute little cylinders
    c[i] = new Cylinder(new PVector(150, 5, 5), 12);


    // Using each Triangle normal (N), 
    // One of the Triangle's edges as a tangent (T)  
    // Calculate a bi-normal (B) using the cross-product between each N and T
    
    /* 
    // A picture helps
    // nice, sweet orthogonal axes 
    
    N   B
    |  /
    | /
    |/____T
    
    */
    // N, T, B together give you a Frame of Reference (cute little local coordinate system), based on each triangle. 
    // You can then take the cylinder (or any vertices) and transform them using a 3 x 3 matrix to this coordinate system.
    // (In the matrix each column is based on N, T and B respecivley.) 
    // The transform will handle any rotations and scaling, but not the translation, 
    // but we can add another dimenson to the matrix to hold the translation values.  
    // Here's what all this confusing description looks like:
    
   /*
   Matrix :                               Vector :
    |  N.x  T.x  B.x  translation.x  |      |  x  |
    |  N.y  T.y  B.y  translation.y  |      |  y  |
    |  N.z  T.z  B.z  translation.z  |      |  z  |
    |  0    0    0    1              |      |  1  |
    
    // We add the extra row in the matrix and the 1 to each vector 
    // so the math works. We describe the Matrix as 4 rows by 4 columns
    // and the vector now as a Matrix with 4 rows and 1 column. 
    // When you multiply matrices the inner numbers MUST match, so: 
    // [4 x 4] [4 x 1] is OK, but [4 x 4] [1 x 4] is NOT COOL.
    
    // (Please note there is also row vector approach that you can
    // Google about; it simply puts the vector on left side of matrix and treats
    // it as a 1 row and 4 column matrix. However, you'll also need to shift
    // the translation terms to the bottom of the matrix for the math to grock.)
    
    // The Matrix multiplication looks like this (sorry it's a little tedious looking.)
    n.x * x + t.x *y + B.x * z + translation.x * 1  =  new transformed x
    n.y * x + t.y *y + B.y * z + translation.y * 1  =  new transformed y
    n.z * x + t.z *y + B.z * z + translation.z * 1  =  new transformed z
    0 * x + 0 *y + 0 * z + 1 * 1   =   disregard this crap.
    */
    
    PVector N = p[i].n;
    PVector T = new PVector(p[i].vecs[1].x-p[i].vecs[0].x, p[i].vecs[1].y-p[i].vecs[0].y, p[i].vecs[1].z-p[i].vecs[0].z);
    N.normalize();
    T.normalize();
    PVector B = N.cross(T);
    B.normalize(); // not really needed

    // build matrix with frame and translation (to centroid of each triangle)
    Mat4 m4 = new Mat4(N, T, B, p[i].c);
    
    // transform each cylinder to align with each triangle
    m4.mult(c[i].vecs);
  }
  fill(187);
  stroke(50, 20);
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  rotateX(frameCount*PI/2360);
  rotateY(frameCount*PI/2160);
  rotateZ(frameCount*PI/1860);

  for (int i=0; i<faceCount; ++i) {
    p[i].display();
    c[i].display();
  }
}

