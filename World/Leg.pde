public class Leg {
  public PVector one;
  public PVector two;
  public PVector three;
  public PVector four;
  
  public Leg(PVector one_, PVector two_, PVector three_, PVector four_) {
    this.one = one_;
    this.two = two_;
    this.three = three_;
    this.four = four_;
  }
  
  public void move (PVector dir) {
    one.add(dir);
    two.add(dir);
    three.add(dir);
    four.add(dir);
  }
  public void moveToCenter (PVector target) {
    PVector dir = new PVector(four.x-target.x, 0, four.z-target.z);
    four.add(dir.setMag(1));
  }
  public void moveFromCenter (PVector target) {
    PVector dir = new PVector(four.x-target.x, 0, four.z-target.z);
    four.sub(dir.setMag(1));
  }
}
