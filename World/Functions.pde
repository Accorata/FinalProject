void rotateAxisOnX(PVector axis, float deg) {
  if (deg != 0) {
    float rad = radians(deg);
    PVector temp = new PVector(axis.z, axis.y);
    temp.rotate(rad);
    axis.y = temp.y;
    axis.z = temp.x;
  }
}

void rotateAxisOnY(PVector axis, float deg) {
  if (deg != 0) {
    rotateAxisOnX(axis, -xAng);
    float rad = radians(deg);
    PVector temp = new PVector(axis.x, axis.z);
    temp.rotate(rad);
    axis.x = temp.x;
    axis.z = temp.y;
    rotateAxisOnX(axis, xAng);
  }
}
PVector getTarget() {

  return zUnitInv.copy();
}
void rotateAxisOnZ(PVector axis, float deg) {
  if (deg != 0) {
    //rotateAxisOnX(axis, -xAng);
    float rad = radians(deg);
    PVector temp = new PVector(axis.x, axis.y);
    temp.rotate(rad);
    axis.x = temp.x;
    axis.y = temp.y;
    //rotateAxisOnX(axis, xAng);
  }
}

void recalcInverses() {
  PVector[] inv = inverse(xUnit, yUnit, zUnit);
  xUnitInv = inv[0];
  yUnitInv = inv[1];
  zUnitInv = inv[2];
}

void printMatrices() {
  println(xUnit);
  println(yUnit);
  println(zUnit);
  println(determinate(xUnit, yUnit, zUnit));
  println();
  println(xUnitInv);
  println(yUnitInv);
  println(zUnitInv);
  println(determinate(xUnitInv, yUnitInv, zUnitInv));
  println();
  println(e1.getPos());
  println();
}


float determinate(PVector one, PVector two, PVector three) {
  float ans = 0;
  ans += one.x * (two.y * three.z - two.z * three.y);
  ans -= two.x * (one.y * three.z - one.z * three.y);
  ans += three.x * (one.y * two.z - one.z * two.y);
  return ans;
}

PVector[] inverse(PVector one, PVector two, PVector three) {
  PVector[] ans = new PVector[3];
  for (int i = 0; i<3; i++) {
    ans[i] = new PVector(0, 0, 0);
  }
  ans[0].x = (two.y * three.z - three.y * two.z);
  ans[0].y = -(one.y * three.z - three.y * one.z);
  ans[0].z = (one.y * two.z - two.y * one.z);
  ans[1].x = -(two.x * three.z - three.x * two.z);
  ans[1].y = (one.x * three.z - three.x * one.z);
  ans[1].z = -(one.x * two.z - two.x * one.z);
  ans[2].x = (two.x * three.y - three.x * two.y);
  ans[2].y = -(one.x * three.y - three.x * one.y);
  ans[2].z = (one.x * two.y - two.x * one.y);
  return ans;
}

void print2D(Float[][] f) {
  String s = "";
  for (int i = 0; i < f.length; i++) {
    s += Arrays.toString(f[i]);
    s += "\n";
  }
  println(s);
}

void display(double[][] test) {
  for (int i = 0; i < test.length; i++) {
    for (int j = 0; j < test[i].length; j++) {
      if (test[i][j] != 0) point(j, i);
    }
  }
}

float dist(PVector a, PVector b) {
  //return a.sub(b).mag();
  return sqrt(sq(a.x - b.x) + sq(a.y - b.y) + sq(a.z - b.z));
}


boolean addGun(Gun g) {
  if (INVENTORY.size() < 3) {
    INVENTORY.add(g);
    return true;
  }
  return false;
}

Enemy inSight() {
  if (AIM != 0) {
    for (int i = 0; i < ENEMIES.size(); i++) {
      if (ENEMIES.get(i).getID() == AIM) return ENEMIES.get(i);
    }
  }
  return null;
}

boolean cover(PVector a, PVector b, PVector c) {
  float i1 = a.mag();
  float i2 = b.mag();
  float i3 = c.mag();
  float d1 = dist(a, b);
  float d2 = dist(b, c);
  float d3 = dist(c, a);
  //println(solveT(i1, i2, d1) + solveT(i1, i3, d3) + solveT(i3, i2, d2));
  return (aprox(2*PI, solveT(i1, i2, d1) + solveT(i1, i3, d3) + solveT(i3, i2, d2)));
}

double solveT(float a, float b, float op) {
  double theta = acos((sq(op)-sq(a)-sq(b))/(-2 * a * b));
  return theta;
}

boolean aprox(double a, double b) {
  double err = a * .01;
  return (b >= a - err && b <= a + err);
}

boolean aprox2(double a, double b, double view) {
  if (((a >= 6.28-view && a<= 6.28+view) || (a >= -view && a <= view)) && ((b >= 6.28-view && b<= 6.28+view) || (b >= -view && b <= view))) return true;
  return (b >= a - view && b <= a + view);
}

ArrayList<Triangle> copyOf(ArrayList<Triangle> ts) {
  ArrayList<Triangle> tsc = new ArrayList<Triangle>();
  for (Triangle t : ts) {
    tsc.add(t.copyOf());
  }
  return tsc;
}

void addEnemy (Enemy e) {
  c.addObject(e);
  ENEMIES.add(e);
}
