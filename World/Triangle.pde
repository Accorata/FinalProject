public class Triangle {
  PVector a, b, c;
  color clr;
  float light;
  public Triangle (PVector a_, PVector b_, PVector c_, color clr_) {
    a = a_;
    b = b_;
    c = c_;
    clr = clr_;
  }
  public Triangle (PVector a_, PVector b_, PVector c_) {
    this(a_, b_, c_, color(0));
  }
  ArrayList<PVector> getCoords () {
    ArrayList<PVector> coords = new ArrayList<PVector>();
    for (float i = a.x; i<b.x; i++) {
      for (float j = b.y; j<c.y; j++) {
        //coords.add(new PVector(i,j,a.z+
      }
    }
    return coords;
  }
}
