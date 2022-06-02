public class Enemy extends Obj {
  String NAME;
  int HEALTH;
  ArrayList<Gun> inventory;
  PVector loc;
  double ID;
  public Enemy(String name, PVector loc) {
    super();
    this.loc = loc;
    ArrayList<Triangle> shape = renderShape();
    super.setObj(shape);
    this.NAME = name;
    this.HEALTH = 100;
    this.inventory = new ArrayList<Gun>();
    
    super.setBreachable(true);
    ID = Math.random();
    for (Triangle t : this.getTriangles()) {
      t.ID = this.ID;
    }
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
