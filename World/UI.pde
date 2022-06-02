public class UI {
  public UI() {}
  void box(ArrayList<Gun> gs) {
    fill(255);
    strokeWeight(4);
    for (int i = 0; i < 3; i++) {
      stroke(0);
      if (curG == i) stroke(51, 153, 255);
      rect(width-(250- 70*i), height-80, 50,50);  
      if (gs.size() > i) {
        fill(0);
        textSize(13);
        text(""+ gs.get(i).getCUR(), width-(250- 70*i)+17, height-60);
        text(""+ gs.get(i).getTOT(), width-(250- 70*i)+17, height-45);
        textSize(7);
        text(""+ gs.get(i).getNAME(), width-(250- 70*i)+15.5, height-35);
        fill(255);
      }
    }
  }
  void showHealth() {
    textSize(20);
    if (PLAYER_HEALTH >= 80) {
      fill(0, 204, 0);
    } else if (PLAYER_HEALTH > 20) {
      fill(102, 102, 0);
    } else {
      fill(255, 0, 0);
    }
    text("" + PLAYER_HEALTH, 40, height - 50);
  }
  void showEnemyHealth(Enemy e) {
    if (e != null) {
      textSize(15);
      fill(0);
      text(e.getName(), 40, 50);  
    
    if (e.getHealth() >= 80) {
      fill(0, 204, 0);
    } else if (e.getHealth() > 20) {
      fill(102, 102, 0);
    } else {
      fill(255, 0, 0);
    }
    
    text(e.getHealth(), 40, 70);  
  }}
}
