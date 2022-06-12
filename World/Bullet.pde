public class Bullet extends Rect {
 private PVector target;
 public Bullet(PVector loc, PVector target, color c) {
   super(loc, new PVector(10, 10, 10), c);
   super.setBreachable(true);
   this.target = target;
   
 }
 void mve() {
   PVector t = target.copy().setMag(1);
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
 }

}
