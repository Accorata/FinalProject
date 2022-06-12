//final float constrict = 1;

public class Enemy extends Sphere {
  private String NAME;
  private int HEALTH;
  private ArrayList<Gun> inventory;
  private PVector loc;
  private float vAng;
  public int curGun;
  private PVector dir;
  private double wanderTimer;
  private ArrayList<Leg> legs;
  private int movementStage = 0;
  private int movementTimer = 16;
  private int attackTimer = 0;
  private float targetYRot = 0;

  public Enemy(String name_, PVector loc_) {
    this(name_, loc_, new PVector(0, 0, 0));
  }
  public Enemy(String name_, PVector loc_, PVector dir_) {
    super();
    this.loc = loc_;
    ArrayList<PVector> points = super.calcPoints(loc, 100, 50, 20, 20);
    ArrayList<Triangle> shape = super.calcTriangles(points, 20, 20, color(92, 0, 0));
    shape.get(177).updateColor(color(145, 255, 255));
    shape.get(176).updateColor(color(145, 255, 255));
    legs = addLegs(loc, points, shape, color(72, 0, 0));
    super.setObj(points, shape, points.get(0), points.get(points.size()-21));
    this.NAME = name_;
    this.HEALTH = 100;
    this.inventory = new ArrayList<Gun>();
    super.setBreachable(true);
    double ID = Math.random();
    for (Triangle t : this.getTriangles()) {
      t.ID = ID;
    }
    super.setID(ID);
    this.vAng = 0;
    super.rotate(new PVector(0, 45, 0));
    this.curGun = 0;
    inventory.add(new Gun("Pistol", 20, 7, 12));
    this.dir = dir_;
    this.wanderTimer = Math.random()*120;
  }

  PVector getTarget() {
    //float theta = random(-10,10);
    //PVector error = new PVector(2*cos(radians(theta)), 0, 2*sin(radians(theta)));
    return dir.copy();//.add(error);
  }
  PVector rand() {
    return new PVector((float)Math.random() * len -len/2, 0, (float)Math.random() * wid - wid/2);
  }
  private ArrayList<Leg> addLegs (PVector loc, ArrayList<PVector> points, ArrayList<Triangle> shape, color clr) {
    ArrayList<Leg> legs = new ArrayList<Leg>();
    loc.y += 50;
    float radius = 50*sin(radians(30));
    for (int theta = 0; theta<360; theta+=90) {
      float xDisplace = radius*cos(radians(theta));
      float zDisplace = radius*sin(radians(theta));
      points.add(new PVector(loc.x + xDisplace, loc.y, loc.z + zDisplace));
      xDisplace += 33*cos(radians(theta));
      zDisplace += 33*sin(radians(theta));
      PVector one = new PVector(loc.x + xDisplace + zDisplace/6, loc.y, loc.z + zDisplace + xDisplace/6);
      points.add(one);
      PVector two = new PVector(loc.x + xDisplace - zDisplace/6, loc.y, loc.z + zDisplace - xDisplace/6);
      points.add(two);
      PVector three = new PVector(loc.x + xDisplace*0.9, loc.y + 20, loc.z + zDisplace*0.9);
      points.add(three);
      shape.add(new Triangle(points.get(points.size()-1), points.get(points.size()-3), points.get(points.size()-4), clr));
      shape.add(new Triangle(points.get(points.size()-1), points.get(points.size()-2), points.get(points.size()-4), clr));
      shape.add(new Triangle(points.get(points.size()-2), points.get(points.size()-3), points.get(points.size()-4), clr));
      PVector four = new PVector(loc.x + xDisplace*1.2, loc.y + 60, loc.z + zDisplace*1.2);
      points.add(four);
      legs.add(new Leg(one, two, three, four));
      shape.add(new Triangle(points.get(points.size()-1), points.get(points.size()-2), points.get(points.size()-3), clr));
      shape.add(new Triangle(points.get(points.size()-1), points.get(points.size()-2), points.get(points.size()-4), clr));
      shape.add(new Triangle(points.get(points.size()-1), points.get(points.size()-3), points.get(points.size()-4), color(62, 0, 0)));
    }
    loc.y -= 50;
    legs.get(1).move(new PVector(0, -15, 0));
    legs.get(3).move(new PVector(0, -15, 0));
    //legs.get(1).moveToCenter(loc, 15*constrict);
    //legs.get(3).moveToCenter(loc, 15*constrict);
    return legs;
  }
  void animate() {
    if (inSight()) {
      moveTowards(place);
      if (attackTimer >= 15) {
        inventory.get(curGun).shoot(this);
        attackTimer = 0;
      }
    } 
    attackTimer+=speedAdjust;
    wander();
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
    if (getCenter().x < 0) ang = (PI/2)-atan((-fromScreen-getCenter().z )/-getCenter().x);
    if (getCenter().x > 0) ang = (-PI/2) -atan((-fromScreen-getCenter().z )/-getCenter().x);
    if (eAng <= 0) {
      eAng += 360;
    }
    if (aprox2(radians(vAng), (ang% TWO_PI)+(radians(eAng)%TWO_PI), 2)) {
      return checkBetween(place, getCenter()) == null;
    }
    return false;
  }
  boolean blockInSight() {
    Obj hit = super.breached();
    return hit != null;
  }
  Triangle checkBetween(PVector one, PVector two) {
    float d = dist(one, two);
    for (Triangle t : c.Triangles) {
      t.update_close(loc);
    }
    Collections.sort(c.Triangles, Collections.reverseOrder());
    for (Triangle t : c.Triangles) {
      if (t.close > d) break;
      PVector t1 = t.points[0];
      PVector t2 = t.points[1];
      PVector t3 = t.points[2];
      boolean wx = (t1.x >= one.x || t2.x >= one.x || t3.x >= one.x) && 
        (t1.x <= one.x || t2.x <= one.x || t3.x <= one.x);
      boolean wy = (t1.y >= one.y || t2.y >= one.y || t3.y >= one.y) && 
        (t1.y <= one.y || t2.y <= one.y || t3.y <= one.y);
      boolean wz = (t1.z >= one.z || t2.z >= one.z || t3.z >= one.z) && 
        (t1.z <= one.z || t2.z <= one.z || t3.z <= one.z);
      boolean within = wx && wy && wz;
      if (within) return t;
    }
    return null;
  }
  void moveTowards(PVector t) {
    PVector target = new PVector(0, 0, 0);
    if (t.x != 0) {
      target.add(xUnitInv.mult(t.x));
      xUnitInv.div(t.x);
    }
    if (t.y != 0) {
      target.add(yUnitInv.mult(t.y));
      yUnitInv.div(t.y);
    }
    if (t.z != 0) {
      target.add(zUnitInv.mult(t.z));
      zUnitInv.div(t.z);
    }
    PVector pos = getPos();
    float theta = 0;
    if (pos.x < target.x) {
      theta = degrees(atan((target.z-pos.z)/(target.x-pos.x)));
    } else { 
      theta = 180 + degrees(atan((target.z-pos.z)/(target.x-pos.x)));
    }
    if (theta < 0) {
      theta += 360;
    }
    targetYRot = theta;
    move();
  }
  void wander() {
    wanderTimer += Math.random()*speedAdjust;
    if (wanderTimer >= 360) {
      wanderTimer = 0;
      targetYRot = random(360);
    }
    move();
  }
  void setDir(float theta) {
    targetYRot = theta;
  }
  void move() {
    dir.set(2, 0, 0);
    if (vAng != targetYRot) {
      float theta = -(vAng - targetYRot)/abs(vAng - targetYRot);
      if (targetYRot - vAng > 180) {
        theta *= -1;
      }
      if (abs(vAng - targetYRot) <= speedAdjust) {
        theta = 0;
      }
      rotate(theta);
      if (vAng < 0) {
        vAng += 360;
      }
    }
    float speed = 2*2;//speedAdjust;
    dir.mult(speedAdjust);
    //PVector center = super.getCenter();
    if (movementStage == 0) {
      legs.get(0).move(yUnit.copy().mult(-speed));
      legs.get(2).move(yUnit.copy().mult(-speed));
      //legs.get(0).moveToCenter(center, constrict*speed);
      //legs.get(2).moveToCenter(center, constrict*speed);
      legs.get(1).move(yUnit.copy().mult(speed));
      legs.get(3).move(yUnit.copy().mult(speed));
      //legs.get(1).moveFromCenter(center, constrict*speed);
      //legs.get(3).moveFromCenter(center, constrict*speed);
    } else if (movementStage == 2) {
      legs.get(0).move(yUnit.copy().mult(speed));
      legs.get(2).move(yUnit.copy().mult(speed));
      //legs.get(0).moveFromCenter(center, constrict*speed);
      //legs.get(2).moveFromCenter(center, constrict*speed);
      legs.get(1).move(yUnit.copy().mult(-speed));
      legs.get(3).move(yUnit.copy().mult(-speed));
      //legs.get(1).moveToCenter(center, constrict*speed);
      //legs.get(3).moveToCenter(center, constrict*speed);
    }
    if (movementTimer >= 30) {
      movementStage++;
      if (movementStage >= 4) {
        movementStage = 0;
      }
      if (movementStage % 2 == 0) {
        movementTimer = 0;
      } else {
        movementTimer = 12;
      }
    }
    movementTimer+=1*speed;
    PVector move = new PVector(0, 0, 0);
    if (dir.x != 0) {
      move.add(xUnit.mult(dir.x));
      xUnit.div(dir.x);
    }
    if (dir.y != 0) {
      move.add(yUnit.mult(dir.y));
      yUnit.div(dir.y);
    }
    if (dir.z != 0) {
      move.add(zUnit.mult(dir.z));
      zUnit.div(dir.z);
    }
    for (PVector p : getPoints()) {
      p.add(move);
    }
    super.setCenter();
    if (blockInSight()) {
      wanderTimer = 0;
      targetYRot = random(360);
      for (PVector p : getPoints()) {
        p.sub(move);
      }
      //println("sdfghjkljhgfdsdfghjkljhgfd");
      //dir.set(0, 0, 0);
    } else {
      loc.add(move);
    }
    move.div(speedAdjust);
    if (movementStage == 0 || movementStage == 3) {
      legs.get(1).move(move.copy().mult(speed));
      legs.get(3).move(move.copy().mult(speed));
      legs.get(0).move(move.copy().mult(-speed));
      legs.get(2).move(move.copy().mult(-speed));
    } else {
      legs.get(0).move(move.copy().mult(speed));
      legs.get(2).move(move.copy().mult(speed));
      legs.get(1).move(move.copy().mult(-speed));
      legs.get(3).move(move.copy().mult(-speed));
    } 
    dir.div(speedAdjust);
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
  @Override
    void rotate(PVector deg) {
    super.rotate(deg);
    vAng += deg.y;
    dir.set(2*cos(radians(vAng)), 0, 2*sin(radians(vAng)));
  }

  void rotate(float deg) {
    rotate(new PVector(0, deg, 0));
  }
}
