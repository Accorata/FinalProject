public class Enemy extends Obj {
  String NAME;
  int HEALTH;
  ArrayList<Gun> inventory;
  PVector loc;
  public Enemy(String name, ArrayList<Triangle> shape, PVector loc) {
    super(shape);
    this.NAME = name;
    this.HEALTH = 100;
    this.inventory = new ArrayList<Gun>();
    this.loc = loc;
    
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
