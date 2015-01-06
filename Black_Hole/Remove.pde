class BlackHole {
  PVector loc;
  float sz;
  BlackHole() {
    loc = new PVector(random(width), random(height));
    sz = 5;
  }
  void display() {
    fill(0);
    ellipse(loc.x, loc.y, sz, sz);
  }
  void consumes(BouncyBall b) {
    if (loc.dist(b.loc) < sz/2 + b.sz/2) {
      b.teleport();
      sz+=b.sz/100;
    }
  }
}
