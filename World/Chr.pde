public abstract class Chr extends Obj {
  String NAME;
  int HEALTH;
  public Chr(String name, ArrayList<Triangle> shape) {
    super(shape);
    this.NAME = name;
    this.HEALTH = 100;
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
  abstract void move(PVector mag);
  abstract void turn(PVector angs);
}
