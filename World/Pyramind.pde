public class Pyramid extends Obj {
  public Pyramid(PVector pos, PVector size, color clr, int split) {
    super();
    ArrayList<PVector> ps = calcPoints(pos, size);
    super.setObj(ps, new ArrayList<Triangle>());
    ArrayList<Triangle> ts = calcTriangles(ps, clr);
    for (Triangle t : ts) {
      addTriangles(t.splitTriangle(this, split));
    }
  }
  private ArrayList<PVector> calcPoints(PVector pos, PVector size) {
    ArrayList<PVector> p = new ArrayList<PVector>();
    p.add(pos);
    p.add(new PVector(pos.x+size.x, pos.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y, pos.z+size.z));  
    p.add(new PVector(pos.x, pos.y, pos.z+size.z));
    p.add(new PVector(pos.x+size.x/2, pos.y+size.y, pos.z+size.z/2));
    return p;
  }
  private ArrayList<Triangle> calcTriangles(ArrayList<PVector> points, color c) {
    ArrayList<Triangle> t = new ArrayList<Triangle>();
    t.add(new Triangle(points.get(0), points.get(1), points.get(2), c));
    t.add(new Triangle(points.get(0), points.get(3), points.get(2), c));
    t.add(new Triangle(points.get(0), points.get(1), points.get(4), c));
    t.add(new Triangle(points.get(0), points.get(3), points.get(4), c));
    t.add(new Triangle(points.get(2), points.get(1), points.get(4), c));
    t.add(new Triangle(points.get(2), points.get(3), points.get(4), c));
    return t;
  }
}
