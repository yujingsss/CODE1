//Fix the code so that the square jumps whenever 
//the up arrow is pressed. Make sure the square cannot 
//jump multiple times while it is already jumping.

PVector position; 
PVector velocity; 
PVector gravity; 

int ground = 400; 
boolean jumping = false; 

void setup() {
  size(600, 600); 
  rectMode(CENTER); 

  //initialize values for your PVectors. HINT your y position should be the ground, 
  //initially the square is not moving, and gravity only accelerates in the y direction
  position=new PVector(width/2, ground);
  velocity=new PVector(0, 0);
  gravity=new PVector(0, .9);

  noStroke();
}

void draw() {
  background(28, 128, 255); 

  fill(28, 255, 170); 
  rect(width/2, ground+125, width, 200); 

  move();  


  fill(255); 
  rect(position.x, position.y, 50, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      //conditional statement, if the square is not already jumping => then jump
      if (jumping == false) {
        jump();
      }
    }
  }
}  

void move() {
  //update your position 
  if (jumping == true) {
    position.add(velocity);
    //apply gravity
    addGravity();
  }
}

void jump() {
  velocity.y = -15; 
  velocity.add(gravity); 
  jumping = true;
}

void addGravity() {
  if (position.y < ground) {
    velocity.add(gravity);
  } else {
    position.y = ground; 
    velocity.y = 0; 
    jumping = false;
  }
}
