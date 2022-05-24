public class Obj {
  public ArrayList<PVector> points;
  PVector center;
  public Obj () {
    this(new ArrayList<PVector>());
  }
  public Obj (ArrayList<PVector> points_) {
    points = points_;
    center = calcCenter();
  }
  PVector calcCenter () {
    PVector cent = new PVector(0, 0, 0);
    for (PVector vec : points) {
      cent.add(vec);
    }
    cent.div(points.size());
    return cent;
  }
  void rotateX(float deg){
    float rad = radians(deg);
    for (PVector point : points){
      PVector xy = new PVector(point.x, point.y, 0);
      point.x = xy.mag() * cos(rad);
      point.y = xy.mag() * sin(rad);
      PVector xy2 = new PVector(point.x, point.y, 0);
      println(xy.mag() + " " + xy2.mag());
    }
  }
}
