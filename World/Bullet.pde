public class Bullet extends Rect {
 private PVector target;
 public Bullet(PVector loc, PVector target, color c) {
   super(loc, new PVector(10, 10, 10), c);
   super.setBreachable(true);
   this.target = target;
   
 }
 void mve() {
   PVector t = target.copy().setMag(1);
   super.translate(t);
 }

}
