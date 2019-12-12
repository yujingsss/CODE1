class Bad {
  int grid[][] = {
    {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0}, 
    {0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0}, 
    {0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1}, 
    {1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1}, 
    {0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0}
  };
  int rows = 8, cols = 11; 
  int size = 5; 
  float xPos, yPos;
  float xSpeed, ySpeed;

  Bad() {
    xPos=random(size/2, width-size/2); 
    yPos=0;
    ySpeed=random(1, 2);
  }

  void display() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid [i][j] == 1) {
          fill(#B093E3);
          rect(j*size+xPos, i*size+yPos, size, size);
        }
      }
    }
  }
  void move() {
    yPos+=ySpeed;
  }
  void checkBoundary() {
    if (yPos>height) {
      yPos=random(-150, 0);
      xPos=random(0, width);
      ySpeed+=.5;
    }
  }  
  void checkBoundaries() {
    if (yPos>height-size/2) {
      yPos=0-size/2;
    }
  }
}
