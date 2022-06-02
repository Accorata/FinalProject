public class Sphere extends Obj {
  //ArrayList<PVector> ps;
  public Sphere(PVector pos, float radius, color clr) {
    super();
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ArrayList<PVector> ps = new ArrayList<PVector>();
    for (int theta = 0; theta <= 180; theta+=45) {
      ps.add(new PVector(pos.x+radius, pos.y, pos.z));
      ps.add(new PVector(pos.x, pos.y+radius, pos.z));
      ps.add(new PVector(pos.x, pos.y, pos.z+radius));
    }
    //ps.add(new PVector(wid/2, yFloor, lth/2));
    //ps.add(new PVector(-wid/2, yFloor, lth/2));
    //ps.add(new PVector(-wid/2, yFloor, -lth/2));
    //ps.add(new PVector(wid/2, yFloor, -lth/2));
    //ts.add(new Triangle(ps.get(0), ps.get(1), ps.get(2), clr));
    //ts.add(new Triangle(ps.get(2), ps.get(0), ps.get(3), clr));
    //this.ps = (ArrayList<PVector>) ps.clone();
    //super.setObj(ps, new ArrayList<Triangle>());
    //for (Triangle t : ts) {
    //  addTriangles(t.splitTriangle(this, 3));
    //}
    setObj(ps, ts);
  }
}
