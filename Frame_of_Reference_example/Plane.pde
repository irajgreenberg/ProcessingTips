class Plane {
  PVector[] vecs;
  PVector c, n;
  float normLen = 225.0;

  Plane(){
  }
  
  Plane(PVector[] vecs) {
    this.vecs = vecs;
    _init();
  }

  void _init() {

    PVector v1 = new PVector();
    v1.set(vecs[1]);

    PVector v2 = new PVector();
    v2.set(vecs[2]);

    v1.sub(vecs[0]);
    v2.sub(vecs[0]);

    c = new PVector(
    (vecs[0].x+vecs[1].x+vecs[2].x)/3, 
    (vecs[0].y+vecs[1].y+vecs[2].y)/3, 
    (vecs[0].z+vecs[1].z+vecs[2].z)/3
      );

    n = v1.cross(v2);
    n.normalize();
  }

  void display() {
    beginShape(TRIANGLES);
    for (int i=0; i<vecs.length; ++i) {
      vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    endShape();

    //normal
    stroke(200, 160, 30);
    beginShape(LINES);
    vertex(c.x, c.y, c.z);
    vertex(c.x+n.x*normLen, c.y+n.y*normLen, c.z+n.z*normLen);
    endShape();
    
    //binormal
    stroke(160, 200, 30);
    beginShape(LINES);
    vertex(c.x, c.y, c.z);
    // tangent
    PVector v = new PVector();
    v.set(vecs[1]);
    v.sub(vecs[0]);
    v.normalize();
    vertex(c.x+v.x*normLen, c.y+v.y*normLen, c.z+v.z*normLen);
    endShape();
    
    stroke(30, 200, 160);
    beginShape(LINES);
     vertex(c.x, c.y, c.z);
    PVector b = v.cross(n);
    vertex(c.x+b.x*normLen, c.y+b.y*normLen, c.z+b.z*normLen);
    endShape();
    stroke(0, 75);
  }
}

