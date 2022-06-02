public class Sphere extends Obj {
  public Sphere(PVector pos, float radius, color clr, int angle, int rows) {
    super(); 
    ArrayList<Triangle> ts = new ArrayList<Triangle>();
    ArrayList<PVector> ps = new ArrayList<PVector>();
    int rowAngle = 360/rows;
    ps.add(new PVector(pos.x, pos.y+radius, pos.z));
    for (int theta = angle; theta < 180; theta+=angle) {
      float rSin = radius*sin(radians(theta));
      float rCos = radius*cos(radians(theta));
      for (int phi = 0; phi < 360; phi += rowAngle) {      
        float sinP = sin(radians(phi));
        float cosP = cos(radians(phi));
        ps.add(new PVector(pos.x+rSin*cosP, pos.y+rCos, pos.z+rSin*sinP));
      }
    }
    ps.add(new PVector(pos.x, pos.y-radius, pos.z));
    ts.add(new Triangle(ps.get(0), ps.get(rows), ps.get(1), clr));
    for (int i = 1; i<rows; i++) {
      ts.add(new Triangle(ps.get(0), ps.get(i), ps.get(i+1), clr));
    }
    int levels = 180/angle;
    for (int i = 1; i<levels-1; i++) {
      ts.add(new Triangle(ps.get(rows*i), ps.get(1+rows*(i-1)), ps.get(rows*i+rows), clr));
      ts.add(new Triangle(ps.get(rows*i+1), ps.get(1+rows*(i-1)), ps.get(rows*i+rows), clr));
      for (int j = 1; j<rows; j++) {
        ts.add(new Triangle(ps.get(j+rows*(i-1)), ps.get(j+1+rows*(i-1)), ps.get(j+rows*i), clr));
        ts.add(new Triangle(ps.get(j+1+rows*(i-1)), ps.get(j+1+rows*i), ps.get(j+rows*i), clr));
      }
    }
    int end = ps.size()-1;
    ts.add(new Triangle(ps.get(end), ps.get(end-rows), ps.get(end-1), clr));
    for (int i = 1; i<rows; i++) {
      ts.add(new Triangle(ps.get(end), ps.get(end-i), ps.get(end-i-1), clr));
    }
    setObj(ps, ts);
  }
}
