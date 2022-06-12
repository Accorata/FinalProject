import java.util.Collections;
import java.util.Arrays;
import java.util.Queue;
import java.util.ArrayDeque;
final float fromScreen = 300;
boolean jump = false;
final PVector place = new PVector(0, 0, -1 * fromScreen);
float speedAdjust = 1;
double AIM = 0;
ArrayList<Enemy> ENEMIES;
int PLAYER_HEALTH;
ArrayList<Gun> INVENTORY;
int curG;
float len = 4000;
float wid = 4000;
Plane sc = new Plane(100, color(0), len, wid);
float xAng = 0;
Camera c;
Light l;
ArrayList<Obj> objs = new ArrayList<Obj>();
final float speed = 5;
PVector dir = new PVector(0, 0, 0);
final float sensitivity = 20;
boolean test = true;
ArrayList<Triangle> testTris = new ArrayList<Triangle>();
UI ui;
float eAng = 0;
boolean aniEn = true;
Enemy e1 = new Enemy("THE BAD MAN", new PVector(800, -30, 100), new PVector(-1, 0, -2));
Enemy e3 = new Enemy("THE BABA YAGA", new PVector(-600, -30, -500));
Enemy e2 = new Enemy("THE UNCHOSEN ONE", new PVector(0, -30, -800));
ArrayList<Bullet> bullets;
Sphere sphere = new Sphere(new PVector(300, -50, 200), 100, color(40), 10, 10);//30 5
public PVector xUnit = new PVector(1, 0, 0);
public PVector yUnit = new PVector(0, 1, 0);
public PVector zUnit = new PVector(0, 0, 1);
public PVector xUnitInv = new PVector(1, 0, 0);
public PVector yUnitInv = new PVector(0, 1, 0);
public PVector zUnitInv = new PVector(0, 0, 1);

void setup() {
  size(1000, 600);
  if (!test) noCursor();
  c = new Camera();
  PLAYER_HEALTH = 100;
  ENEMIES = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  INVENTORY = new ArrayList<Gun>();
  INVENTORY.add(new Gun("Pistol", 20, 7, 12, color(0, 255, 0)));
  INVENTORY.add(new Gun("Deagle", 40, 3, 6, color(0, 0, 255)));
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
  //c.addObject(sphere);
  //c.addObject(new Pyramid(new PVector(-300, -100, 200), new PVector(100, -100, 100), color(70), 1));
  c.addObject(sc);
  //addEnemy(e1);
  //addEnemy(e2);
  addEnemy(e3);
  //for (int i = 0; i<12; i++) {
  //  addEnemy(new Enemy(""+i, new PVector(0, -30, 0)));
  //}
  //for (int i = 0; i<12; i++) {
  //  Enemy e = ENEMIES.get(i);
  //  e.setDir(i*30);
  //  //e.rotate(new PVector(0, i*30, 0));
  //}
}

void draw() {
  recalcInverses();
  //printMatrices();
  speedAdjust = 60/frameRate;
  //if (frameCount < 200) {
  for (Bullet bu : bullets) {
    bu.mve();
    
  }
  for (Enemy e : ENEMIES) {
    e.animate();

    //e.inventory.get(0).shoot(e);
  //  if (e.inSight()) {

    //e.moveTowards(new PVector(0, 0, 100));
    //e.turn(10);
    //  } else {
    //    e.wander();
    //  }
  }
  //}
  //e1.moveTowards(a);//.copy().add(c.getLoc()));
  //if (!e3.isDead()) {
  //  e2.moveTowards(e3.getCenter());
  //}
  //e1.rotate(a);
  PVector b = new PVector(1, 0, 0);
  //sphere.rotate(b);
  //l.sshine(c.Triangles);

  // --Mouse Control--
  if (!test) c.rotateByMouse();
  // --Update World--
  c.updatePos(dir);
  // --Screen--
  background(255);
  AIM = 0;

  c.display();

  //text(ENEMIES.get(0).getHealth() + "", 10, 20);
  ui.box(INVENTORY);
  ui.showHealth();
  ui.showEnemyHealth(inSight());
  stroke(75);
  strokeWeight(2);
  line(width/2-10, height/2, width/2+10, height/2);
  line(width/2, height/2-10, width/2, height/2+10);
  strokeWeight(1);
  //println(dir.y);
  //println(frameRate);
}

void keyPressed() {
  boolean breached = false;
  switch (key) {
  case 'l':
    for (Obj obj : objs) {
      obj.setCenter(place);
      obj.rotateOnX(-xAng);
      obj.rotateOnY(10);
      obj.rotateOnX(xAng);
      if (!obj.getBreachable() && obj.breached() != null) breached = true;
    }
    if (breached) {
      for (Obj obj : objs) {
        obj.rotateOnX(-xAng);
        obj.rotateOnY(-10);
        obj.rotateOnX(xAng);
      }
    } else {
      eAng+=10;
      rotateAxisOnY(xUnit, 10);
      rotateAxisOnY(yUnit, 10);
      rotateAxisOnY(zUnit, 10);
    }
    break;
  case 'j':
    for (Obj obj : objs) {
      obj.setCenter(place);
      obj.rotateOnX(-xAng);
      obj.rotateOnY(-10);
      obj.rotateOnX(xAng);
      if (!obj.getBreachable() && obj.breached() != null) breached = true;
    }
    if (breached) {
      for (Obj obj : objs) {
        obj.rotateOnX(-xAng);
        obj.rotateOnY(10);
        obj.rotateOnX(xAng);
      }
    } else {
      eAng-=10;
      rotateAxisOnY(xUnit, -10);
      rotateAxisOnY(yUnit, -10);
      rotateAxisOnY(zUnit, -10);
    }
    break;
  case 'i':
    if (xAng <= 80) {
      xAng += 10;
      for (Obj obj : objs) {
        obj.setCenter(place);
        obj.rotateOnX(10);
        if (!obj.getBreachable() && obj.breached() != null) breached = true;
      }
      if (breached) {
        for (Obj obj : objs) {
          obj.rotateOnX(-10);
        }
        xAng -= 10;
      } else {
        rotateAxisOnX(xUnit, 10);
        rotateAxisOnX(yUnit, 10);
        rotateAxisOnX(zUnit, 10);
      }
    }
    break;
  case 'k':
    if (xAng >= -80) {
      xAng -= 10;
      for (Obj obj : objs) {
        obj.setCenter(place);
        obj.rotateOnX(-10);
        if (!obj.getBreachable() && obj.breached() != null) breached = true;
      }
      if (breached) {
        for (Obj obj : objs) {
          obj.rotateOnX(10);
        }
        xAng += 10;
      } else {
        rotateAxisOnX(xUnit, -10);
        rotateAxisOnX(yUnit, -10);
        rotateAxisOnX(zUnit, -10);
      }
    }
    break;
  case 'w':
    dir.z = -speed;
    break;
  case 's':
    dir.z = speed;
    break;
  case 'a':
    dir.x = speed;
    break;
  case 'd':
    dir.x = -speed;
    break;
  case ' ':
    if (!jump)
      dir.y = 5;
    jump = true;

    break;
  case 'p':
    aniEn = !aniEn;
    break;
  case 't':
    if (mouseX > width/2-50 && mouseX < width/2+50) {
      if (mouseY > height/2-50 && mouseY < height/2+50) {
        test = !test;
      }
    }
    break;
  case '1':
    curG = 0;
    break;
  case '2':
    curG = 1;
    break;
  case '3':
    curG = 2;
    break;
  }
}

void keyReleased() {
  switch (key) {
  case 'w':
    dir.z = 0;
    break;
  case 's':
    dir.z = 0;
    break;
  case 'a':
    dir.x = 0;
    break;
  case 'd':
    dir.x = 0;
    break;
  case 'r':
    if (curG < INVENTORY.size()) {
      INVENTORY.get(curG).reload();
    }
    break;
  }
}

void mouseClicked() {

  if (curG < INVENTORY.size()) {
    INVENTORY.get(curG).shoot();

  }
}
