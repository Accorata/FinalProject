import java.util.Collections;
final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 300;
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
final float speed = 5;
PVector dir = new PVector(0, 0, 0);
final float sensitivity = 20;
boolean test = true;
ArrayList<Triangle> testTris = new ArrayList<Triangle>();
void setup() {
  size(1000, 600);
  if (!test) noCursor();
  c = new Camera();
  PVector p = new PVector (0,0,0);
  PVector p2 = new PVector (400, -100, -100);
  PVector l = new PVector (200, 200, 200);
  //testTris.add(new Triangle(p, p2, l));
  //testTris = testTris.get(0).splitTriangle(new Obj());
  Rect one = new Rect(p, 200, 3); //Max 3 resolution
  c.addObject(one);
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
  //background(100);
  //fill(255,50);
  //for (Triangle t : testTris) {
  //  PVector[] points = t.getPoints();
  //  triangle(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y); 
  //}
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
