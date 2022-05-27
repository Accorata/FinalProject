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
    println(a_to_b + " " + abLen);
    PVector a_to_c = c.sub(a);
    float acLen = a_to_c.mag();
    PVector b_to_c = c.sub(b);
    float bcLen = b_to_c.mag();
    //a_to_b.normalize();
    for (int i = 1; i<abLen; i++) {
      //a_to_b.setMag(i).add(a);
      //println(a_to_b);
      coords.add(partVec(a_to_b, a, i));
    }
    for (int i = 1; i<acLen; i++) {
      //a_to_b.setMag(i).add(a);
      //println(a_to_b);
      coords.add(partVec(a_to_c, a, i));
    }
    for (int i = 1; i<bcLen; i++) {
      //a_to_b.setMag(i).add(a);
      //println(a_to_b);
      coords.add(partVec(b_to_c, b, i));
    }
    //for (int i = 1; i<acLen; i++) {
    //  coords.add(a_to_c.setMag(i).add(a));
    //}
    //for (int i = 1; i<bcLen; i++) {
    //  coords.add(b_to_c.setMag(i).add(b));
    //}
    return coords;
  }
  private PVector partVec (PVector ab, PVector a, int mag) {
    ab.setMag(mag).add(a);
    return new PVector(ab.x, ab.y, ab.z);
  }
}
