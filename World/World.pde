import java.util.Collections;
import java.util.Arrays;
import java.util.Queue;
import java.util.ArrayDeque;
final float fromScreen = 300;
boolean jump;
PImage sky;
final PVector place = new PVector(0, 0, -1 * fromScreen);
float speedAdjust = 1;
double AIM;
ArrayList<Enemy> ENEMIES;
int PLAYER_HEALTH;
ArrayList<Gun> INVENTORY;
int curG;
float len;
float wid;
Plane sc;
float xAng;
Camera c;
Light l;
ArrayList<Obj> objs;
final float speed = 5;
PVector dir;
final float sensitivity = 20;
boolean test;
ArrayList<Triangle> testTris;
UI ui;
boolean quantize;
float eAng;
boolean aniEn;
Enemy e1 = new Enemy("THE BAD MAN", new PVector(800, -30, 100), new PVector(-1, 0, -2));
Enemy e3 = new Enemy("THE BABA YAGA", new PVector(-600, -30, -500));
Enemy e2 = new Enemy("THE UNCHOSEN ONE", new PVector(0, -30, -800));
ArrayList<Bullet> bullets;
ArrayList<Bullet> bulletsRemoved;

public PVector xUnit;
public PVector yUnit;
public PVector zUnit;
public PVector xUnitInv;
public PVector yUnitInv;
public PVector zUnitInv;
Start s = new Start();

void setup() {
  size(1000, 600);
  sky = loadImage("download.jpg");
  sky.resize(width, height);
  //noCursor();
}

void draw() {
  if (s.state == "GAME") {
    recalcInverses();
    //printMatrices();
    speedAdjust = 60/frameRate;
    //if (frameCount < 200) {

    for (Bullet bu : bullets) {
      bu.mve();
    }
    for (Bullet bu : bulletsRemoved) {
      bullets.remove(bu);
    }
    if (isDead()) s.changeState("DEAD");
    for (Enemy e : ENEMIES) {
      if (aniEn) e.animate();
    }
    if (ENEMIES.size() == 0) s.changeState("PROG");
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
  } else if (s.state == "START") {
    background(sky);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("THE SAME NEW WORLD", width/2, height/2);
    textSize(20);
    text("Henry Bach & Raymond Allie", width/2, height/2 + 40);
    alt();
    fill(col);
    text("CLICK ANYWHERE TO START", width/2, 40);
    textAlign(BASELINE);
  } else if (s.state == "DEAD") {
    aniEn = false;
    c.display();
    fill(150, 0, 0);
    textAlign(CENTER);
    textSize(50);
    text("YOU DIED", width/2, height/2);
    textSize(25);
    fill(0);
    text("CLICK ANYWHERE TO RESTART", width/2, height/2 + 40);
    textAlign(BASELINE);
  } else if (s.state == "PROG") {
    aniEn = false;
    c.display();
    fill(150, 0, 0);
    textAlign(CENTER);
    textSize(50);
    text("YOU WON", width/2, height/2);
    textSize(25);
    fill(0);
    text("CLICK ANYWHERE TO CONTINUE TO NEXT LEVEL", width/2, height/2 + 40);
    textAlign(BASELINE);
  }
}
int col = 0;
boolean add = true;
void alt() {
  if (col >= 255) {
    add=false;
  } else if (col <= 0) {
    add =true;
  }
  if (add) {
    col++;
  } else {
    col--;
  }
}
void keyPressed() {
  if (s.state == "GAME") {
    boolean breached = false;
    switch (key) {
    case 'l':
      for (Obj obj : objs) {
        obj.setCenter(place);
        obj.rotateOnX(-xAng);
        obj.rotateOnY(10);
        obj.rotateOnX(xAng);
      }
      eAng+=10;
      rotateAxisOnY(xUnit, 10);
      rotateAxisOnY(yUnit, 10);
      rotateAxisOnY(zUnit, 10);
      break;
    case 'j':
      for (Obj obj : objs) {
        obj.setCenter(place);
        obj.rotateOnX(-xAng);
        obj.rotateOnY(-10);
        obj.rotateOnX(xAng);
      }
      eAng-=10;
      rotateAxisOnY(xUnit, -10);
      rotateAxisOnY(yUnit, -10);
      rotateAxisOnY(zUnit, -10);
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
      if (test) {
        if (mouseX > width/2-50 && mouseX < width/2+50) {
          if (mouseY > height/2-50 && mouseY < height/2+50) {
            test = false;
            noCursor();
          }
        }
      } else {
        test = true;
        cursor();
      }
      break;
    case 'i':
      if (xAng <= 80) {
        for (Obj obj : objs) {
          obj.setCenter(place);
          obj.rotateOnX(10);
        }
        xAng += 10;
        rotateAxisOnX(xUnit, 10);
        rotateAxisOnX(yUnit, 10);
        rotateAxisOnX(zUnit, 10);
      }
      break;
    case 'k':
      if (xAng >= -80) {
        for (Obj obj : objs) {
          obj.setCenter(place);
          obj.rotateOnX(-10);
        }
        xAng -= 10;
        rotateAxisOnX(xUnit, -10);
        rotateAxisOnX(yUnit, -10);
        rotateAxisOnX(zUnit, -10);
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
    case 'q': 
      quantize = !quantize;
      break;
    }
  } else if (s.state == "START" || s.state == "DEAD" || s.state == "PROG") {
    s.changeState("GAME");
  }
}



void keyReleased() {
  if (s.state == "GAME") {
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
}

void mouseClicked() {
  if (s.state == "GAME") {
    if (curG < INVENTORY.size()) {
      INVENTORY.get(curG).shoot();
    }
  } else if (s.state == "START" || s.state == "DEAD" || s.state == "PROG") {
    s.changeState("GAME");
  }
}
