
import java.util.Collections;
final PVector xaxis = new PVector(1, 0, 0);
final float fromScreen = 300;
Camera c;
ArrayList<Obj> objs = new ArrayList<Obj>();

void setup() {
  size(1000, 600);
  c = new Camera();
  PVector v1 = new PVector(100, 100, 100);
  PVector v2 = new PVector(100, 100, -100);
  PVector v3 = new PVector(100, -100, -100);
  PVector v4 = new PVector(100, -100, 100);
  PVector v5 = new PVector(-100, 100, 100);
  PVector v6 = new PVector(-100, -100, -100);
  PVector v7 = new PVector(-100, 100, -100);
  PVector v8 = new PVector(-100, -100, 100);
  ArrayList<Triangle> t = new ArrayList<Triangle>();
  t.add(new Triangle(v6, v7, v2, color(255, 153, 153)));
  t.add(new Triangle(v2, v3, v6, color(255, 153, 153)));
  t.add(new Triangle(v3, v2, v1, color(102, 255, 178)));
  t.add(new Triangle(v1, v4, v3, color(102, 255, 178)));
  t.add(new Triangle(v4, v1, v5, color(255, 204, 229)));
  t.add(new Triangle(v5, v8, v4, color(255, 204, 229)));
  t.add(new Triangle(v8, v5, v7, color(204, 229, 255)));
  t.add(new Triangle(v7, v8, v6, color(204, 229, 255)));
  t.add(new Triangle(v7, v5, v1, color(255, 229, 204)));
  t.add(new Triangle(v1, v2, v7, color(255, 229, 204)));
  t.add(new Triangle(v8, v6, v3, color(204, 229, 255)));
  t.add(new Triangle(v3, v8, v4, color(204, 229, 255)));
                                                                                                                                               
  objs.add(new Obj(t));

  //objs.get(0).rotateX(30);
  objs.get(0).translate(new PVector(0, 0, 200));


  //objs.get(0).rotateOnZ(45);
}
float dist(PVector a, PVector b) {
    return sqrt(sq(a.x - b.x) + sq(a.y - b.y) + sq(a.z - b.z));
  }
void draw() {
  
  //objs.get(0).rotateOnX(10);
  //objs.get(0).rotateX(1);
  // --Screen--

  //c.resetScreen();
  background(255);
  for (Obj obj : objs) {
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
  
  case 'p':
    for (Obj obj : objs) {
      println("------------");
      for (PVector p : obj.getPoints()) {
        println(p);
      }
    }
    break;
  }
}
