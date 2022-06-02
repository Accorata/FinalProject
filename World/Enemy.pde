public class Enemy extends Obj {
  String NAME;
  int HEALTH;
  ArrayList<Gun> inventory;
  PVector loc;
  double ID;
  public Enemy(String name, PVector loc) {
    super();
    this.loc = loc;
    ArrayList<PVector> points = calcPoints(loc, new PVector(100, 170, 20));
    ArrayList<Triangle> shape = calcTriangles(points, color(0));
    super.setObj(points, shape);
    this.NAME = name;
    this.HEALTH = 100;
    this.inventory = new ArrayList<Gun>();
    super.setBreachable(true);
    ID = Math.random();
    for (Triangle t : this.getTriangles()) {
      t.ID = this.ID;
    }
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
    return true;
  }
  boolean addGun(Gun g) {
    if (inventory.size() < 3) {
      inventory.add(g);
      return true;
    }
    return false;
  }
}
