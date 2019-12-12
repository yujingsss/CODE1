//Fix the example code so that your ellipse 
//moves in the wave pictured below. 
//The wave's amplitude should grow larger as the xPos increases, 
//and bounce from left to right. Hint use map() for the amplitude.

int size = 50; 
float xPos = size/2, yPos; 
int xDirection = 1; 
float theta; 
float ampl; 
boolean bounceR=false;

void setup() {
  size(800, 600);
}
void draw() {
  background(0); 
  theta += .05; 

  xPos += xDirection;

  //create boundaries for your xPos 
  if (xPos >= width - size/2 || xPos <= size/2) {
    bounceR = true;
    println(bounceR);
  } else {
    bounceR = false;
  }
  if (bounceR == true) {
    xDirection = -xDirection;
  } else {
  }
  //use the map function for ampl 
  ampl = map(xPos, 0, width, 0, height/2);
  //fix yPos 
  yPos = height/2 + sin(theta)*ampl; 
  fill(255); 
  ellipse(xPos, yPos, size, size);
}
