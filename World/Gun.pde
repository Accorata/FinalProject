public class Gun extends Obj {
  private String NAME;
  private int DMG;
  private int BUL;
  private int curBUL;
  private int totBUL;
  private color bColor;

  public Gun(String name, int damage, int magNum, int magCap) {
    this(name, damage, magNum, magCap, color(255, 0, 0));
  }
  public Gun(String name, int damage, int magNum, int magCap, color bClr) {
    super();
    this.NAME = name;
    this.DMG = damage;
    this.BUL = magCap;
    this.curBUL = magCap;
    this.totBUL = (magCap * magNum) - magCap;
    this.bColor = bClr;
  }
  String getNAME() {
    return NAME;
  }
  void shoot() {
    if (curBUL != 0) {
      curBUL--;
      Bullet bu = new Bullet(new PVector(20, 30, -fromScreen), getTarget(), color(255, 0, 0), DMG, false);    
      bullets.add(bu);
      c.addObject((Obj)bu);
    }
  }
  void shoot(Enemy e) {
    Bullet bu = new Bullet(e.getCenter().copy(), e.getTarget(), color(255, 0, 0), DMG, true);    
    bullets.add(bu);
    c.addObject((Obj)bu);
  }
  void reload() {
    if (totBUL > 0) {
      totBUL -= (BUL - curBUL);   
      curBUL = BUL;
      if (totBUL < 0) {
        curBUL += totBUL;
        totBUL = 0;
      }
    }
  }
  int getTOT() {
    return totBUL;
  }
  int getCUR() {
    return curBUL;
  }
}
