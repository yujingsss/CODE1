class Obstacle {
  float xPos;
  float yPos;
  float ySpeed;
  float w, h;
  boolean collision;
  boolean previousCollision;

  Obstacle() {
    w=32;
    h=8;
    xPos=random(0, width);
    yPos=random(-150, 0);
    ySpeed=random( 1, 3);
    previousCollision=false;
    collision=false;
  }
  void drawObstacle() {
    fill(#EAEAEA);  
    rect(xPos, yPos, w, h);
  }
  void moveObstacle() {
    yPos+=ySpeed;
  }       

  void checkBoundary() {
    if (yPos>height) {
      yPos=random(-150, 0);
      xPos=random(0, width);
      ySpeed+=.5;
    }
  }
}
