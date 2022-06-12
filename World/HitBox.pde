public class HitBox extends Obj {
  public HitBox () {
    super();
    super.setObj(place.copy());
    super.setDAvg(50);
    super.setID(5);
  }
  
  @Override
  PVector getCenter() {
    return place;
  }
}
