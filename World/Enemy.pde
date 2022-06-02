public class Enemy extends Obj {
  String NAME;
  int HEALTH;
  ArrayList<Gun> inventory;
  PVector loc;
  double ID;
  float vAng;
  public Enemy(String name, PVector loc) {
    super();
    this.loc = loc;
    ArrayList<PVector> points = calcPoints(loc, new PVector(100, 170, 20));
    ArrayList<Triangle> shape = calcTriangles(points, color(102, 0, 0));
    super.setObj(points, shape);
    this.NAME = name;
    this.HEALTH = 100;
    this.inventory = new ArrayList<Gun>();
    super.setBreachable(true);
    ID = Math.random();
    for (Triangle t : this.getTriangles()) {
      t.ID = this.ID;
    }
    this.vAng = 0;
  }
  private ArrayList<PVector> calcPoints(PVector pos, PVector size) {
    ArrayList<PVector> p = new ArrayList<PVector>();
    p.add(pos);
    p.add(new PVector(pos.x, pos.y+size.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y+size.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y, pos.z));
    p.add(new PVector(pos.x+size.x, pos.y+size.y, pos.z+size.z));
    p.add(new PVector(pos.x+size.x, pos.y, pos.z+size.z));  
    p.add(new PVector(pos.x, pos.y+size.y, pos.z+size.z));
    p.add(new PVector(pos.x, pos.y, pos.z+size.z));
    return p;
  }
  private ArrayList<Triangle> calcTriangles(ArrayList<PVector> points, color c) {
    ArrayList<Triangle> t = new ArrayList<Triangle>();
    t.add(new Triangle(points.get(0), points.get(1), points.get(2), c));
    t.add(new Triangle(points.get(2), points.get(3), points.get(0), c));
    t.add(new Triangle(points.get(3), points.get(2), points.get(4), c));
    t.add(new Triangle(points.get(4), points.get(5), points.get(3), c));
    t.add(new Triangle(points.get(5), points.get(4), points.get(6), c));
    t.add(new Triangle(points.get(6), points.get(7), points.get(5), c));
    t.add(new Triangle(points.get(7), points.get(6), points.get(1), c));
    t.add(new Triangle(points.get(1), points.get(7), points.get(0), c));
    t.add(new Triangle(points.get(1), points.get(6), points.get(4), c));
    t.add(new Triangle(points.get(4), points.get(2), points.get(1), c));
    t.add(new Triangle(points.get(7), points.get(0), points.get(3), c));
    t.add(new Triangle(points.get(3), points.get(7), points.get(5), c));
    return t;
  }
  ArrayList<Triangle> renderShape() {
    ArrayList<Triangle> shape = new ArrayList<Triangle>();
    PVector p1 = new PVector(loc.x-50, loc.y-50, loc.z);
    PVector p2 = new PVector(loc.x+50, loc.y-50, loc.z);
    PVector p3 = new PVector(loc.x-50, loc.y+200, loc.z);
    PVector p4 = new PVector(loc.x+50, loc.y+200, loc.z);
    shape.add(new Triangle(p1, p2, p3));
    shape.add(new Triangle(p4, p2, p3));
    return shape;
  }
  int getHealth() {
    return HEALTH;
  }
  void changeHealth(int amount) {
    this.HEALTH += amount;
  }
  boolean isDead() {
    return (getHealth() <= 0);
  }
  ArrayList<Gun> getInventory() {
    return this.inventory;
  }
  boolean inSight() {
    ArrayList<Triangle> ts = copyOf(c.Triangles);
    ts.add(new Triangle(new PVector(0, -100, -fromScreen), new PVector(100, 75, -fromScreen), new PVector(-100, 75, -fromScreen)));
    ts.get(ts.size()-1).ID = 3;
    Obj ob = new Obj(ts);
    ob.setCenter(loc);
    ob.rotateOnY(vAng);
    ob.translate(new PVector(-loc.x, -loc.y, -loc.z - fromScreen));

    return see(ts);
  }

  boolean see (ArrayList<Triangle> Triangles) {
    boolean s = false;
    for (Triangle t : Triangles) {
      t.update_close();
    }
    Collections.sort(Triangles);
    for (Triangle t : Triangles) {
      if (!(t.points[0].z < 0 && t.points[1].z < 0 && t.points[2].z < 0)) {
        float[][] pT = new float[3][2];
        int count = 0;
        for (PVector point : t.points) {
          try {
            float scX = 0;
            float scY = 0;
            if (point.z <= -1 * fromScreen) {
              scX = (((fromScreen * point.x) / ((-1 * fromScreen + 1) + fromScreen)) + width/2);
              scY = (((fromScreen * point.y) / ((-1 * fromScreen + 1) + fromScreen)) + height/2);
            } else {      
              scX = (((fromScreen * point.x) / (point.z + fromScreen)) + width/2);
              scY = (((fromScreen * point.y) / (point.z + fromScreen)) + height/2);
            }
            pT[count][0] = scX;
            pT[count][1] = scY;
            count++;
          } 
          catch (Exception e) {
            break;
          }
        }
        if (cover(new PVector(pT[0][0]-width/2, pT[0][1]-height/2, 0), new PVector(pT[1][0]-width/2, pT[1][1]-height/2, 0), new PVector(pT[2][0]-width/2, pT[2][1]-height/2, 0))) {
          s = t.ID == 3;          
        }
      }
    }
    return s;
  }

boolean addGun(Gun g) {
  if (inventory.size() < 3) {
    inventory.add(g);
    return true;
  }
  return false;
}
String getName() {
  return this.NAME;
}
}
