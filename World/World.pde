import java.util.Collections;
import java.util.Arrays;
final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 300;
double AIM = 0;
ArrayList<Enemy> ENEMIES;
int PLAYER_HEALTH;
ArrayList<Gun> INVENTORY;
int curG;
Plane sc = new Plane(100, color(0), 2000, 2000);
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


void setup() {
  size(1000, 600);
  if (!test) noCursor();
  c = new Camera();
  PLAYER_HEALTH = 100;
  ENEMIES = new ArrayList<Enemy>();
  
  INVENTORY = new ArrayList<Gun>();
  INVENTORY.add(new Gun("Pistol", 20, 7, 12));
  INVENTORY.add(new Gun("Deagle", 40, 3, 6));
  curG = 0;
  ui = new UI();
  //l = new Light(new PVector(500, 500, 500), 10);
  PVector p = new PVector (-650, -110, -300);
  PVector p2 = new PVector (500, -510, -100);
  PVector l = new PVector (200, 200, 200);
  //ENEMIES
  //testTris.add(new Triangle(p, p2, l));
  //testTris = testTris.get(0).splitTriangle(new Obj());
  Rect one = new Rect(p, l, color(102, 0, 102), 1);
  Rect two = new Rect(p2, new PVector(100, 600, 300), color(51, 255, 255), 1);
  Rect three = new Rect(new PVector(-300, -210, 450), new PVector(700, 300, 100), color(255, 153, 51), 1);
  //Rect four =  new Rect(
  //c.addObject(one);
  //c.addObject(new Rect(p2, l, color(255, 0, 0)));
  //c.addObject(new Rect(new PVector(0, -200, 100), l, color(0, 255, 0)));
  c.addObject(one);
  c.addObject(two);
  c.addObject(three);
 // c.addObject(four);
  //objs.get(0).rotateX(30);
  /*
  for (Obj obj : objs) {
    obj.translate(new PVector(0, 0, 200));
    obj.rotateOnZ(45);
    //obj.rotateOnY(135);
  }*/
  //c.addObject(new Sphere(new PVector(500,-200,200), 100, color(0)));
  c.addObject(sc);
  Enemy e1 = new Enemy("THE BAD MAN", new PVector(800, -100, 100));
  Enemy e3 = new Enemy("THE BABA YAGA", new PVector(-600, -100, -500));
  Enemy e2 = new Enemy("THE UNCHOSEN ONE", new PVector(0, -100, -800));
  ENEMIES.add(e2);
  c.addObject(e2);
  c.addObject(e3);
  ENEMIES.add(e3);
  ENEMIES.add(e1);
  c.addObject(e1);
}
void draw() {
  //l.shine(c.Triangles);
  // --Mouse Control--
  if (!test) c.rotateByMouse();
  // --Update World--
  
  //c.updatePos(dir);
  boolean breached = false;
  //dir.y -= 0.1;
  //if (c.getLoc().y < 0) {
  //  dir.y = 0;
  //}
  for (Obj obj : objs) {
    obj.setCenter(new PVector(0, 0, -1 * fromScreen));
    obj.rotateOnX(-xAng);
    obj.translate(dir);
    obj.setCenter(new PVector(0, 0, -1 * fromScreen));
    obj.rotateOnX(xAng);
    if (!obj.getBreachable() && obj.breached()) breached = true;
  }
  if (breached) {
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(-xAng);
      obj.translate(PVector.mult(dir, -1));
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(xAng);
    }
  }
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
}

void keyPressed() {
  boolean breached = false;
  switch (key) {
  case 'l':

    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(-xAng);
      obj.rotateOnY(10);
      obj.rotateOnX(xAng);
      if (!obj.getBreachable() && obj.breached()) breached = true;
    }
    if (breached) {
      for (Obj obj : objs) {
        obj.rotateOnX(-xAng);
        obj.rotateOnY(-10);
        obj.rotateOnX(xAng);
      }
    }

    break;
  case 'j':

    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(-xAng);
      obj.rotateOnY(-10);
      obj.rotateOnX(xAng);
      if (!obj.getBreachable() && obj.breached()) breached = true;
    }
    if (breached) {
      for (Obj obj : objs) {
        obj.rotateOnX(-xAng);
        obj.rotateOnY(10);
        obj.rotateOnX(xAng);
      }
    }
    break;
  case 'i':
    if (xAng <= 80) {
      xAng += 10;
      for (Obj obj : objs) {
        obj.setCenter(new PVector(0, 0, -1 * fromScreen));
        obj.rotateOnX(10);
        if (!obj.getBreachable() && obj.breached()) breached = true;
      }
      if (breached) {
        for (Obj obj : objs) {
          obj.rotateOnX(-10);
        }
        xAng -= 10;
      }
    }
    break;

  case 'k':
    if (xAng >= -80) {
      xAng -= 10;
      for (Obj obj : objs) {
        obj.setCenter(new PVector(0, 0, -1 * fromScreen));
        obj.rotateOnX(-10);
        if (!obj.getBreachable() && obj.breached()) breached = true;
      }
      if (breached) {
        for (Obj obj : objs) {
          obj.rotateOnX(10);
        }
        xAng += 10;
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
    //case ' ':
    //  if (c.getLoc().y == 0) {
    //    dir.y = speed*2;
    //  }
    //  break;
  case 'p':
    for (Obj obj : objs) {
      println("------------");
      for (PVector p : obj.getPoints()) {
        println(p);
      }
    }
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
    INVENTORY.get(curG).reload();
    break;
  }
}
void mouseClicked() {
  Enemy E = inSight();
  if (E != null) {
    INVENTORY.get(curG).shoot(E, true);
    if (E.isDead()) {
      ENEMIES.remove(E);
      objs.remove(E);
      for (int i = 0; i < c.Triangles.size(); i++) {
        if (c.Triangles.get(i).ID == E.ID) {
          c.Triangles.remove(i);
          i--;
        }
      }
    }
  } else { INVENTORY.get(curG).shoot(E, false);}
}
