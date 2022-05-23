Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
void setup() {
  size(400, 400);
  c = new Camera();
}
void draw() {
  c.resetScreen();
  for (Obj obj : objs) {
    c.addObject(obj);
  }
  c.display();
}
