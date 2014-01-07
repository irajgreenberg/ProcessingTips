// uber simple Homogeneous 4 x 4 matrix
class Mat4 {
  float[] mat = new float[16];
  
  Mat4() {
  }

  Mat4(PVector axisX, PVector axisY, PVector axisZ, PVector trans) {
//    mat[0] = axisX.x;
//    mat[1] = axisX.y;
//    mat[2] = axisX.z;
//    mat[3] = trans.x;
//
//    mat[4] = axisY.x;
//    mat[5] = axisY.y;
//    mat[6] = axisY.z;
//    mat[7] = trans.y;
//
//    mat[8] = axisZ.x;
//    mat[9] = axisZ.y;
//    mat[10] = axisZ.z;
//    mat[11] = trans.z;
   
     mat[0] = axisX.x;
    mat[1] = axisY.x;
    mat[2] = axisZ.x;
    mat[3] = trans.x;

    mat[4] = axisX.y;
    mat[5] = axisY.y;
    mat[6] = axisZ.y;
    mat[7] = trans.y;

    mat[8] = axisX.z;
    mat[9] = axisY.z;
    mat[10] = axisZ.z;
    mat[11] = trans.z;
    
    mat[12] = 0;
    mat[13] = 0;
    mat[14] = 0;
    mat[15] = 1;
  } 

  void mult(PVector[] arr) {
    PVector temp = new PVector();
    for (int i=0; i<arr.length; ++i) {
      temp.x = mat[0]*arr[i].x + mat[1]*arr[i].y + mat[2]*arr[i].z + mat[3]*1;
      temp.y = mat[4]*arr[i].x + mat[5]*arr[i].y + mat[6]*arr[i].z + mat[7]*1;
      temp.z = mat[8]*arr[i].x + mat[9]*arr[i].y + mat[10]*arr[i].z + mat[11]*1;
      arr[i].set(temp);
    }
  }
}

