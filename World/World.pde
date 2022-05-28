import java.util.Collections;
final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 40;
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();

final float speed = 5;
PVector pos = new PVector(0, 0, 0);
PVector dir = new PVector(0, 0, 0);
PVector mouse = new PVector(500, 300);
Triangle test;
void setup() {
  size(1000, 600);
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
  PVector p = new PVector (-100,-100,-100);
  PVector l = new PVector (200,200,200);
  objs.add(new Rect(p, l));

  //objs.get(0).rotateX(30);
  objs.get(0).translate(new PVector(0, 0, 200));


  objs.get(0).rotateOnZ(45);
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
}

void draw() {
  //for (Obj obj : objs) {
  //  obj.setCenter(new PVector(0, 0, -1 * fromScreen));
  //  obj.rotateOnY(mouseX-mouse.x);
  //}
  //for (Obj obj : objs) {
  //  obj.setCenter(new PVector(0, 0, -1 * fromScreen));
  //  obj.rotateOnX(mouse.y-mouseY);
  //}
  mouse.x = mouseX;
  mouse.y = mouseY;
  // --Screen--
  //c.resetScreen();
  background(255);
  pos.add(dir);
  dir.y -= speed/20;
  if (pos.y <= 0){
    for (Obj obj : objs) {
      obj.translate(new PVector(0,-pos.y,0));
    }
    pos.y = 0;
    dir.y = 0;
  }
  for (Obj obj : objs) {
    obj.translate(dir);
    c.addObject(obj);
  }
  //c.display();
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
  if (pos.y == 0) {
    dir.y = speed*2;
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
