public class Sphere extends Obj {
  //ArrayList<PVector> ps;
  public Sphere(PVector pos, float radius, color clr) {
    super(); 
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ArrayList<PVector> ps = new ArrayList<PVector>();
    int angle = 45;
    int rows = 10;
    int rowAngle = 360/rows;

    ps.add(new PVector(pos.x, pos.y+radius, pos.z));

    //for (int theta = angle; theta < 180; theta+=angle) {
      int theta = angle;
      float rSin = radius*sin(radians(theta));
      float rCos = radius*cos(radians(theta));
      for (int phi = 0; phi < 360; phi += rowAngle) {
        
        float sinP = sin(radians(phi));
        float cosP = cos(radians(phi));
        println(sinP + " " + cosP);
        ps.add(new PVector(pos.x+rSin*cosP, pos.y+rCos, pos.z+rSin*sinP));
        //ps.add(new PVector(pos.x, pos.y+rCos, pos.z+rSin));//*sinP
        //ps.add(new PVector(pos.x, pos.y, pos.z+rCos));
      }
    //}
    //println(ps.size());
    ts.add(new Triangle(ps.get(0), ps.get(rows), ps.get(1)));
    for (int i = 1; i<rows; i++) {
      ts.add(new Triangle(ps.get(0), ps.get(i), ps.get(i+1)));
    }
    //for (int i = 0; i<rows; i++) {
    //  ts.add(new Triangle(ps.get(0), ps.get(i+1), ps.get(i+2)));
    //  ts.add(new Triangle(ps.get(0), ps.get(ps.size()-i-1), ps.get(ps.size()-i-2)));
    //}
    //ts.add(new Triangle(ps.get(0), ps.get(1), ps.get(2)));
    //ts.add(new Triangle(ps.get(0), ps.get(2), ps.get(ps.size()-2)));
    //ts.add(new Triangle(ps.get(0), ps.get(ps.size()-2), ps.get(ps.size()-1)));
    //ts.add(new Triangle(ps.get(0), ps.get(ps.size()-1), ps.get(1)));

    //ts.add(new Triangle(ps.get(1), ps.get(2), ps.get(3)));
    //ts.add(new Triangle(ps.get(4), ps.get(2), ps.get(3)));

    //ts.add(new Triangle(ps.get(2), ps.get(ps.size()-2), ps.get(4)));
    //ts.add(new Triangle(ps.get(ps.size()-4), ps.get(ps.size()-2), ps.get(4)));

    //ts.add(new Triangle(ps.get(ps.size()-2), ps.get(ps.size()-1), ps.get(ps.size()-4)));
    //ts.add(new Triangle(ps.get(ps.size()-3), ps.get(ps.size()-1), ps.get(ps.size()-4)));

    //ts.add(new Triangle(ps.get(ps.size()-1), ps.get(1), ps.get(ps.size()-3)));
    //ts.add(new Triangle(ps.get(3), ps.get(1), ps.get(ps.size()-3)));


    //ts.add(new Triangle(ps.get(0), ps.get(3), ps.get(4)));
    //for (int i = 0; i<m*2+1; i++) {
    //  ts.add(new Triangle(ps.get(i*2), ps.get(i*2+1), ps.get(i*2), clr));
    //}//ts.add(new Triangle(ps.get(0), ps.get(1), ps.get(2), clr));
    //ts.add(new Triangle(ps.get(2), ps.get(0), ps.get(3), clr));
    //this.ps = (ArrayList<PVector>) ps.clone();
    //super.setObj(ps, new ArrayList<Triangle>());
    //for (Triangle t : ts) {
    //  addTriangles(t.splitTriangle(this, 3));
    //}
    setObj(ps, ts);
  }
}
