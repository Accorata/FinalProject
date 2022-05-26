final PVector xaxis = new PVector(1, 0, 0);
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();
void setup() {
  size(400, 400);
  c = new Camera();
  ArrayList<PVector> p = new ArrayList<PVector>();
<<<<<<< HEAD
<<<<<<< HEAD
  p.add(new PVector(100, 100, 100));
  p.add(new PVector(-100, 100, 100));
  p.add(new PVector(-100, -100, 100));
  p.add(new PVector(100, 100, 100));
  objs.add(new Obj(p, new PVector(200,200,0)));
  //objs.get(0).rotateX(30);
  //objs.get(0).rotateX(-30);
  //objs.get(0).rotateOnX(0);
=======
=======

>>>>>>> Raymond
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
  //objs.get(0).rotateX(-30);
  objs.get(0).rotateOnZ(45);
<<<<<<< HEAD
>>>>>>> Raymond
=======

>>>>>>> Raymond
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
