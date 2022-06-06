public class Enemy extends Obj {
  private String NAME;
  private int HEALTH;
  private ArrayList<Gun> inventory;
  private PVector loc;
  private double ID;
  private float vAng;
  private PVector xDir = new PVector(1,0,0);
  private PVector zDir = new PVector(0,0,1);
  public int curGun;
  
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
    this.mve = 0;
    this.vAng = 0;
    curGun = 0;
    inventory.add(new Gun("Pistol", 20, 7, 12));
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
    PVector loc = getCenter();
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
    float ang = 0;
    super.setCenter();
    //println(getCenter());
    if (getCenter().x < 0) ang = (PI/2)-atan((-fromScreen-getCenter().z )/-getCenter().x);
    if (getCenter().x > 0) ang = (-PI/2) -atan((-fromScreen-getCenter().z )/-getCenter().x);
    //println((ang%TWO_PI)+(radians(eAng)%TWO_PI));
    if (aprox2(vAng, (ang% TWO_PI)+(radians(eAng)%TWO_PI))) {
      return checkBetween(dist(new PVector(0, 0, -fromScreen), getCenter()));
    }
    return false;
  }
  boolean checkBetween(float d) {
    for (Triangle t : c.Triangles) {
      t.update_close(loc);
    }
    Collections.sort(c.Triangles, Collections.reverseOrder());
    for (Triangle t : c.Triangles) {
      if (t.close > d) break;
      PVector t1 = t.points[0];
      PVector t2 = t.points[1];
      PVector t3 = t.points[2];
      /*
      PVector v1 = new PVector(t1.x - t2.x, t1.y -t2.y, t1.z - t2.z);
       PVector v2 = new PVector(t2.x - t3.x, t2.y -t3.y, t2.z - t3.z);
       PVector crV = v1.cross(v2);
       float n = (crV.x * (-1 * t2.x)) + (crV.y * (-1 * t2.y)) + (crV.z * (-fromScreen - t2.z));
       */
      boolean wx = (t1.x >= 0 || t2.x >= 0 || t3.x >= 0) && (t1.x <= 0 || t2.x <= 0 || t3.x <= 0);
      boolean wy = (t1.y >= 0 || t2.y >= 0 || t3.y >= 0) && (t1.y <= 0 || t2.y <= 0 || t3.y <= 0);
      boolean wz = (t1.z >= -fromScreen || t2.z >= -fromScreen || t3.z >= -fromScreen) && (t1.z <= -fromScreen || t2.z <= -fromScreen || t3.z <= -fromScreen);

      boolean within = wx && wy && wz;
      if (within) return false;
    }
    return true;
  }
  void moveX() {
    loc.add(xDir);
    for (PVector p : getPoints()) {
      p.add(xDir);
    }
  }
  void move(PVector dir) {
    //PVector temp = new PVector(point.x, point.z);
    //  temp.rotate(eAng);
    //point.x = temp.x;
    //point.z = temp.y;
    //point.add(center);
    println(eAng);
    PVector cent = new PVector(0, -1 * fromScreen);
    for (PVector p : getPoints()) {
      PVector temp = new PVector(p.x, p.z);
      //temp.sub(cent);
      //temp.rotate(-radians(eAng));
      temp.add(new PVector(dir.x, 0));
      //temp.rotate(radians(eAng));
      //temp.add(cent);
      p.set(temp.x, p.y, temp.z);
    }
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

  void rotate(float deg) {
    super.setCenter(new PVector(0, 0, -fromScreen));
    super.rotateOnY(-eAng);
    super.rotateOnX(-xAng);
    super.setCenter();
    super.rotateOnY(deg);
    super.setCenter(new PVector(0, 0, -fromScreen));
    super.rotateOnX(xAng);
    super.rotateOnY(eAng);
  }
  int mve;
  void move() {
    if (mve == 0) {
      float nv = (float) (Math.random() * PI) + PI;
      mve = (int) (Math.random() * 20 + 10);
      //rotateOnY(nv);
      //vAng = (nv + vAng)%TWO_PI;

      rotateOnY(40);
      //vAng += radians(40);
      println(mve);
      println(nv);
    } else {
      super.translate(new PVector(acos(vAng), 0, asin(vAng))); 
      mve--;
    }
  }
}
