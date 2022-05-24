Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
void setup() {
  size(400, 400);
  c = new Camera();
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(120,120,20));
  p.add(new PVector(320,120,20));
  p.add(new PVector(120,320,20));
  p.add(new PVector(320,320,20));
  p.add(new PVector(120,120,220));
  p.add(new PVector(320,120,220));
  p.add(new PVector(120,320,220));
  p.add(new PVector(320,320,220));
  objs.add(new Obj(p));
  objs.get(0).rotateX(0.00001);
  //objs.get(0).rotateX(-30);
}
void draw() {
  c.resetScreen();
  for (Obj obj : objs) {
    c.addObject(obj);
  }
  c.display();
}
