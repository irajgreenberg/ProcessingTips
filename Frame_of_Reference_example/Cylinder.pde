class Cylinder {
  int detail;
  PVector dim;
  PVector[] vecs;

  Cylinder() {
  }

  Cylinder(PVector dim, int detail) {
    this.dim = dim;
    this.detail = detail;
    vecs = new PVector[detail*2];
    _init();
  }

  void _init() {
    float theta = 0.0;
    //    created around x-axis
    //    y = cos
    //    z = sin

    for (int i=0; i<detail; ++i) {
      vecs[i] = new PVector(0, cos(theta)*dim.y, sin(theta)*dim.z);
      vecs[detail + i] = new PVector(dim.x, cos(theta)*dim.y, sin(theta)*dim.z);
      theta += TWO_PI/detail;
    }
  }

  void display() {
    beginShape(QUADS);
    for (int i=0; i<detail; ++i) {
      if (i<detail-1) {
        vertex(vecs[i].x, vecs[i].y, vecs[i].z);
        vertex(vecs[i+1].x, vecs[i+1].y, vecs[i+1].z);
        vertex(vecs[detail+i+1].x, vecs[detail+i+1].y, vecs[detail+i+1].z);
        vertex(vecs[detail+i].x, vecs[detail+i].y, vecs[detail+i].z);
      } 
      else {
        vertex(vecs[i].x, vecs[i].y, vecs[i].z);
        vertex(vecs[0].x, vecs[0].y, vecs[0].z);
        vertex(vecs[detail].x, vecs[detail].y, vecs[detail].z);
        vertex(vecs[detail+i].x, vecs[detail+i].y, vecs[detail+i].z);
      }
    }
    endShape();
  }
}

