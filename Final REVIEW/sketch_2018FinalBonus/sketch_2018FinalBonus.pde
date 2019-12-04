//Create a 1 player pong game complete with lives, score, 
//and multiple balls (hint will need to create a class)
//Create an image where pixels fall or break apart when mouse clicks them 
//a. Use .get to store pixel information in a 2D array (position & color)
//b. Create a 2D arrays to store if pixels have been 'activated' or not 
//(hint look at 2DArray_3 example from week 7

int life, score;
ArrayList <Ball> myBall = new ArrayList <Ball>();

void setup() {
  size(600, 600);
  rectMode(CENTER);
  noStroke();
}
void draw() {
  background(0);
  rect(mouseX, height-150, 150, 10);
  if (frameCount % 120 ==0) {
    myBall.add(new Ball());
  }
  for (int i=0; i<myBall.size(); i++) {
    Ball b = myBall.get(i);
    b.display();
    b.move();
    b.bounceWall();
    b.score();
    b.vanish();
  }
}

class Ball {
  float size;
  PVector vel, pos;
  PVector accel;
  Ball() {
    pos = new PVector(width/2, height/3);
    vel = new PVector(random(-1, 1), random(-1, 1));
    accel = new PVector(random(-.05, .05), .1);
    size = random(10, 50);
  }
  void display() {
    ellipse(pos.x, pos.y, size, size);
  }
  void move() {
    pos.x += vel.x;
    pos.y += vel.y;
    vel.x += accel.x;
    vel.y += accel.y;
  }
  void bounceWall() {
    if (pos.x <= size/2 || pos.x >= width-size/2) {
      vel.x = -vel.x;
    }
    if (pos.y <= size/2 || pos.y >= height-size/2) {
      vel.y = -vel.y;
    }
  }
  void score() {
    if (pos.y >= height-150-size/2 && pos.x >= mouseX-150/2 && pos.x <= mouseX+150/2 && pos.y >= height-150-10/2-size/2 && pos.y <= height-150+10/2-size/2) {
      score ++;
      vel.y = -vel.y;
      println(score, life);
    }
  }
  void vanish() {
    if (pos.x==0 || pos.y ==0) {
      myBall.remove(new Ball());
    }
  }
}
