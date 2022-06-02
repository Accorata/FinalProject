public class Pyramid extends Obj {
  ArrayList<PVector> ps;
  public Pyramid(PVector pos, PVector size, color clr, int split) {
    super();
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ArrayList<PVector> ps = new ArrayList<PVector>();
    //ps.add(new PVector(wid/2, yFloor, lth/2));
    //ps.add(new PVector(-wid/2, yFloor, lth/2));
    //ps.add(new PVector(-wid/2, yFloor, -lth/2));
    //ps.add(new PVector(wid/2, yFloor, -lth/2));
    //ts.add(new Triangle(ps.get(0), ps.get(1), ps.get(2), clr));
    //ts.add(new Triangle(ps.get(2), ps.get(0), ps.get(3), clr));
    this.ps = (ArrayList<PVector>) ps.clone();
    super.setObj(ps, new ArrayList<Triangle>());
    for (Triangle t : ts) {
      addTriangles(t.splitTriangle(this, 3));
    }
  }
}
