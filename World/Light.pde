public class Light extends Obj{
  float intensity;
  public Light(PVector loc, float intensity) {
    super(loc);
    this.intensity = intensity;
  }
  public Light(ArrayList<Triangle> t, float intensity) {
    super(t);
    this.intensity = intensity;
  }
}
