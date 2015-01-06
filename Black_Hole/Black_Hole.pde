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

