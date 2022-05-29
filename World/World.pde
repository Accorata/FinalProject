import java.util.Collections;
final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 300;
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
final float speed = 5;
PVector pos = new PVector(0, 0, 0);
PVector dir = new PVector(0, 0, 0);
final float sensitivity = 20;
boolean test = true;
void setup() {
  size(1000, 600);
  if (!test) noCursor();
  c = new Camera();
  //PVector v1 = new PVector(100, 100, 100);
  //PVector v2 = new PVector(100, 100, -100);
  //PVector v3 = new PVector(100, -100, -100);
  //PVector v4 = new PVector(100, -100, 100);
  //PVector v5 = new PVector(-100, 100, 100);
  //PVector v6 = new PVector(-100, -100, -100);
  //PVector v7 = new PVector(-100, 100, -100);
  //PVector v8 = new PVector(-100, -100, 100);
  //ArrayList<Triangle> t = new ArrayList<Triangle>();
  //t.add(new Triangle(v6, v7, v2, color(255, 153, 153)));
  //t.add(new Triangle(v2, v3, v6, color(255, 153, 153)));
  //t.add(new Triangle(v3, v2, v1, color(102, 255, 178)));
  //t.add(new Triangle(v1, v4, v3, color(102, 255, 178)));
  //t.add(new Triangle(v4, v1, v5, color(255, 204, 229)));
  //t.add(new Triangle(v5, v8, v4, color(255, 204, 229)));
  //t.add(new Triangle(v8, v5, v7, color(204, 229, 255)));
  //t.add(new Triangle(v7, v8, v6, color(204, 229, 255)));
  //t.add(new Triangle(v7, v5, v1, color(255, 229, 204)));
  //t.add(new Triangle(v1, v2, v7, color(255, 229, 204)));
  //t.add(new Triangle(v8, v6, v3, color(204, 229, 255)));
  //t.add(new Triangle(v3, v8, v4, color(204, 229, 255)));
  //objs.add(new Obj(t));

  PVector p = new PVector (-100, -100, -100);
  PVector p2 = new PVector (400, -100, -100);
  PVector l = new PVector (200, 200, 200);
  c.addObject(new Rect(p, 200));
  c.addObject(new Rect(p2, l, color(255, 0, 0)));
  c.addObject(new Rect(new PVector(800, 200, 200), l, color(0, 255, 0)));

  //objs.get(0).rotateX(30);
  for (Obj obj : objs) {
    obj.translate(new PVector(0, 0, 200));
    obj.rotateOnZ(45);
  }
  //p.add(new PVector(100, 100, 100));
  //test = new Triangle(new PVector(100, 100), new PVector(200, 100), new PVector(100, 200));
  //ArrayList<PVector> coords = test.getCoords();
  ////println(coords);
  //stroke(0);
  //for (PVector coord : coords) {
  //  point(coord.x, coord.y);
  //  //circle(coord.x, coord.y,5);
  //}
  //PVector test = new PVector (100,0,0);
  //println(test.setMag(25));

  //objs.get(0).rotateOnZ(45);
}
float dist(PVector a, PVector b) {
  //return a.sub(b).mag();
  return sqrt(sq(a.x - b.x) + sq(a.y - b.y) + sq(a.z - b.z));
}

void draw() {
  // --Mouse Control--
  c.rotateByMouse();
  // --Update World--
  pos.add(dir);
  dir.y -= speed/30;
  if (pos.y <= 0) {
    for (Obj obj : objs) {
      obj.translate(new PVector(0, -pos.y, 0));
    }
    pos.y = 0;
    dir.y = 0;
  }
  // --Screen--
  background(255);
  for (Obj obj : objs) {
    obj.translate(dir);
    c.display();
  }
  stroke(75);
  strokeWeight(2);
  line(width/2-10, height/2, width/2+10, height/2);
  line(width/2, height/2-10, width/2, height/2+10);
  strokeWeight(1);
}

/*
void draw() {
 background(255);
 c.display();
 
 }
 */
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
    if (pos.y == 0) {
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
