final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 40;
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
void setup() {
  size(1000, 600);
  c = new Camera();
  ArrayList<PVector> p = new ArrayList<PVector>();

  p.add(new PVector(-100, 100, 100));
  p.add(new PVector(-100, -100, 100));
  p.add(new PVector(-100, -100, -100));
  p.add(new PVector(100, 100, 100));
  p.add(new PVector(100, -100, 100));
  p.add(new PVector(100, -100, -100));
  p.add(new PVector(100, 100, -100));
  p.add(new PVector(-100, 100, -100));
  objs.add(new Obj(p));
  //objs.get(0).rotateX(30);
   objs.get(0).rotateOnX(45);
  objs.get(0).translate(new PVector(0, 0, 200));
  objs.get(0).translate(new PVector(0, 200, 0));
  
  //for (PVector v : objs.get(0).getPoints()) {
    //intln(v);
  //  //objs.get(0).rotateOnZ(45);

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
