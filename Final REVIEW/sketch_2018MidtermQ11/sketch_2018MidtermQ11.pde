//this sketch currently draws an ellipse at the middle of the screen. 
//the draw loop increments the variable used to store the y position 
//of the ellipse, but the position doesn't change. 
//fix the variable scope of yPosition so that 
//it increases every frame until reaching the height of the screen.

int yPosition;

void setup() {
  size(600, 600);
  yPosition = height/2;
}

void draw() {
  yPosition+=10;
  if (yPosition > height) {
    yPosition = 0;
  }  
  ellipse(width/2, yPosition, 100, 100);
}
