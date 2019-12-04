//this sketch has the ellipse change colors whenever the 
//mouse button is pressed. change the sketch so that 
//the ellipse only changes colors when the mouse is pressed inside the ellipse.
void setup() {
  size(600, 600);
}

void draw() {
  background(150);
  fill(150);
  float d = dist (mouseX, mouseY, width/2, height/2);
  if (d <= 200/2 && mousePressed) { 
    //println(d);
    fill(255);
  }
  ellipse(width/2, height/2, 200, 200);
}
