//currently only the x position oscilates around the middle of the canvas. 
//adjust the sketch so the ellipse orbits around the mouse position 
//at a radial orbit size of 100.

float x, y; 
int theta; 
int orbitRadius; 

void setup(){
  size(600, 600); 
  orbitRadius = 100;
}

void draw(){
  background(0, 100, 200); 
  theta++;
  x = cos(radians(theta))*orbitRadius + mouseX; 
  y = sin(radians(theta))*orbitRadius + mouseY;
  ellipse(x, y, 25, 25); 
}
