public class Light extends Obj{
  float intensity;
  public Light(PVector loc, float intensity) {
    super(loc);
    this.intensity = intensity;
  }
  public Light(ArrayList<Triangle> t, float intensity) {
    super(t);
    this.intensity = intensity;
  }
  void shine(ArrayList<Obj> o) {
    
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
