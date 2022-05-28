public class Rect extends Obj {
  public Rect (PVector pos, PVector size) {
    super();
    ArrayList<PVector> p = calcPoints(pos, size);
    ArrayList<Triangle> t = calcTriangles(p);
    setObj(p, t);
  }
  public Rect (PVector pos, float len) {
    this (pos, new PVector(len, len, len));
  }
  private ArrayList<PVector> calcPoints(PVector pos, PVector size) {
    ArrayList<PVector> p = new ArrayList<PVector>();
    p.add(pos);
    p.add(new PVector(pos.x, pos.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y+size.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y+size.y, pos.z+size.z));
    p.add(new PVector(pos.x, pos.y+size.y, pos.z));
    p.add(new PVector(pos.x, pos.y+size.y, pos.z+size.z));
    p.add(new PVector(pos.x, pos.y, pos.z+size.z));
    p.add(new PVector(pos.x+size.x, pos.y, pos.z+size.z));
    return p;
  }
  private ArrayList<Triangle> calcTriangles(ArrayList<PVector> points) {
    ArrayList<Triangle> t = new ArrayList<Triangle>();
    return t;
  }
}
