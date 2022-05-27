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
    //start with lines
    PVector a_to_b = b.sub(a);
    float abLen = a_to_b.mag();
    println(abLen);
    PVector a_to_c = c.sub(a);
    float acLen = a_to_c.mag();
    PVector b_to_c = b.sub(c);
    float bcLen = b_to_c.mag();
    a_to_b.normalize();
    for (int i = 1; i<abLen; i++) {
      coords.add(a_to_b.mult(i).add(a));
    }
    for (int i = 1; i<acLen; i++) {
      coords.add(a_to_c.setMag(i).add(a));
    }
    for (int i = 1; i<bcLen; i++) {
      coords.add(b_to_c.setMag(i).add(b));
    }
    return coords;
  }
}
