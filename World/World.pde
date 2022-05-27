final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 40;
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
final float speed = 5;
PVector dir = new PVector(0, 0, 0);
PVector mouse = new PVector(500, 300);
Triangle test;
void setup() {
  size(1000, 600);
  c = new Camera();
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(-100, -100, 100));
  p.add(new PVector(-100, 100, 100));
  p.add(new PVector(100, -100, 100));
  p.add(new PVector(100, 100, 100));
  //p.add(new PVector(-100, -100, -100));
  //p.add(new PVector(-100, 100, -100));
  //p.add(new PVector(100, -100, -100));
  //p.add(new PVector(100, 100, -100));
  objs.add(new Obj(p, new PVector(200, 200, 0)));
  ArrayList<PVector> t = new ArrayList<PVector>();
  t.add(new PVector(100, 100));
  t.add(new PVector(200, 100));
  t.add(new PVector(100, 200));
  test = new Triangle(t.get(0), t.get(1), t.get(2));
  ArrayList<PVector> coords = test.getCoords();
  stroke(0);
  for (PVector coord : coords) {
    point(coord.x, coord.y);
  }
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
  //objs.get(0).rotateOnX(10);
  //objs.get(0).rotateX(1);
  // --Screen--
  c.resetScreen();
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
