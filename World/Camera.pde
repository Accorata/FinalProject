public class Camera {
  color[][] screen;
  PVector loc;
  public Camera() {
    screen = initScreen();
    resetScreen();
    //println(screen);
    loc = new PVector(0, 0, 0);
  }
  color[][] initScreen() {
    return new color[height][width];
    /*
    for (int i = 0; i<height; i++){
      screen[0] = new color[width];
    }
    
    return screen;*/
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
    for(int i = 0; i<width; i++){
      for(int j = 0; j<height; j++){
        pixels[i*width+j] = screen[i][j];
      }
    }
    updatePixels();
  }
}
