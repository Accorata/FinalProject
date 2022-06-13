public class Bullet extends Rect {
  private PVector target;
  private boolean enemy;

  int damage;
  public Bullet(PVector loc, PVector target, color c, int dam, boolean enemy_) {
    super(loc, new PVector(2, 2, 5), c);
    super.setBreachable(true);
    this.target = target;
    this.damage = dam;
    this.enemy = enemy_;
    super.setID(1.5);
  }



  boolean mve() {

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

    boolean hitNothing = false;
    if (o != null && o.getID() != 1.5 && (enemy || o.getID() != 5)) {

      if (o.getID() >= 0 && o.getID() < 1) {
        for (Enemy e : ENEMIES) {
          if (e.getID() == o.getID()) {
            if (!enemy) {
              e.changeHealth(-damage);
              if (e.isDead()) {
                ENEMIES.remove(e);
                c.removeObj(e);
                break;
              }
            } else {
              hitNothing = true;
            }
          }
        }

      } else if (o.getID() == 1.5) {}
      objs.remove(this);
      bullets.remove(this);
      return true;
    } else {println("no");}
return false;

  }
}
