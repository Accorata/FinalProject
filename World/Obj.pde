public class Obj { //<>// //<>// //<>//
  private boolean breachable = false;
  private ArrayList<PVector> points;
  private ArrayList<PVector> foundationPoints;
  private ArrayList<Triangle> triangles;
  private PVector center;
  private float dAvg;
  
  public Obj(PVector center) {
    this.center = center;
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ts.add(new Triangle(center.copy(), center.copy(), center.copy()));
    this.triangles = ts;
    this.points = calcPoints(ts);
    this.foundationPoints = points;
    calcDAvg();
  }
  public Obj() {
  }
  public Obj(ArrayList<Triangle> t, PVector center) {
    this.points = calcPoints(t);
    this.foundationPoints = points;
    this.triangles = t;
    this.center = center;
    calcDAvg();
  }
  public Obj(ArrayList<Triangle> t) {
    this.points = calcPoints(t);
    this.foundationPoints = points;
    this.triangles = t;
    setCenter();
    calcDAvg();
  }
  float getDAvg(){return dAvg;}
  
  void calcDAvg() {
    float t = 0;
    setCenter();
    for (PVector p : points) {
      t+= dist(center, p);
    }
    dAvg = t/points.size();
    
  }
  void moveX(float n) {
    for (PVector p : getPoints()) {
      p.add(xUnit.mult(n));
      xUnit.div(n);
    }
  }
  void moveY(float n) {
    for (PVector p : getPoints()) {
      p.add(yUnit.mult(-n));
      yUnit.div(-n);
    }
  }
  void moveZ(float n) {
    for (PVector p : getPoints()) {
      p.add(zUnit.mult(n));
      zUnit.div(n);
    }
  }
  void moveX() {
    moveX(1);
  }
  void moveY() {
    moveY(1);
  }
  void moveZ() {
    moveZ(1);
  }
  PVector getPos() {
    setCenter();
    PVector ans = new PVector(0, 0, 0);
    if (center.x != 0) {
      ans.add(xUnitInv.mult(center.x));
      xUnitInv.div(center.x);
    }
    if (center.y != 0) {
      ans.add(yUnitInv.mult(center.y));
      yUnitInv.div(center.y);
    }
    if (center.z != 0) {
      ans.add(zUnitInv.mult(center.z));
      zUnitInv.div(center.z);
    }
    return ans;
    //return center;
  }
  boolean getBreachable() {
    return this.breachable;
  }
  void setBreachable(boolean b) {
    this.breachable = b;
  }
  void setObj (ArrayList<PVector> points_, ArrayList<Triangle> triangles_, PVector one, PVector two) {
    this.points = points_;
    this.foundationPoints = new ArrayList<PVector>();
    foundationPoints.add(one);
    foundationPoints.add(two);
    this.triangles = triangles_;
    setCenter();
    calcDAvg();
  }
  void setObj (ArrayList<PVector> points_, ArrayList<Triangle> triangles_) {
    this.points = points_;
    this.foundationPoints = points;
    this.triangles = triangles_;
    setCenter();
    calcDAvg();
  }
  void setObj (ArrayList<Triangle> triangles_) {
    this.points = calcPoints(triangles_);
    this.foundationPoints = points;
    this.triangles = triangles_;
    setCenter();
    calcDAvg();
  }
  void setCenter(PVector v) {
    this.center = v;
  }
  void setCenter() {
    this.center = calcCenter();
  }
  ArrayList<PVector> getPoints() {
    return points;
  }
  ArrayList<Triangle> getTriangles() {
    return triangles;
  }
  PVector getCenter () {
    return calcCenter();
  }/*
  boolean breached() {
    boolean breached = false;
    for (Triangle t : triangles) {
      PVector t1 = t.points[0];
      PVector t2 = t.points[1];
      PVector t3 = t.points[2];

      PVector v1 = new PVector(t1.x - t2.x, t1.y -t2.y, t1.z - t2.z);
      PVector v2 = new PVector(t2.x - t3.x, t2.y -t3.y, t2.z - t3.z);
      PVector crV = v1.cross(v2);
      float n = (crV.x * (-1 * t2.x)) + (crV.y * (-1 * t2.y)) + (crV.z * (-fromScreen - t2.z));
      
      float z = ((crV.x * (-1 * t2.x)) + (crV.y * (-1 * t2.y)))/crV.z + t2.z;
       float x = ((crV.z * (-1 * t2.z)) + (crV.y * (-1 * t2.y)))/crV.x + t2.x;
       float y = ((crV.x * (-1 * t2.x)) + (crV.z * (-1 * t2.z)))/crV.y + t2.y;
       boolean op1 = ((x >= -1 * aw && x <= aw) || (y >= -1 * aw && y <= aw)) && (z >= -1 * aw && z<= aw);
       boolean op2 = ((x >= -1 * aw && x <= aw) && ((y >= -1 * aw && y <= aw) || (z >= -1 * aw && z<= aw)));
       boolean op3 = (y >= -1 * aw && y <= aw) && ((x >= -1 * aw && x <= aw) ||  (z >= -1 * aw && z<= aw));
       boolean check = (x >= -1 * aw && x <= aw) || (y >= -1 * aw && y <= aw) || (z >= -1 * aw && z<= aw);
       
      boolean wx = (t1.x >= 0 || t2.x >= 0 || t3.x >= 0) && (t1.x <= 0 || t2.x <= 0 || t3.x <= 0);
      boolean wy = (t1.y >= 0 || t2.y >= 0 || t3.y >= 0) && (t1.y <= 0 || t2.y <= 0 || t3.y <= 0);
      boolean wz = (t1.z >= -fromScreen || t2.z >= -fromScreen || t3.z >= -fromScreen) && (t1.z <= -fromScreen || t2.z <= -fromScreen || t3.z <= -fromScreen);

      boolean within = wx && wy && wz;
      if (within && n < 25000) {
        breached = true;
      }
    }
    return breached;
  }*/
  boolean breached() {
    for (Obj o : objs) {
      if (this != o && !o.getBreachable()) {
        if (this.getDAvg() + o.getDAvg() + 20 <= dist(this.getCenter(), o.getCenter())) return true;
      }
    }
    return false;
  }
  void rotateOnX(float deg) {
    if (deg != 0) {
      float rad = radians(deg);
      for (PVector point : points) {
        point.sub(center);
        PVector temp = new PVector(point.z, point.y);
        temp.rotate(rad);
        point.y = temp.y;
        point.z = temp.x;
        point.add(center);
      }
    }
  }
  void rotateOnY(float deg) {
    float rad = radians(deg);
    for (PVector point : points) {
      point.sub(center);
      PVector temp = new PVector(point.x, point.z);
      temp.rotate(rad);
      point.x = temp.x;
      point.z = temp.y;
      point.add(center);
    }
  }
  void rotateOnZ(float deg) {
    float rad = radians(deg);
    for (PVector point : points) {
      point.sub(center);
      PVector temp = new PVector(point.x, point.y);
      temp.rotate(rad);
      point.x = temp.x;
      point.y = temp.y;
      point.add(center);
    }
  }
  void rotate(PVector degrees) {
    degrees.mult(speedAdjust);
    setCenter(place);
    rotateOnX(-xAng);
    rotateOnY(-eAng);
    setCenter();
    rotateOnX(degrees.x);
    rotateOnY(degrees.y);
    rotateOnZ(degrees.z);
    setCenter(place);
    rotateOnY(eAng);
    rotateOnX(xAng);
  }
  void addTriangles(ArrayList<Triangle> tris) {
    for (Triangle t : tris) {
      triangles.add(t);
    }
  }
  void addPoint(PVector point) {
    points.add(point);
  }
  void translate(PVector a) {
    for (PVector point : points) {
      point.add(a);
    }
  }
  ArrayList<PVector> calcPoints(ArrayList<Triangle> t) {
    ArrayList<PVector> p = new ArrayList<PVector>();
    for (Triangle tri : t) {
      for (PVector point : tri.points) {
        if (!VinP(point, p)) p.add(point);
      }
    }
    return p;
  }
  private boolean VinP(PVector V, ArrayList<PVector> P) {
    for (PVector p : P) {
      if (V == p) return true;
    }
    return false;
  }
  private PVector calcCenter () {
    PVector cent = new PVector(0, 0, 0);
    for (PVector vec : foundationPoints) {
      cent.add(vec);
    }
    cent.div(foundationPoints.size());
    return cent;
  }
}
