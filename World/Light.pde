public class Light extends Obj{
  float intensity;
  int mag;
  public Light(PVector loc, float intensity) {
    super(loc);
    this.intensity = intensity;
  }
  public Light(ArrayList<Triangle> t, float intensity, int mag) {
    super(t);
    this.mag = mag;
    this.intensity = intensity;
  }
  public Light(ArrayList<Triangle> t, float intensity) {
    this(t, intensity, 200);
  }
  void shine(ArrayList<Triangle> o) {
    ArrayList<Triangle> no = copyOf(o);
    Obj ob = new Obj(no);
    ob.translate(new PVector(-1 * getCenter().x, -1 * getCenter().y, -1 * getCenter().z));
    double[][] s1 = s1(no);
    double[][] s2 = s2(no);
    double[][] s3 = s3(no);
    double[][] s4 = s4(no);
    double[][] s5 = s5(no);
    double[][] s6 = s6(no);
  }
  double[][] s6 (ArrayList<Triangle> Triangles) {
    double[][] s = new double[mag][mag];
    for (Triangle t : Triangles) {
      t.center = t.calcCenter();
      t.close = dist(t.center, new PVector(0, mag, 0));
    }
    Collections.sort(Triangles);
    for (Triangle t : Triangles) {
      if (!(t.points[0].y < mag && t.points[1].y < mag && t.points[2].y < mag)) {
        float[][] pT = new float[3][2];
        int count = 0;
        for (PVector point : t.points) {
          try {
            float scX = 0;
            float scY = 0;
            if (point.y <= mag) {
              scX = (((-mag * point.z) / ((mag - 1) - mag)) + mag);
              scY = (((-mag * point.x) / ((mag - 1) - mag)) + mag);
            } else {      
              scX = (((-mag * point.z) / (point.y - mag)) + mag);
              scY = (((-mag * point.x) / (point.y - mag)) + mag);
            }
            pT[count][0] = scX;
            pT[count][1] = scY;
            count++;
          } 
          catch (Exception e) {
            break;
          }
        }
        plot(pT[0][0], pT[0][1], pT[1][0], pT[1][1], pT[2][0], pT[2][1], s, t.ID);
      }
    }
    return s;
  }
  double[][] s5 (ArrayList<Triangle> Triangles) {
    double[][] s = new double[mag][mag];
    for (Triangle t : Triangles) {
      t.center = t.calcCenter();
      t.close = dist(t.center, new PVector(0, -1 * mag, 0));
    }
    Collections.sort(Triangles);
    for (Triangle t : Triangles) {
      if (!(t.points[0].y < -1 * mag && t.points[1].y < -1 * mag && t.points[2].y < -1 * mag)) {
        float[][] pT = new float[3][2];
        int count = 0;
        for (PVector point : t.points) {
          try {
            float scX = 0;
            float scY = 0;
            if (point.y <= -1 * mag) {
              scX = (((mag * point.z) / ((-1 * mag + 1) + mag)) + mag);
              scY = (((mag * point.x) / ((-1 * mag + 1) + mag)) + mag);
            } else {      
              scX = (((mag * point.z) / (point.y + mag)) + mag);
              scY = (((mag * point.x) / (point.y + mag)) + mag);
            }
            pT[count][0] = scX;
            pT[count][1] = scY;
            count++;
          } 
          catch (Exception e) {
            break;
          }
        }
        plot(pT[0][0], pT[0][1], pT[1][0], pT[1][1], pT[2][0], pT[2][1], s, t.ID);
      }
    }
    return s;
  }
  double[][] s4 (ArrayList<Triangle> Triangles) {
    double[][] s = new double[mag][mag];
    for (Triangle t : Triangles) {
      t.center = t.calcCenter();
      t.close = dist(t.center, new PVector(mag, 0, 0));
    }
    Collections.sort(Triangles);
    for (Triangle t : Triangles) {
      if (!(t.points[0].x < mag && t.points[1].x < mag && t.points[2].x < mag)) {
        float[][] pT = new float[3][2];
        int count = 0;
        for (PVector point : t.points) {
          try {
            float scX = 0;
            float scY = 0;
            if (point.x <= mag) {
              scX = (((-1*mag * point.z) / ((mag - 1) - mag)) + mag);
              scY = (((-1*mag * point.y) / ((mag - 1) - mag)) + mag);
            } else {      
              scX = (((-1*mag * point.z) / (point.x - mag)) + mag);
              scY = (((-1*mag * point.y) / (point.x - mag)) + mag);
            }
            pT[count][0] = scX;
            pT[count][1] = scY;
            count++;
          } 
          catch (Exception e) {
            break;
          }
        }
        plot(pT[0][0], pT[0][1], pT[1][0], pT[1][1], pT[2][0], pT[2][1], s, t.ID);
      }
    }
    return s;
  }
  double[][] s3 (ArrayList<Triangle> Triangles) {
    double[][] s = new double[mag][mag];
    for (Triangle t : Triangles) {
      t.center = t.calcCenter();
      t.close = dist(t.center, new PVector(-1 * mag, 0, 0));
    }
    Collections.sort(Triangles);
    for (Triangle t : Triangles) {
      if (!(t.points[0].x < -1 * mag && t.points[1].x < -1 * mag && t.points[2].x < -1 * mag)) {
        float[][] pT = new float[3][2];
        int count = 0;
        for (PVector point : t.points) {
          try {
            float scX = 0;
            float scY = 0;
            if (point.x <= -1 * mag) {
              scX = (((mag * point.z) / ((-1 * mag + 1) + mag)) + mag);
              scY = (((mag * point.y) / ((-1 * mag + 1) + mag)) + mag);
            } else {      
              scX = (((mag * point.z) / (point.x + mag)) + mag);
              scY = (((mag * point.y) / (point.x + mag)) + mag);
            }
            pT[count][0] = scX;
            pT[count][1] = scY;
            count++;
          } 
          catch (Exception e) {
            break;
          }
        }
        plot(pT[0][0], pT[0][1], pT[1][0], pT[1][1], pT[2][0], pT[2][1], s, t.ID);
      }
    }
    return s;
  }
  double[][] s2 (ArrayList<Triangle> Triangles) {
    double[][] s = new double[mag][mag];
    for (Triangle t : Triangles) {
      t.center = t.calcCenter();
      t.close = dist(t.center, new PVector(0, 0, mag));
    }
    Collections.sort(Triangles);
    for (Triangle t : Triangles) {
      if (!(t.points[0].z < mag && t.points[1].z < mag && t.points[2].z < mag)) {
        float[][] pT = new float[3][2];
        int count = 0;
        for (PVector point : t.points) {
          try {
            float scX = 0;
            float scY = 0;
            if (point.z <= mag) {
              scX = (((-1 * mag * point.x) / ((mag - 1) - mag)) + mag);
              scY = (((-1 * mag * point.y) / ((mag - 1) - mag)) + mag);
            } else {      
              scX = (((-1 * mag * point.x) / (point.z - mag)) + mag);
              scY = (((-1 * mag * point.y) / (point.z - mag)) + mag);
            }
            pT[count][0] = scX;
            pT[count][1] = scY;
            count++;
          } 
          catch (Exception e) {
            break;
          }
        }
        plot(pT[0][0], pT[0][1], pT[1][0], pT[1][1], pT[2][0], pT[2][1], s, t.ID);
      }
    }
    return s;
  }
  double[][] s1 (ArrayList<Triangle> Triangles) {
    double[][] s = new double[mag][mag];
    for (Triangle t : Triangles) {
      t.center = t.calcCenter();
      t.close = dist(t.center, new PVector(0, 0, -1 * mag));
    }
    Collections.sort(Triangles);
    for (Triangle t : Triangles) {
      if (!(t.points[0].z < -1 * mag && t.points[1].z < -1 * mag && t.points[2].z < -1 * mag)) {
        float[][] pT = new float[3][2];
        int count = 0;
        for (PVector point : t.points) {
          try {
            float scX = 0;
            float scY = 0;
            if (point.z <= -1 * mag) {
              scX = (((mag * point.x) / ((-1 * mag + 1) + mag)) + mag);
              scY = (((mag * point.y) / ((-1 * mag + 1) + mag)) + mag);
            } else {      
              scX = (((mag * point.x) / (point.z + mag)) + mag);
              scY = (((mag * point.y) / (point.z + mag)) + mag);
            }
            pT[count][0] = scX;
            pT[count][1] = scY;
            count++;
          } 
          catch (Exception e) {
            break;
          }
        }
        plot(pT[0][0], pT[0][1], pT[1][0], pT[1][1], pT[2][0], pT[2][1], s, t.ID);
      }
    }
    return s;
  }
  void plot(float x1, float y1, float x2, float y2, float x3, float y3, double[][] scr, double ID) {
     x1--;x2--;x3--;y1--;y2--;y3--;
     
     float s1x = (x2-x1);
     float s1y = (y2-y1);
     for (int i = 0; i <= s1x; i++) {
       int x = (int)(y1 + (i * s1y/s1x));
       int y = (int)(x1 + i);
       scr[x][y] = ID;
     }
     for (int i = 0; i >= s1x; i--) {
       int x = (int)(y1 + (i * s1y/s1x));
       int y = (int)(x1 + i);
       scr[x][y] = ID;
     }
     float s2x = (x2-x3);
     float s2y = (y2-y3);
     for (int i = 0; i <= s2x; i++) {
       int x = (int)(y3 + (i * s2y/s2x));
       int y = (int)(x3 + i);
       scr[x][y] = ID;
     }
     for (int i = 0; i >= s2x; i--) {
       int x = (int)(y3 + (i * s2y/s2x));
       int y = (int)(x3 + i);
       scr[x][y] = ID;
     }
     float s3x = (x3-x1);
     float s3y = (y3-y1);
     for (int i = 0; i <= s3x; i++) {
       int x = (int)(y1 + (i * s3y/s3x));
       int y = (int)(x1 + i);
       scr[x][y] = ID;
     }
     for (int i = 0; i >= s3x; i--) {
       int x = (int)(y1 + (i * s3y/s3x));
       int y = (int)(x1 + i);
       scr[x][y] = ID;
     }
     
     for (float i = Math.min(Math.min(x1, x2), x3); i < Math.max(Math.max(x1, x2), x3); i++) {
       boolean place = false;
       int c  = 0;
       for (float j = Math.min(Math.min(y1, y2), y3); j < Math.max(Math.max(y1, y2), y3); j++) {
         if (scr[(int)j][(int)i] == ID) {
           place = true;
           c++;
           if (c >= 2) break;
         } else if (place) {
           if (scr[(int)j][(int)i] == ID) break;
           scr[(int)j][(int)i] = ID;
         }
       }
     }
  }
  ArrayList<Triangle> copyOf(ArrayList<Triangle> ts) {
    ArrayList<Triangle> tsc = new ArrayList<Triangle>();
    for (Triangle t : ts) {
      tsc.add(t.copyOf());
    }
    return tsc;
  }
}
