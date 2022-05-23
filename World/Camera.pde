public class Camera {
  color[][] screen;
  PVector loc;
  public Camera(){
    loc = new PVector(0, 0, 0);
    resetScreen();
  }
  void resetScreen(){
    for (color[] arr : screen) {
      for (int i = 0; i<arr.length; i++) {
        arr[i] = color(255);
      }
    }
  }
}
