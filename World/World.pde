import java.util.Collections;
final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 300;
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
final float speed = 5;
PVector dir = new PVector(0, 0, 0);
final float sensitivity = 20;
boolean test = true;
void setup() {
  size(1000, 600);
  if (!test) noCursor();
  c = new Camera();
  // ---Initializing World---
  PVector l = new PVector (100, 250, 100);
  for (int i = 0; i<5; i++) {
    Rect one = new Rect(new PVector (-450, -200, 100+200*i), l);
    Rect two = new Rect(new PVector (350, -200, 100+200*i), l);
    //PVector p2 = ;
    //c.addObject(new Rect(p, l));
    //c.addObject(new Rect(p2, l));
  }
  Rect centCube = new Rect(new PVector(-50, -400, 600), new PVector(100,100,100), color(255,100,100));
  centCube.rotateOnZ(45);
  c.addObject(centCube);
}
float dist(PVector a, PVector b) {
  //return a.sub(b).mag();
  return sqrt(sq(a.x - b.x) + sq(a.y - b.y) + sq(a.z - b.z));
}

void draw() {
  // --Mouse Control--
  if (!test) c.rotateByMouse();
  // --Update World--
  c.updatePos(dir);
  // --Screen--
  boolean breached = false;
  for (Obj obj : objs) {
    obj.translate(dir);
    if (obj.breached()) breached = true;  
  }
  if (breached) {
    for (Obj obj : objs) {
      obj.translate(PVector.mult(dir, -1));
    }
  }
  background(255);
  c.display();
  stroke(75);
  strokeWeight(2);
  line(width/2-10, height/2, width/2+10, height/2);
  line(width/2, height/2-10, width/2, height/2+10);
  strokeWeight(1);
}
void keyPressed() {
  switch (key) {
  case 'l':
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnY(10);
    }
    break;
  case 'j':
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnY(-10);
    }
    break;
  case 'i':
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(10);
    }
    break;
  case 'k':
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(-10);
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
    if (c.getLoc().y == 0) {
      dir.y = speed*2;
    }
    break;

  case 'p':
    for (Obj obj : objs) {
      println("------------");
      for (PVector p : obj.getPoints()) {
        println(p);
      }
    }
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
  }
}
