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
  //void rotate(float deg){

  //}
}
