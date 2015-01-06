class BouncyBall {
  PVector loc, vel, acc;
  float sz;
  float speed;
  float hue;
  BouncyBall(float tempsz, float tempspeed) {
    sz = tempsz;
    speed = tempspeed;
    loc = new PVector(random(sz, width-sz), random(sz, height-sz),0);
    vel = new PVector(random(-10,10),random(-10,10),0);
    acc = new PVector();
    vel.normalize();
    vel.mult(speed);
    hue = random(360);
  }
  void display() {
    fill(hue, 100, 100, 100);
    ellipse(loc.x, loc.y, sz, sz);
  }
  void move() {
    vel.add(acc);
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
  void collideWith(BouncyBall other) {
    if (loc.dist(other.loc) < sz/2 + other.sz/2) {
      vel = PVector.sub(loc, other.loc);
      vel.normalize();
      vel.mult(speed);
    }
  }
  void goAway() {
    loc.set(width*10, height*10, 0);
    vel.set(0, 0, 0);
  }
  void teleport() {
    loc.set(mouseX, mouseY, 0);
    vel = new PVector(random(-10,10),random(-10,10),0);
  }
  void isSuckedIn(BlackHole doom) {
    acc = PVector.sub(doom.loc, loc);
    acc.normalize();
    acc.mult(.1);
  }
}
