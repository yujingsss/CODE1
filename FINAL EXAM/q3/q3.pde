//Fix the map function for the background so 
//it matches the example below. Map the xPos to seconds.

float xPos, yPos; 
float r, g, b; 

void setup() {
  size(600, 600); 
  smooth();  
  noStroke();
}

void draw() {

  //draws background
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      float r = map(i, 0, width, 255, 91 );
      float g = map(j, 0, height, 170, 33);
      stroke(r, g, 175);
      point(i, j);
    }
  }

  yPos = sin(radians(second()))*height; 
  xPos = sin(radians(second()))*width;

  ellipse(xPos+100/2, yPos+100/2, 100, 100);
}
