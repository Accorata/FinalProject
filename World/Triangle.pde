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
  void update_close() {
    this.center = calcCenter();
    this.close = dist(center, new PVector(0, 0, -1 * fromScreen));
  }
  private float dist(PVector a, PVector b) {
    return sqrt(sq(a.x - b.x) + sq(a.y - b.y) + sq(a.z - b.z));
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
