class Invader {
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

  Invader() {
    xPos=width/2; 
    yPos=height-100;
  }

  void display() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid [i][j] == 1) {
          fill(0);
          rect(j*size+xPos, i*size+yPos, size, size);
        }
      }
    }
  }
  void control() {
    if (keyPressed) {
      if (keyCode == UP) {
        ySpeed=-4;
      } else if (keyCode == DOWN) {
        ySpeed=4;
      } else if (keyCode == LEFT) {
        xSpeed=-4;
      } else if (keyCode == RIGHT) {
        xSpeed=4;
      }
    } else { 
      xSpeed = 0; 
      ySpeed = 0;
    }
    xPos+=xSpeed;
    yPos+=ySpeed;
  }

  void checkBoundaries() {
    if (xPos>width-size/2) {
      xPos=width/5;
    }
    if (xPos < size/2) {
      xPos=width*4/5;
    }
    if (yPos>height-size/2) {
      yPos=height/5;
    }
    if (yPos < size/2) {
      yPos=height*4/5;
    }
  }
}
