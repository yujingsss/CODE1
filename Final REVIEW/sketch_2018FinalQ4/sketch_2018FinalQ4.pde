//this sketch currently draws a single ship that doesn't move.
//Fix the sketch to have an array of 40 ships that all move 
//across the canvas and get reset when they move across the edge of the screen.

Ship []myShip = new Ship[40];

void setup() {
  size(800, 600); 
  noStroke(); 
  for (int i = 0; i < 40; i++) {
    myShip[i] = new Ship(random(0, width), random(0, height), 
      color(random(0, 255), random(0, 255), random(0, 255), 40));
  }
}

void draw() {
  background(255); 
  for (int i = 0; i < 40; i++) {
    myShip[i].display(); 
    myShip[i].reset(); 
    myShip[i].move();
  }
}

class Ship {
  PVector pos; 
  PVector vel; 

  color c; 

  Ship(float _x, float _y, color _c) {
    pos = new PVector(_x, _y); 
    c = _c; 
    vel = new PVector(random(1, 3), 0);
  }

  void move() {
    pos.x+=vel.x;
  }

  void display() {
    fill(c); 
    ellipse(pos.x, pos.y, 20, 20); 
    ellipse(pos.x, pos.y + 20, 40, 20);
  }

  void reset() {
    if (pos.x >= width + 10) {
      pos.x = 0;
    }
  }
}
