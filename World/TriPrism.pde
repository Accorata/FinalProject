public class TriPrism extends Obj {
  public TriPrism(PVector p1, PVector p2, PVector p3, PVector p4, color clr, int split) {
    super();
    ArrayList<PVector> ps = new ArrayList<PVector>();
    ps.add(p1);
    ps.add(p2);
    ps.add(p3);
    ps.add(p4);
    super.setObj(ps, new ArrayList<Triangle>());
    ArrayList<Triangle> ts = calcTriangles(ps, clr);
    for (Triangle t : ts) {
      addTriangles(t.splitTriangle(this, split));
    }
  }
  private ArrayList<Triangle> calcTriangles(ArrayList<PVector> points, color c) {
    ArrayList<Triangle> t = new ArrayList<Triangle>();
    t.add(new Triangle(points.get(0), points.get(1), points.get(2), c));
    t.add(new Triangle(points.get(0), points.get(1), points.get(3), c));
    t.add(new Triangle(points.get(2), points.get(1), points.get(3), c));
    t.add(new Triangle(points.get(2), points.get(3), points.get(0), c));
    return t;
  }
}
