float x,y;
int sz;
float velX,velY;
float accX,accY;
void setup(){
  size(1100,800);
  x=0;
  y=0;
  sz=50;
  velX=1.5;
  velY=2;
  accX=.5;
  accY=.5;
}
void draw(){
  background(0);
  velX += accX;
  velY += accY;
  x += velX;
  y += velY;
  ellipse(x,y,sz,sz);
  if(y>height-sz/2){
    y = height - (sz/2);
    velY *= -.95;
    velX *= .99;
  }
  if(x>width-sz/2){
    x = width - (sz/2);
    velX *= -.95;
    accX *= .95;
  }
  if(x<0+(sz/2)){
    x = 0 + (sz/2);
    velX *= -.95;
    accX *= .95;
  }
}
