class BouncyBall {
  PVector loc, vel;
  float sz;
  BouncyBall(float tempsz) {
    sz = tempsz;
    loc = new PVector(mouseX,mouseY,0);
    vel = new PVector(random(-5,5),random(-5,5),0);
  }
  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }
  void move() {
    loc.add(vel);
  }
  void wallBounce() {
    if (loc.x + sz/2 > width) {
      vel.x = -abs(vel.x);
    } 
    if (loc.x - sz/2 < 0) {
      vel.x = abs(vel.x);
    }
    if (loc.y + sz/2 > height) {
      vel.y = -abs(vel.y);
    }
    if (loc.y - sz/2 < 0) {
      vel.y = abs(vel.y);
    }
  }
  void collideWith(BouncyBall someOtherBall) {
    if (loc.dist(someOtherBall.loc) < sz/2 + someOtherBall.sz/2) {
      vel = PVector.sub(loc, someOtherBall.loc);
      vel.normalize();
    }
  }
}
