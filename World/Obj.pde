public class Obj { //<>// //<>//
  ArrayList<PVector> points;
  ArrayList<Triangle> triangles;
  PVector center;
  
  public Obj(PVector center) {
    this.center = center;
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ts.add(new Triangle(center.copy(), center.copy(), center.copy()));
    this.triangles = ts;
    this.points = calcPoints(ts);
  }
  public Obj() {}
  public Obj(ArrayList<Triangle> t, PVector center) {
    this.points = calcPoints(t);
    this.triangles = t;
    this.center = center;
  }
  public Obj(ArrayList<Triangle> t) {
    this.points = calcPoints(t);
    this.triangles = t;
    setCenter();
  }

  void setObj (ArrayList<PVector> points_, ArrayList<Triangle> triangles_) {
    this.points = points_;
    this.triangles = triangles_;
    setCenter();
  }
  void setObj (ArrayList<Triangle> triangles_) {
    this.points = calcPoints(triangles_);
    this.triangles = triangles_;
    setCenter();
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
    return center;
  }
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
    /*
      float z = ((crV.x * (-1 * t2.x)) + (crV.y * (-1 * t2.y)))/crV.z + t2.z;
      float x = ((crV.z * (-1 * t2.z)) + (crV.y * (-1 * t2.y)))/crV.x + t2.x;
      float y = ((crV.x * (-1 * t2.x)) + (crV.z * (-1 * t2.z)))/crV.y + t2.y;
      boolean op1 = ((x >= -1 * aw && x <= aw) || (y >= -1 * aw && y <= aw)) && (z >= -1 * aw && z<= aw);
      boolean op2 = ((x >= -1 * aw && x <= aw) && ((y >= -1 * aw && y <= aw) || (z >= -1 * aw && z<= aw)));
      boolean op3 = (y >= -1 * aw && y <= aw) && ((x >= -1 * aw && x <= aw) ||  (z >= -1 * aw && z<= aw));
      boolean check = (x >= -1 * aw && x <= aw) || (y >= -1 * aw && y <= aw) || (z >= -1 * aw && z<= aw);
      */
      boolean wx = (t1.x >= 0 || t2.x >= 0 || t3.x >= 0) && (t1.x <= 0 || t2.x <= 0 || t3.x <= 0);
      boolean wy = (t1.y >= 0 || t2.y >= 0 || t3.y >= 0) && (t1.y <= 0 || t2.y <= 0 || t3.y <= 0);
      boolean wz = (t1.z >= -fromScreen || t2.z >= -fromScreen || t3.z >= -fromScreen) && (t1.z <= -fromScreen || t2.z <= -fromScreen || t3.z <= -fromScreen);
      
      boolean within = wx && wy && wz;
      if (within && n < 25000) {
        breached = true;
 
      }
    }
    return breached;
  }
  void rotateOnX(float deg) {
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
    center = calcCenter();
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
    for (PVector vec : points) {
      cent.add(vec);
    }
    cent.div(points.size());
    return cent;
  }
  //void rotateX(float deg) {
  //  float rad = radians(deg);
  //  for (PVector point : points) {
  //    PVector xy = new PVector(point.x, point.y, 0);
  //    float angle = PVector.angleBetween(xy, xaxis) + rad;
  //    point.x = xy.mag() * cos(angle);
  //    point.y = xy.mag() * sin(angle);
  //    PVector xy2 = new PVector(point.x, point.y, 0);
  //    println(xy.mag() + " " + xy2.mag());
  //  }
  //}
}
