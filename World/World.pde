import java.util.Collections;
import java.util.Arrays;
final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 300;
int PLAYER_HEALTH;
ArrayList<Gun> INVENTORY;
Plane sc = new Plane(100, color(40, 30, 200), 2000, 2000);
float xAng = 0;
Camera c;
Light l;
ArrayList<Obj> objs = new ArrayList<Obj>();
final float speed = 5;
PVector dir = new PVector(0, 0, 0);
final float sensitivity = 20;
boolean test = true;
ArrayList<Triangle> testTris = new ArrayList<Triangle>();
/*
void setup() {
 size(1000, 600);
 double[][] test = new double[600][1000];
 for (int i = 0; i < test.length; i++) {
    for (int j = 0; j < test[i].length; j++) {
       test[i][j] = 0;
    }
 }
 Light l = new Light(new PVector(0, 0, 0), 10);
 l.plot(100, 100, 200, 150, 50, 200, test, 1);
 display(test);
}
*/
void setup() {
  size(1000, 600);
  if (!test) noCursor();
  c = new Camera();
  PLAYER_HEALTH = 100;
  //l = new Light(new PVector(500, 500, 500), 10);
  PVector p = new PVector (-800, -200, -600);
  PVector p2 = new PVector (400, -100, -100);
  PVector l = new PVector (200, 200, 200);

  //testTris.add(new Triangle(p, p2, l));
  //testTris = testTris.get(0).splitTriangle(new Obj());
  Rect one = new Rect(p, 200, 1);
  //c.addObject(one);
  //c.addObject(new Rect(p2, l, color(255, 0, 0)));
  c.addObject(new Rect(new PVector(0, -200, 100), l, color(0, 255, 0)));
  c.addObject(one);
  
  //objs.get(0).rotateX(30);
  for (Obj obj : objs) {
    obj.translate(new PVector(0, 0, 200));
    obj.rotateOnZ(45);
    //obj.rotateOnY(135);
  }
  c.addObject(sc);
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
void draw() {
  //l.shine(c.Triangles);
  // --Mouse Control--
  if (!test) c.rotateByMouse();
  // --Update World--

  //c.updatePos(dir);
  // --Screen--
  boolean breached = false;
  //println(sc.ps);
  for (Obj obj : objs) {
    
    obj.setCenter(new PVector(0, 0, -1 * fromScreen));
    obj.rotateOnX(-xAng);

    obj.translate(dir);
    obj.setCenter(new PVector(0, 0, -1 * fromScreen));
    obj.rotateOnX(xAng);

    if (!obj.getBreachable() && obj.breached()) breached = true;  
    //}
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
      obj.rotateOnX(-xAng);
      obj.rotateOnY(10);
      obj.rotateOnX(xAng);
    }
    break;
  case 'j':
    
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(-xAng);
      obj.rotateOnY(-10);
      obj.rotateOnX(xAng);
    }
    break;
  case 'i':
    if (xAng <= 80) {
    xAng += 10;
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(10);
    }
    
    }
    break;
    
  case 'k':
    if (xAng >= -80){
    xAng -= 10;
    for (Obj obj : objs) {
      obj.setCenter(new PVector(0, 0, -1 * fromScreen));
      obj.rotateOnX(-10);
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
  /*
  case ' ':
    if (c.getLoc().y == 0) {
      dir.y = speed*2;
    }
    break;
  */
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
