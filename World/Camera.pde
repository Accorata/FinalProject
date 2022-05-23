public class Camera {
  color[][] screen = new color[height][width];
  PVector loc;
  public Camera() {
    resetScreen();
    loc = new PVector(0, 0, 0);
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
    for (int i = 0; i<width; i++) {
      for (int j = 0; j<height; j++) {
        pixels[i*width+j] = screen[i][j];
      }
    }
    updatePixels();
  }
  void addObject(Obj obj) {
  }
}
