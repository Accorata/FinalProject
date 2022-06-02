public class Sphere extends Obj {
  public Sphere(PVector pos, float radius, color clr, int angle, int rows) {
    super(); 
    ArrayList<PVector> ps = calcPoints(pos, radius, angle, rows);
    ArrayList<Triangle> ts = calcTriangles(ps, angle, rows, clr);
    setObj(ps, ts);
  }
  private ArrayList<PVector> calcPoints (PVector pos, float radius, int angle, int rows) {
    ArrayList<PVector> points = new ArrayList<PVector>();
    int rowAngle = 360/rows;
    points.add(new PVector(pos.x, pos.y+radius, pos.z));
    for (int theta = angle; theta < 180; theta+=angle) {
      float rSin = radius*sin(radians(theta));
      float rCos = radius*cos(radians(theta));
      for (int phi = 0; phi < 360; phi += rowAngle) {      
        float sinP = sin(radians(phi));
        float cosP = cos(radians(phi));
        points.add(new PVector(pos.x+rSin*cosP, pos.y+rCos, pos.z+rSin*sinP));
      }
    }
    points.add(new PVector(pos.x, pos.y-radius, pos.z));
    return points;
  }
  private ArrayList<Triangle> calcTriangles (ArrayList<PVector> points, int angle, int rows, color clr) {
    ArrayList<Triangle> triangles = new ArrayList<Triangle>();
    triangles.add(new Triangle(points.get(0), points.get(rows), points.get(1), clr));
    for (int i = 1; i<rows; i++) {
      triangles.add(new Triangle(points.get(0), points.get(i), points.get(i+1), clr));
    }
    int levels = 180/angle;
    for (int i = 1; i<levels-1; i++) {
      triangles.add(new Triangle(points.get(rows*i), points.get(1+rows*(i-1)), points.get(rows*i+rows), clr));
      triangles.add(new Triangle(points.get(rows*i+1), points.get(1+rows*(i-1)), points.get(rows*i+rows), clr));
      for (int j = 1; j<rows; j++) {
        triangles.add(new Triangle(points.get(j+rows*(i-1)), points.get(j+1+rows*(i-1)), points.get(j+rows*i), clr));
        triangles.add(new Triangle(points.get(j+1+rows*(i-1)), points.get(j+1+rows*i), points.get(j+rows*i), clr));
      }
    }
    int end = points.size()-1;
    triangles.add(new Triangle(points.get(end), points.get(end-rows), points.get(end-1), clr));
    for (int i = 1; i<rows; i++) {
      triangles.add(new Triangle(points.get(end), points.get(end-i), points.get(end-i-1), clr));
    }
    return triangles;
  }
}
