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
    PVector ab = b.sub(a);
    float abLen = ab.mag();
    //println(ab + " " + abLen);
    PVector ac = c.sub(a);
    float acLen = ac.mag();
    PVector bc = c.sub(b);
    float bcLen = bc.mag();
    for (int i = 1; i<abLen; i++) {
      coords.add(partVec(ab, a, i));
    }
    for (int i = 1; i<acLen; i++) {
      coords.add(partVec(ac, a, i));
    }
    for (int i = 1; i<bcLen; i++) {
      coords.add(partVec(bc, b, i));
    }
    return coords;
  }
  private PVector partVec (PVector ab, PVector a, int mag) {
    ab.setMag(mag).add(a);
    return new PVector(ab.x, ab.y, ab.z);
  }
}
