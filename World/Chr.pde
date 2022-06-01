public abstract class Chr extends Obj {
  String NAME;
  int HEALTH;
  ArrayList<Gun> inventory;
  public Chr(String name, ArrayList<Triangle> shape) {
    super(shape);
    this.NAME = name;
    this.HEALTH = 100;
    this.inventory = new ArrayList<Gun>();
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
  abstract void move(PVector mag);
  abstract void turn(PVector angs);
}
