ArrayList<BouncyBall> balls = new ArrayList<BouncyBall>();
int maxBalls = 50;
void setup() {
  size(1100, 800);
  background(0);
}
void draw() {
  background(0);
  fill(0,255,0);
  for (int i = 0; i < balls.size (); i++) {
    BouncyBall b = balls.get(i);
    b.display();
    b.move();
    b.wallBounce();
  }
}
void mousePressed() {
  balls.add(new BouncyBall(random(5, 80)));
}
