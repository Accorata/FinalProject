public class Obj { //<>//
  ArrayList<PVector> points;
  ArrayList<Triangle> triangles;
  PVector center;

  public Obj() {
  }
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
  void setCenter(PVector v) {
    this.center = v;
  }
  void setCenter() {
    this.center = calcCenter();
  }
  ArrayList<PVector> getPoints() {
    return points;
  }
  PVector getCenter () {
    return center;
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
  void translate(PVector a) {
    for (PVector point : points) {
      point.add(a);
    }
    center = calcCenter();
  }
  private ArrayList<PVector> calcPoints(ArrayList<Triangle> t) {
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
