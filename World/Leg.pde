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
  public void moveToCenter (PVector target, float mag) {
    PVector dir = new PVector(four.x-target.x, 0, four.z-target.z);
    three.add(dir.setMag(mag/5));
    four.add(dir.setMag(mag));
  }
  public void moveFromCenter (PVector target, float mag) {
    PVector dir = new PVector(four.x-target.x, 0, four.z-target.z);
    three.sub(dir.setMag(mag/5));
    four.sub(dir.setMag(mag));
  }
}
