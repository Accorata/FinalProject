public class Gun extends Obj {
  String NAME;
  int DMG;
  int MAGS;
  int BUL;
  int curBUL;
  int totBUL;
  public Gun(String name, int damage, int magNum, int magCap) {
    super();
    this.NAME = name;
    this.DMG = damage;
    this.MAGS = magNum;
    this.BUL = magCap;
    this.curBUL = magCap;
    this.totBUL = (magCap * magNum) - magCap;
  }
  String getNAME() {
    return NAME;
  }
  void shoot(Enemy c, boolean hit) {
    if (curBUL != 0) {
      if (hit) c.changeHealth(-DMG);
      curBUL--;
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
  void shoot() {
    PLAYER_HEALTH -= DMG;
  }
}
