public class Start {
  String state;
  int eNUM;
  String[] eNAMES = {"THE BAD MAN", "MR. K", "BABA YAGA", "THE UNCHOSEN ONE", "VECNA", "GOD"};
  public Start() {
    state = "START";
    eNUM = 0;
  }

  void changeState(String st) {
    if (st == "GAME") {
      eNUM++;
      progressGame();
    } 
    state = st;
  }
  
  void progressGame() {
    
    for (Gun g : INVENTORY) g.restock();
    PLAYER_HEALTH = 100;
    for (int i = 0; i < eNUM; i++) {
      PVector vo = new PVector(0, -30, -800);
      //vo.sub(c.getLoc());
      PVector v = new PVector(0, 0, 0);
      //len*(i+1)/(eNUM+1))
      v.add(xUnit.copy().mult(vo.x));
      v.add(yUnit.copy().mult(vo.y));
      v.add(zUnit.copy().mult(vo.z));
      v.add(c.getLoc());
      Enemy e = new Enemy(eNAMES[i % eNAMES.length], v);
      addEnemy(e);
    }
  }
}
