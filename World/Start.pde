public class Start {
  String state;
  int eNUM;
  String[] eNAMES = {"THE BAD MAN", "MR. K", "BABA YAGA", "THE UNCHOSEN ONE", "VECNA", "GOD"};
  public Start() {
    state = "START";
    eNUM = 0;
  }

  void changeState(String st) {
    if (st == "GAME" && state == "GAME") {
      eNUM++;
      progessGame();
    } else if (st == "GAME" && state == "START") {
           eNUM++;
      startGame();
      
    }
    state = st;
  }
  void startGame() {
    c = new Camera();
    PLAYER_HEALTH = 100;
    ENEMIES = new ArrayList<Enemy>();
    bullets = new ArrayList<Bullet>();
    bulletsRemoved = new ArrayList<Bullet>();
    INVENTORY = new ArrayList<Gun>();
    INVENTORY.add(new Gun("Pistol", 20, 7, 12, color(0, 255, 0)));
    INVENTORY.add(new Gun("Deagle", 40, 3, 6, color(0, 0, 255)));
    INVENTORY.add(new Gun("Sniper", 99, 5, 1, color(0, 140, 140)));
    curG = 0;
    ui = new UI();
    //l = new Light(new PVector(500, 500, 500), 10);
    PVector p = new PVector (-650, -110, -300);
    PVector p2 = new PVector (500, -510, -100);
    PVector l = new PVector (200, 200, 200);
    //ENEMIES
    Rect one = new Rect(p, l, color(102, 0, 102), 1);
    Rect two = new Rect(p2, new PVector(100, 600, 300), color(51, 255, 255), 1);
    Rect three = new Rect(new PVector(-300, -210, 450), new PVector(700, 300, 100), color(255, 153, 51), 1);
    c.addObject(one);
    c.addObject(two);
    c.addObject(three);
    c.addObject(sphere);
    c.addObject(sc);
  }
  void progessGame() {
    for (Gun g : INVENTORY) g.restock();
    PLAYER_HEALTH = 100;
    for (int i = 0; i < eNUM; i++) {
      Enemy e = new Enemy(eNAMES[i % eNAMES.length], new PVector((i+1)*(len/2)/eNUM, -30, -300), new PVector(-1, 0, -2));
      addEnemy(e);
    }
  }
}
