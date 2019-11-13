class Sword {
  float xPos, yPos;
  float ySpeed;
  int size;
  PImage sword;

  Sword() {
    xPos=random(0, width);
    yPos=0;
    ySpeed=random(3, 5);
    size=30;
    sword=loadImage("sword.png");
  }
  void drawSword() {
    image(sword, xPos, yPos, size, size);
  }
  void moveSword() {
    yPos+=ySpeed;
  }
  void checkBoundary() {
    if (yPos>height) {
      xPos=random(0,width);
      yPos=0;
    }
  }
}
