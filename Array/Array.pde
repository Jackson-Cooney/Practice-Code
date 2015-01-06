//initialize the arraylist
ArrayList<Particle> Balls = new ArrayList<Particle>();
PImage picture,hose;
void setup() {
  //set color mode to HSB
  colorMode(HSB,360,100,100,100);
  //remove remove stroke surrounding the particles
  noStroke();
  //create the size of the screen
  size(1200, 800);
  //load background and hose images
  picture = loadImage("Yard.jpg");
  hose = loadImage("Nozzle.png");
}
void draw() {
  //when the mouse is pressed make particles appear in the location of the mouse
  if(mousePressed){
   Balls.add(new Particle()); 
  }
  //make background so previous particles don't appear
  image(picture,0,0,1200,800);
  //make hose follow mouse
  image(hose,mouseX-150,mouseY-50);
  //make particles carry out functions
  for (int i = 0; i < Balls.size(); i++) {
    Particle current = Balls.get(i);
    current.display();
    current.move();
  }
}
//create class
class Particle {
  //initialize variables
  PVector loc, vel, acc;
  float sz,life;
  Particle() {
    //give variables values
    loc = new PVector(mouseX,mouseY,0);
    vel = new PVector(random(-3,3),random(-3,3),0);
    acc = new PVector(random(-1,1),random(-1,1),0);
    sz = random(10,50);
    life = 80;
  }
  //create function for the particles to appear on screen
  void display() {
    //make particles become more and more transparent
    life -= 1;
    //make particles decrease in size
    if(sz > .1){
      sz -= .4;
    }
    //make particles blue
    fill(200, 100, 100, life);
    //draw particle
    ellipse(loc.x, loc.y, sz, sz);
  }
  //create function for the particles to move around the screen
  void move() {
    acc.set(random(-1,1), random(-1,1),0);
    loc.add(vel);
    vel.limit(5);
    vel.add(acc);
    if(loc.y > height - sz/2 || loc.y < sz/2){
      vel.y *= -1;
      acc.y *= -1;
    }
    if(loc.x > width - sz/2 || loc.x < sz/2){
      vel.x *= -1;
      acc.x *= -1;
    }
  }
}
