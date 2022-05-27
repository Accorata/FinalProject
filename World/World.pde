final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 40;
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
PVector mouse = new PVector(500, 300);
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
  c.resetScreen();
  for (Obj obj : objs) {
    c.addObject(obj);
  }
  c.display();
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
    for (Obj obj : objs) {
      obj.translate(new PVector(0, 0, -10));
    }
    break;
  case 's':
    for (Obj obj : objs) {
      obj.translate(new PVector(0, 0, 10));
    }
    break;
  case 'a':
    for (Obj obj : objs) {
      obj.translate(new PVector(10, 0, 0));
    }
    break;
  case 'd':
    for (Obj obj : objs) {
      obj.translate(new PVector(-10, 0, 0));
    }
    break;
  }
}
