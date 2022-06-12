public class Camera {
  private color[][] screen = new color[height][width];
  private PVector loc;
  private boolean dense;
  private ArrayList<Triangle> Triangles = new ArrayList<Triangle>();
  private PVector mouse = new PVector(width/2, height/2);
  private PVector mouseOld = new PVector(width/2, height/2);
  private HitBox hitBox;

  public Camera() {
    resetScreen();
    this.loc = new PVector(0, 0, 0);
    hitBox = new HitBox();
    objs.add(hitBox);
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
  void proj(Triangle t) {
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
      if (cover(new PVector(pT[0][0]-width/2, pT[0][1]-height/2, 0), new PVector(pT[1][0]-width/2, pT[1][1]-height/2, 0), new PVector(pT[2][0]-width/2, pT[2][1]-height/2, 0))) {
        AIM = t.ID;
      }
    }
  }
  void display() {
    for (Triangle t : Triangles) {
      t.update_close();
    }
    Collections.sort(Triangles);
    //Collections.sort(sc.getTriangles());
    for (Triangle t : sc.getTriangles()) {
      proj(t);
    }
    for (Triangle t : Triangles) {
      if (t.ID != -1) proj(t);
    }
  }
  void addObject(Obj obj) {
    objs.add(obj);
    for (Triangle t : obj.getTriangles()) {
      Triangles.add(t);
    }
  }
  void removeObj(Obj obj) {
    objs.remove(obj);
    for (Triangle t : obj.getTriangles()) {
      Triangles.remove(t);
    }
  }
  void rotateByMouse() {
    boolean breached = false;
    float xRotate = speedAdjust*(mouse.x-width/2)*1/sensitivity;
    float yRotate = speedAdjust*(height/2-mouse.y)*1/sensitivity;
    if ((xAng > 80 && yRotate > 0) || (xAng < -80 && yRotate < 0)) {
      yRotate = 0;
    }
    for (Obj obj : objs) {
      obj.setCenter(place);
      obj.rotateOnX(-xAng);
      obj.rotateOnY(xRotate);
      obj.rotateOnX(xAng);
      obj.rotateOnX(yRotate);
      //if (!obj.getBreachable() && obj.breached() != null) breached = true;
    }
    if (breached) {
      for (Obj obj : objs) {
        obj.rotateOnX(-yRotate);
        obj.rotateOnX(-xAng);
        obj.rotateOnY(-xRotate);
        obj.rotateOnX(xAng);
      }
    } else {
      rotateAxisOnY(xUnit, xRotate);
      rotateAxisOnY(yUnit, xRotate);
      rotateAxisOnY(zUnit, xRotate);
      rotateAxisOnX(xUnit, yRotate);
      rotateAxisOnX(yUnit, yRotate);
      rotateAxisOnX(zUnit, yRotate);
      xAng += yRotate;
      eAng += yRotate;
    }
    mouse.x -= (mouse.x-width/2)/20;
    mouse.y -= (mouse.y-height/2)/20;
    mouse.x += mouseX-mouseOld.x;
    mouse.y += mouseY-mouseOld.y;
    mouseOld.x = mouseX;
    mouseOld.y = mouseY;
  }
  void updatePos(PVector dir) {
    dir.x *= speedAdjust;
    dir.z *= speedAdjust;
    loc.add(dir);
    for (Obj obj : objs) {
      obj.setCenter(place);
      obj.rotateOnX(-xAng);
      obj.translate(dir);
      obj.setCenter(place);
      obj.rotateOnX(xAng);
    }
    Obj hit = hitBox.breached();
    boolean breached = hit != null && !hit.getBreachable();
    if (breached) {
      for (Obj obj : objs) {
        obj.setCenter(place);
        obj.rotateOnX(-xAng);
        obj.translate(PVector.mult(dir, -1));
        obj.setCenter(place);
        obj.rotateOnX(xAng);
      }
    } 
    if (jump) {
      dir.y -= .2;
      if (dir.y <= -5) {
        jump = false;
      }
    }
    if (!jump) dir.y = 0;
    dir.x /= speedAdjust;
    dir.z /= speedAdjust;
  }
}
