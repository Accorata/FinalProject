Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
void setup() {
  size(400, 400);
  c = new Camera();
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(20,20,20));
  p.add(new PVector(220,20,20));
  p.add(new PVector(20,220,20));
  p.add(new PVector(220,220,20));
  objs.add(new Obj(p));
}
void draw() {
  c.resetScreen();
  for (Obj obj : objs) {
    c.addObject(obj);
  }
  c.display();
}
