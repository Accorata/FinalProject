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
    for (PVector point : obj.getPoints()) {
      try {
        float scX = (fromScreen * point.x) / (point.z + fromScreen);
        float scY = (fromScreen * point.y) / (point.z + fromScreen);
        screen[(int)scY + height/2][(int)scX + width/2] = color(0);
      } 
      catch (ArrayIndexOutOfBoundsException e) {
        e.printStackTrace();
      }
    }
  }
}
