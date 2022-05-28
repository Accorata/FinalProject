public class Rect extends Obj {
  public Rect (PVector pos, PVector size) {
    this(pos, size, color(0));
  }
  public Rect (PVector pos, PVector size, color c) {
    super();
    ArrayList<PVector> p = calcPoints(pos, size);
    ArrayList<Triangle> t = calcTriangles(p, c);
    setObj(p, t);
  }
  public Rect (PVector pos, float len) {
    this (pos, new PVector(len, len, len));
  }
  private ArrayList<PVector> calcPoints(PVector pos, PVector size) {
    ArrayList<PVector> p = new ArrayList<PVector>();
    p.add(pos);
    p.add(new PVector(pos.x, pos.y+size.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y+size.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y+size.y, pos.z+size.z));
    p.add(new PVector(pos.x+size.x, pos.y, pos.z+size.z));
    
    p.add(new PVector(pos.x, pos.y+size.y, pos.z+size.z));
    //p.add(new PVector(pos.x, pos.y, pos.z));   
    
    p.add(new PVector(pos.x, pos.y, pos.z+size.z));
    //p.add(new PVector(pos.x+size.x, pos.y+size.y, pos.z+size.z));
    //p.add(new PVector(pos.x+size.x, pos.y+size.y, pos.z));
    //p.add(new PVector(pos.x+size.x, pos.y, pos.z));
    //p.add(new PVector(pos.x+size.x, pos.y, pos.z+size.z));
    //p.add(new PVector(pos.x, pos.y+size.y, pos.z+size.z));
    //p.add(new PVector(pos.x, pos.y, pos.z));   
    //p.add(new PVector(pos.x, pos.y+size.y, pos.z));
    //p.add(new PVector(pos.x, pos.y, pos.z+size.z));
    return p;
  }
  //PVector v1 = new PVector(100, 100, 100);
  //PVector v2 = new PVector(100, 100, -100);
  //PVector v3 = new PVector(100, -100, -100);
  //PVector v4 = new PVector(100, -100, 100);
  //PVector v5 = new PVector(-100, 100, 100);
  //PVector v6 = new PVector(-100, -100, -100);
  //PVector v7 = new PVector(-100, 100, -100);
  //PVector v8 = new PVector(-100, -100, 100);
  private ArrayList<Triangle> calcTriangles(ArrayList<PVector> points, color c) {
    ArrayList<Triangle> t = new ArrayList<Triangle>();
    t.add(new Triangle(points.get(5), points.get(6), points.get(1), color(255, 153, 153)));
    t.add(new Triangle(points.get(1), points.get(2), points.get(5), color(255, 153, 153)));
    t.add(new Triangle(points.get(2), points.get(1), points.get(0), color(102, 255, 178)));
    t.add(new Triangle(points.get(0), points.get(3), points.get(2), color(102, 255, 178)));
    t.add(new Triangle(points.get(3), points.get(0), points.get(4), color(255, 204, 229)));
    t.add(new Triangle(points.get(4), points.get(7), points.get(3), color(255, 204, 229)));
    t.add(new Triangle(points.get(7), points.get(4), points.get(6), color(204, 229, 255)));
    t.add(new Triangle(points.get(6), points.get(7), points.get(5), color(204, 229, 255)));
    t.add(new Triangle(points.get(6), points.get(4), points.get(0), color(255, 229, 204)));
    t.add(new Triangle(points.get(0), points.get(1), points.get(6), color(255, 229, 204)));
    t.add(new Triangle(points.get(7), points.get(5), points.get(2), color(204, 229, 255)));
    t.add(new Triangle(points.get(2), points.get(7), points.get(3), color(204, 229, 255)));
    return t;
  }
  //t.add(new Triangle(v6, v7, v2, color(255, 153, 153)));
  //t.add(new Triangle(v2, v3, v6, color(255, 153, 153)));
  //t.add(new Triangle(v3, v2, v1, color(102, 255, 178)));
  //t.add(new Triangle(v1, v4, v3, color(102, 255, 178)));
  //t.add(new Triangle(v4, v1, v5, color(255, 204, 229)));
  //t.add(new Triangle(v5, v8, v4, color(255, 204, 229)));
  //t.add(new Triangle(v8, v5, v7, color(204, 229, 255)));
  //t.add(new Triangle(v7, v8, v6, color(204, 229, 255)));
  //t.add(new Triangle(v7, v5, v1, color(255, 229, 204)));
  //t.add(new Triangle(v1, v2, v7, color(255, 229, 204)));
  //t.add(new Triangle(v8, v6, v3, color(204, 229, 255)));
  //t.add(new Triangle(v3, v8, v4, color(204, 229, 255)));
}
