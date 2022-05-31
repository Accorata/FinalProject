public class Triangle implements Comparable<Triangle> {
  PVector[] points = new PVector[3];
  color clr;
  float light;
  float close;
  PVector center;
  public Triangle (PVector a_, PVector b_, PVector c_, color clr_) {
    points[0] = a_;
    points[1] = b_;
    points[2]= c_;
    clr = clr_;
  }
  public Triangle (PVector a_, PVector b_, PVector c_) {
    this(a_, b_, c_, color(0));
  }
  
  PVector[] getPoints() {
    return points;
  }
  void update_close() {
    this.center = calcCenter();
    this.close = dist(center, new PVector(0, 0, -1 * fromScreen));
  }
  private PVector calcCenter () {
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
    Triangle tri1 = new Triangle(points[0], mid01, mid20);
    Triangle tri2 = new Triangle(points[1], mid01, mid12)
    //Triangle tri3 = new Triangle(points[0], mid01, mid20);
    if (num <= 0) {
      smallTris.add(tri1);
      smallTris.add(tri2);
      smallTris.add(new Triangle(points[2], mid12, mid20));
      smallTris.add(new Triangle(mid01, mid12, mid20));
    }
    //} else {
    //  smallTris.add(splitTriangle(object, num-1))
    //}
    return smallTris;
  }
  @Override
    String toString() {
    return points[0] + "  " + points[1] + "  " + points[2];
  }
  //ArrayList<PVector> getCoords () {
  //  ArrayList<PVector> coords = new ArrayList<PVector>();
  //  //start with lines
  //  PVector ab = b.sub(a);
  //  float abLen = ab.mag();
  //  //println(ab + " " + abLen);
  //  PVector ac = c.sub(a);
  //  float acLen = ac.mag();
  //  PVector bc = c.sub(b);
  //  float bcLen = bc.mag();
  //  for (int i = 1; i<abLen; i++) {
  //    coords.add(partVec(ab, a, i));
  //  }
  //  for (int i = 1; i<acLen; i++) {
  //    coords.add(partVec(ac, a, i));
  //  }
  //  for (int i = 1; i<bcLen; i++) {
  //    coords.add(partVec(bc, b, i));
  //  }
  //  return coords;
  //}
  private PVector partVec (PVector ab, PVector a, int mag) {
    PVector ans = new PVector(ab.x, ab.y, ab.z);
    return ans.setMag(mag).add(a);
  }
}
