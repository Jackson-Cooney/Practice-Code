GravityBall[] bouncer = new GravityBall[400];
void setup(){
  size(1100,800);
  colorMode(HSB,360,100,100,100);
  for(int i = 0; i < bouncer.length; i++){
    bouncer[i] = new GravityBall();
  }
}
void draw(){
  background(0);
  for(int i = 0; i < bouncer.length; i++){
    bouncer[i].display();
    bouncer[i].move();
    bouncer[i].bounce();
  }
}
class GravityBall{
  PVector loc,vel,acc;
  float sz;
  float hue,sat,bright,alpha;
  GravityBall(){
    sz = 20;
    loc = new PVector(random(width),random(height),0);
    vel = new PVector(0,2,0);
    acc = new PVector(0,.07,0);
    hue = random(360);
    sat = 100;
    bright = 100;
    alpha = 80;
  }
  GravityBall(float tempx,float tempsz){
    sz = tempsz;
    loc = new PVector(tempx,sz);
    vel = new PVector(0,0);
    acc = new PVector(0,.1);
    hue = random(360);
    sat = 100;
    bright = 100;
    alpha = 80;
  }
  void display(){
    fill(hue,sat,bright,alpha);
    ellipse(loc.x,loc.y,sz,sz);
  }
  void move(){
    loc.add(vel);
    vel.add(acc);
  }
  void bounce(){
    if(loc.y > height - sz/2){
      loc.y = height - sz/2;
      vel.y = -abs(vel.y);
    }
  }
}
