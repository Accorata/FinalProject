public class Triangle implements Comparable<Triangle> {
  PVector a, b, c;
  color clr;
  float light;
  float close;
  PVector center;
  public Triangle (PVector a_, PVector b_, PVector c_, color clr_) {
    a = a_;
    b = b_;
    c = c_;
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
    cent.add(a);
    cent.add(b);
    cent.add(c);
    cent.div(3);
    return cent;
  }
  int compareTo(Triangle obj) {
    if (this.close > obj.close) return 1;
    if (this.close < obj.close) return -1;
    return 0;
  }
}
