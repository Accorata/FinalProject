public class Camera {
  color[][] screen = new color[height][width];
  PVector loc;
  boolean dense;
  ArrayList<Triangle> Triangles = new ArrayList<Triangle>();
  PVector mouse = new PVector(width/2, height/2);
  PVector mouseOld = new PVector(width/2, height/2);
  public Camera() {
    resetScreen();
    this.loc = new PVector(0, 0, 0);
    this.dense = true;
  }
  PVector getLoc() {
    return loc;
  }
  void resetScreen() {
    for (int i = 0; i<screen.length; i++) {
      for (int j = 0; j<screen[0].length; j++) {
        screen[i][j] = color(255);
      }
    }
  }
  void display() {
    for (Triangle t : Triangles) {
      t.update_close();
    }
    Collections.sort(Triangles);
    for (Triangle t : Triangles) {
      if (!(t.points[0].z < -1 * fromScreen && t.points[1].z < -1 * fromScreen && t.points[2].z < -1 * fromScreen)) {
        float[][] pT = new float[3][2];
        int count = 0;
        for (PVector point : t.points) {
          try {
            float scX = 0;
            float scY = 0;
            if (point.z <= -1 * fromScreen) {
              scX = (((fromScreen * point.x) / ((-1 * fromScreen + 1) + fromScreen)) + width/2);
              scY = (((fromScreen * point.y) / ((-1 * fromScreen + 1) + fromScreen)) + height/2);
            } else {      
              scX = (((fromScreen * point.x) / (point.z + fromScreen)) + width/2);
              scY = (((fromScreen * point.y) / (point.z + fromScreen)) + height/2);
            }
            pT[count][0] = scX;
            pT[count][1] = scY;
            count++;
          } 
          catch (Exception e) {
            break;
          }
        }
        fill(t.clr);
        if (!dense) noStroke();
        triangle(pT[0][0], pT[0][1], pT[1][0], pT[1][1], pT[2][0], pT[2][1]);
        if (cover(new PVector(pT[0][0], pT[0][1], 0), new PVector(pT[1][0], pT[1][1], 0), new PVector(pT[2][0], pT[2][1], 0))) {
          println(t.ID);
          AIM = t.ID;
        }
      }
    }
  }
  void addObject(Obj obj) {
    objs.add(obj);
    for (Triangle t : obj.getTriangles()) {
      Triangles.add(t);
    }
  }
  void rotateByMouse() {
    boolean breached = false;
    float xRotate = (mouse.x-width/2)*1/sensitivity;
    float yRotate = (height/2-mouse.y)*1/sensitivity;
    if ((xAng > 80 && yRotate > 0) || (xAng < -80 && yRotate < 0)) {
      yRotate = 0;
    }
    xAng += yRotate;
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(-xAng);
      obj.rotateOnY(xRotate);
      obj.rotateOnX(xAng);
      obj.rotateOnX(yRotate);
      if (!obj.getBreachable() && obj.breached()) breached = true;
    }
    if (breached) {
      for (Obj obj : objs) {
        obj.rotateOnX(-xAng);
        obj.rotateOnY(-xRotate);
        obj.rotateOnX(xAng);
        obj.rotateOnX(-yRotate);
        xAng -= yRotate;
      }
    } 
    //if (xAng <= 80 && yRotate < 0) {
      
    //}
    mouse.x -= (mouse.x-width/2)/20;
    mouse.y -= (mouse.y-height/2)/20;
    mouse.x += mouseX-mouseOld.x;
    mouse.y += mouseY-mouseOld.y;
    mouseOld.x = mouseX;
    mouseOld.y = mouseY;
  }
  void updatePos(PVector dir) {
    /*
    this.loc.add(dir);
     dir.y -= speed/30;
     
     if (loc.y < 0) {
     for (Obj obj : objs) {
     obj.translate(new PVector(0, -loc.y, 0));
     }
     this.loc.y = 0;
     dir.y = 0;
     }*/
  }
}
