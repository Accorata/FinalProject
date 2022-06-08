public class Leg {
  public PVector one;
  public PVector two;
  public PVector three;
  
  public Leg(PVector one_, PVector two_, PVector three_) {
    this.one = one_;
    this.two = two_;
    this.three = three_;
  }
  
  public void move (PVector dir) {
    one.add(dir);
    two.add(dir);
    three.add(dir);
  }
}
