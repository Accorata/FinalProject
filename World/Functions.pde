void rotateXaxis(PVector axis, float deg) {
  if (deg != 0) {
    float rad = radians(deg);
    //PVector center = new PVector(0, 0, -1 * fromScreen);
    //axis.sub(center);
    PVector temp = new PVector(axis.x, axis.z);
    temp.rotate(rad);
    axis.x = temp.x;
    axis.z = temp.y;
    //axis.add(center);
  }
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
      if (ENEMIES.get(i).ID == AIM) return ENEMIES.get(i);
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
boolean aprox2(double a, double b) {
  double view = 2;
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
