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
}
