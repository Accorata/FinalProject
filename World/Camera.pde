public class Camera {
  color[][] screen = new color[height][width];
  PVector loc;
  boolean dense;
  public Camera() {
    resetScreen();
    loc = new PVector(0, 0, 0);
    dense = true;
  }
  void resetScreen() {
    for (int i = 0; i<screen.length; i++) {
      for (int j = 0; j<screen[0].length; j++) {
        screen[i][j] = color(255);
      }
    }
  }
  void display () {
    loadPixels();
    for (int i = 0; i<height; i++) {
      for (int j = 0; j<width; j++) {
        pixels[i*width+j] = screen[i][j];
        if (dense && i > 0 && i < height-1 && j >0 && j < width-1 && screen[i][j] != color(255)) {
          pixels[i*width+j+1] = screen[i][j];
          pixels[i*width+j-1] = screen[i][j];
          pixels[i*width+j+width] = screen[i][j];
          pixels[i*width+j-width] = screen[i][j];
        }
      }
    }
    updatePixels();
  }
  void addObject(Obj obj) {
    for (Triangle t : obj.triangles) {
      t.update_close();
    }
    Collections.sort(obj.triangles);
    for (Triangle t : obj.triangles) {
      float[][] pT = new float[3][2];
      int count = 0;
      for (PVector point : t.points) {
      try {
        float scX, scY;
        if (point.z <= -1 * fromScreen) {

          scX = (((fromScreen * point.x) / ((-1 * fromScreen + 1) + fromScreen)) + width/2);
          scY = (((fromScreen * point.y) / ((-1 * fromScreen + 1) + fromScreen)) + height/2);
    
        } else {      
          scX = (((fromScreen * point.x) / (point.z + fromScreen)) + width/2);
          scY = (((fromScreen * point.y) / (point.z + fromScreen)) + height/2);
        }
        
        //screen[scX][scY] = color(0);
        pT[count][0] = scX;
        pT[count][1] = scY;
        count++;
        
      } 
      catch (Exception e) {
         break;
      }
      }
      fill(t.clr);
      triangle(pT[0][0], pT[0][1], pT[1][0], pT[1][1], pT[2][0], pT[2][1]);
     
    }
  }
}
