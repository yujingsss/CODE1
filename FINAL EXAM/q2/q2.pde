//Adjust the sketch so that the background toggles 
//between white and black, and the circle is filled 
//black when the mouse is inside the circle and white when it is outside of the circle.

int xPos, yPos; 
int size = 100; 
boolean circleClicked = false; 
float d; 

void setup() {
  size(600, 600); 
  xPos = width/2; 
  yPos = height/2;
  noStroke();
}

void draw() {
  //calculate dist between the mouse and the center of the circle 
  d = dist(mouseX, mouseY, width/2, height/2);
  //if the mouse is inside the circle, fill the circle black 
  if (d < size/2) {
    fill(0);
  } else {
    fill(255);
  }
  //otherwise, fill the circle white
  if (circleClicked) {
    background(0);
  } else {
    background(255);
  }
  ellipse(xPos, yPos, size, size);
}

void mousePressed() {
  // toggle the boolean from true / false if the mouse is inside of the circle
  if (d < size/2) {
    circleClicked =! circleClicked;
    println(circleClicked);
  }
}
