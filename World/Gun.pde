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
  void shoot(Enemy c, boolean hit) {
    if (curBUL != 0) {
      if (hit) c.changeHealth(-DMG);
      curBUL--;
      animateBullet(new PVector(700, height), new PVector(width/2, height/2));
    }
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
  void shoot(PVector source, PVector dest) {
    PLAYER_HEALTH -= DMG;
    animateBullet(source, dest);
  }
  void animateBullet(PVector source, PVector dest) {
    Queue q = new ArrayDeque<Float[][]>();
    float cy = dest.y - source.y;//neg
    float cx = dest.x - source.x;//neg
    float count = 0;
    for (int i = 0; i < 5; i++) {
      Float[][] cord = new Float[3][3];

      cord[0][0] = (float) source.x + (i+count)*cx/5;
      cord[0][1] = (float) source.y + (i+count)*cy/5;
      cord[1][0] = (float) source.x + (i+.4)*cx/5;
      cord[1][1] = (float) source.y + (i+.4)*cy/5;
      cord[2] = new Float[]{red(bColor), green(bColor), blue(bColor)};
      q.add(cord);
      count+=.1;
    }
    bullets.add(q);
  }
}
