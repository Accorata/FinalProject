public class Start {
  String state;
  int eNUM;
  String[] eNAMES = {"THE BAD MAN", "MR. K", "BABA YAGA", "THE UNCHOSEN ONE", "VECNA", "GOD"};
  public Start() {
    state = "START";
    eNUM = 0;
  }

  void changeState(String st) {
    cursor();
    if (st == "GAME" && state == "PROG") {
      eNUM++;
      startGame();
      progressGame();
    } else if (st == "GAME" && (state == "START" || state == "DEAD")) {
      eNUM = 1;
      startGame();
      progressGame();
    } else if (st == "DEAD") {
    } else if (st == "PROG") {
    }

    state = st;
  }
  void startGame() {
    objs = new ArrayList<Obj>();
    c = new Camera();
    quantize = true;
    xUnit = new PVector(1, 0, 0);
    yUnit = new PVector(0, 1, 0);
    zUnit = new PVector(0, 0, 1);
    xUnitInv = new PVector(1, 0, 0);
    yUnitInv = new PVector(0, 1, 0);
    zUnitInv = new PVector(0, 0, 1);
    aniEn = true;
    len = 4000;
    wid = 4000;
    jump = false;
    AIM = 0;
    dir = new PVector(0, 0, 0);
    test = true;
    eAng = 0;
    sc = new Plane(100, color(0), len, wid);
    xAng = 0;

    testTris = new ArrayList<Triangle>();
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
    PVector l = new PVector (100+random(50), 200, 100+random(50));
    //ArrayList<Sphere> stars = new ArrayList<Sphere>();
    //for (int i = 0; i<3; i++ ) {
    //  stars.add(new Sphere(new PVector(random(-4000,4000), -1000, random(-4000,4000)), 2, color(255), 45, 4));
    //}
    ArrayList<Rect> rects = new ArrayList<Rect>();
    for (int i = 0; i<3; i++ ) {
      rects.add(new Rect(new PVector(-200-random(1000), -100, 100-random(1000)), l, color(random(0,55),random(0,55),random(0,55)), 1));
      rects.add(new Rect(new PVector(-200-random(1000), -100, 500+random(1000)), l, color(random(0,55),random(0,55),random(0,55)), 1));
      rects.add(new Rect(new PVector(200+random(1000), -100, 500-random(1000)), l, color(random(0,55),random(0,55),random(0,55)), 1));
      rects.add(new Rect(new PVector(200+random(1000), -100, 100+random(1000)), l, color(random(0,55),random(0,55),random(0,55)), 1));
    }
    for (Rect rect : rects) {
      rect.rotate(new PVector(0, random(360), 0));
      c.addObject(rect);
    }
    //for (Sphere star : stars) {
    //  c.addObject(star);
    //}
    c.addObject(sc);
  }
  void progressGame() {

    for (Gun g : INVENTORY) g.restock();
    PLAYER_HEALTH = 100;
    for (int i = 0; i < eNUM; i++) {
      PVector vo = new PVector((len*(i+1)/(eNUM+1))-len/2, -30, -800);

      //len*(i+1)/(eNUM+1))

      Enemy e = new Enemy(eNAMES[i % eNAMES.length], vo);
      addEnemy(e);
    }
  }
}
