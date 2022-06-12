public class Bullet extends Rect {
  private PVector target;

  int damage;
  public Bullet(PVector loc, PVector target, color c, int dam) {
    super(loc, new PVector(2, 2, 5), c);
    super.setBreachable(true);
    this.target = target;
    this.damage = dam;
    super.setID(1.5);
  }


  void mve() {
    PVector t = target.copy().setMag(50);
    PVector move = new PVector(0, 0, 0);

    if (t.x != 0) {
      move.add(xUnit.copy().mult(t.x));
    }
    if (t.y != 0) {
      move.add(yUnit.copy().mult(t.y));
    }
    if (t.z != 0) {
      move.add(zUnit.copy().mult(t.z));
    }
    super.translate(move);

    Obj o = super.breached();
    
    if (o != null) {
      println(o);
      if (o.getID() >= 0 && o.getID() < 1) {
        for (Enemy e : ENEMIES) {
          if (e.getID() == o.getID()) {
            e.changeHealth(-damage);
            if (e.isDead()) ENEMIES.remove(e);
          }
        }
      } else if (o.getID() == 1.5) {}
      removeObj(this);
    }

  }
}
