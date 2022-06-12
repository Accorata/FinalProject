public class Triangle implements Comparable<Triangle> {
  private PVector[] points = new PVector[3];
  private color clr;
  private float light;
  private float close;
  private PVector center;
  private double ID;

  public Triangle (PVector a_, PVector b_, PVector c_, color clr_) {
    this.points[0] = a_;
    this.points[1] = b_;
    this.points[2]= c_;
    this.clr = clr_;
    this.center = calcCenter();
    this.light = 0;
    this.ID = 0;
  }
  public Triangle (PVector a_, PVector b_, PVector c_) {
    this(a_, b_, c_, color(0));
  }
  
  Triangle copyOf() {
    Triangle t = new Triangle(points[0].copy(), points[1].copy(), points[2].copy(), clr);
    t.light = this.light;
    t.close = this.close;
    t.ID = this.ID;
    return t;
  }
  PVector[] getPoints() {
    return points;
  }
  void updateColor(color clr_) {
    this.clr = clr_;
  }
  void update_close() {
    this.center = calcCenter();
    this.close = dist(center, place);
  }
  void update_close(PVector v) {
    this.center = calcCenter();
    this.close = dist(center, v);
  }
  PVector getCenter() {
    return center;
  }
  PVector calcCenter () {
    PVector cent = new PVector(0, 0, 0);
    for (PVector point : points) {
      cent.add(point);
    }
    cent.div(3);
    return cent;
  }
  int compareTo(Triangle obj) {
    if (this.close > obj.close) return -1;
    if (this.close < obj.close) return 1;
    return 0;
  }
  ArrayList<Triangle> splitTriangle(Obj object, int num) {
    ArrayList<Triangle> smallTris = new ArrayList<Triangle>();
    PVector p0 = points[0].copy();
    PVector mid01 = p0.add(points[1]).div(2);
    PVector p1 = points[1].copy();
    PVector mid12 = p1.add(points[2]).div(2);
    PVector p2 = points[2].copy();
    PVector mid20 = p2.add(points[0]).div(2);
    object.addPoint(mid01);
    object.addPoint(mid12);
    object.addPoint(mid20);
    Triangle tri1 = new Triangle(points[0], mid01, mid20, clr);
    Triangle tri2 = new Triangle(points[1], mid01, mid12, clr);
    Triangle tri3 = new Triangle(points[2], mid12, mid20, clr);
    Triangle tri4 = new Triangle(mid01, mid12, mid20, clr);
    if (num <= 0) {
      smallTris.add(tri1);
      smallTris.add(tri2);
      smallTris.add(tri3);
      smallTris.add(tri4);
    } else {
      combTriLists(smallTris, tri1.splitTriangle(object, num-1));
      combTriLists(smallTris, tri2.splitTriangle(object, num-1));
      combTriLists(smallTris, tri3.splitTriangle(object, num-1));
      combTriLists(smallTris, tri4.splitTriangle(object, num-1));
    }
    return smallTris;
  }
  private void combTriLists(ArrayList<Triangle> arr, ArrayList<Triangle> add) {
    for (Triangle t : add) {
      arr.add(t);
    }
  }
  @Override
    String toString() {
    return points[0] + "  " + points[1] + "  " + points[2];
  }
}
