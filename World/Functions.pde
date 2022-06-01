String print2D(float[][] f) {
  String s = "";
  for (int i = 0; i < f.length; i++) {
    s += Arrays.toString(f[i]);
    s += "\n";
  }
  return s;
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
