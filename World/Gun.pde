public class Gun extends Obj {
  String NAME;
  int DMG;
  int MAGS;
  int BUL;
  public Gun(String name, int damage, int magNum, int magCap, ArrayList<Triangle> shape) {
    super(shape);
    this.NAME = name;
    this.DMG = damage;
    this.MAGS = magNum;
    this.BUL = magCap;
  }
  void shoot(Chr c) {
    c.changeHealth(-DMG);
  }
}
