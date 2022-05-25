final PVector xaxis = new PVector(1, 0, 0);
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
void setup() {
  size(400, 400);
  c = new Camera();
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(120, 120, 20));
  p.add(new PVector(320, 120, 20));
  p.add(new PVector(120, 320, 20));
  p.add(new PVector(320, 320, 20));
  p.add(new PVector(120, 120, 220));
  p.add(new PVector(320, 120, 220));
  p.add(new PVector(120, 320, 220));
  p.add(new PVector(320, 320, 220));
  objs.add(new Obj(p));
  //objs.get(0).rotateX(30);
  //objs.get(0).rotateX(-30);
  objs.get(0).rotateOnX(0);
  //objs.get(0).rotateOnX(-30);
}
void draw() {

  //objs.get(0).rotateOnX(10);
  //objs.get(0).rotateX(1);
  // --Screen--
  c.resetScreen();
  for (Obj obj : objs) {
    c.addObject(obj);
  }
  c.display();
}
