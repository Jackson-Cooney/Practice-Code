BouncyBall[] balls = new BouncyBall[250];
BlackHole z;
void setup() {
  size(1100, 800);
  colorMode(HSB, 360, 100, 100, 100);
  z = new BlackHole();
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new BouncyBall(random(5, 40), random(1, 10));
  }
}
void draw() {
  background(0, 0, 100);
  for (int i = 0; i < balls.length; i++) {
    z.consumes(balls[i]);
    balls[i].display();
    balls[i].isSuckedIn(z);
    balls[i].move();
    balls[i].wallBounce();
  }
  z.display();
}
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
