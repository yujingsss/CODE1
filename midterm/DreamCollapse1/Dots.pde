class Dot {
  float xPos, yPos;
  float xSpeed, ySpeed;
  color c;

  Dot() {
    c = color(255);
    xPos=random(0, width);
    yPos=random(0, 20);
    xSpeed=random(0.1, 4);
    ySpeed=random(-4, 4);
  }

  void drawDot() {
    stroke(c);
    strokeWeight(1);
    point(xPos, yPos);
  }

  void moveDot() {
    xPos+=xSpeed;
    yPos+=ySpeed;
    //|| xPos <= 0
    if (xPos >= width ) {
      xSpeed = -xSpeed;
    } 
    //|| yPos <= 0
    if (yPos >= height) {
      ySpeed = -ySpeed;
    }
  }
  void moveDotGame() {
    xPos+=xSpeed;
    yPos+=ySpeed;
    if (xPos >= width || xPos <= 0) {
      xSpeed = -xSpeed;
    } 
    if (yPos >= height || yPos <= 0) {
      ySpeed = -ySpeed;
    }
  }
}
