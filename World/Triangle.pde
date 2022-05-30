public class Triangle implements Comparable<Triangle> {
  PVector[] points = new PVector[3];
  color clr;
  float light;
  float close;
  PVector center;
  double ID;
  Triangle copyOf() {
    Triangle t = new Triangle(points[0], points[1], points[2], clr);
    t.light = this.light;
    t.close = this.close;
    t.ID = this.ID;
    return t;
  }
  public Triangle (PVector a_, PVector b_, PVector c_, color clr_) {
    points[0] = a_;
    points[1] = b_;
    points[2]= c_;
    clr = clr_;
    this.center = calcCenter();
    this.light = 0;
    this.ID = Math.random();
  }
  public Triangle (PVector a_, PVector b_, PVector c_) {
    this(a_, b_, c_, color(0));
  }
  void update_close() {
    this.center = calcCenter();
    this.close = dist(center, new PVector(0, 0, -1 * fromScreen));
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
