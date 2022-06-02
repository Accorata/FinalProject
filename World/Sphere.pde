public class Sphere extends Obj {
  //ArrayList<PVector> ps;
  public Sphere(PVector pos, float radius, color clr) {
    super();
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ArrayList<PVector> ps = new ArrayList<PVector>();
    int m = 4;
    for (int theta = 0; theta <= 360; theta+=180/m) {
      float rSin = radius*sin(radians(theta));
      float rCos = radius*cos(radians(theta));
      ps.add(new PVector(pos.x+rSin, pos.y+rCos, pos.z));
      ps.add(new PVector(pos.x, pos.y+rCos, pos.z+rSin));
      //ps.add(new PVector(pos.x, pos.y, pos.z+rCos));
    }
    for (int i = 0; i<m*2+1; i++) {
      ts.add(new Triangle(ps.get(i*2), ps.get(i*2+1), ps.get(i*2), clr));
    }//ts.add(new Triangle(ps.get(0), ps.get(1), ps.get(2), clr));
    //ts.add(new Triangle(ps.get(2), ps.get(0), ps.get(3), clr));
    //this.ps = (ArrayList<PVector>) ps.clone();
    //super.setObj(ps, new ArrayList<Triangle>());
    //for (Triangle t : ts) {
    //  addTriangles(t.splitTriangle(this, 3));
    //}
    setObj(ps, ts);
  }
}
