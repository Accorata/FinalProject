Camera c;
ArrayList<Mesh> objs = new ArrayList<Mesh>();
void setup() {
  size(400, 400);
  c = new Camera();
}
void draw() {
  c.resetScreen();
  for (Mesh obj : objs) {
    c.addObject(obj);
  }
  c.display();
}
