//create a PVector for velocity and acceleration. 
//make the ellipse fall until it reaches the bottom of the canvas, 
//then reset it's position back to the top of the screen. 
//make sure your ellipse doesn't continuously accelerate once it's reset.

PVector pos, vel, accel; 

void setup() {
  size(600, 600); 

  pos = new PVector(width/2, 25); 
  vel = new PVector(25/2, 3);
  accel = new PVector(0, .1);
  smooth();
}

void draw() {
  background(0); 

  ellipse(pos.x, pos.y, 25, 25); 
  pos.y += vel.y;
  vel.y += accel.y;

  if (pos.y >= height) {
    pos.y = -25/2; 
    vel.y = 0;
  }
}
