public class Cube extends Obj {
  public Cube (PVector pos, PVector size) {
    super();
    ArrayList<PVector> p = new ArrayList<PVector>();
    ArrayList<Triangle> t = new ArrayList<Triangle>();
    setObj(p, t);
  }
}
