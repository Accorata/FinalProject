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
}
