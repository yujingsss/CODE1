class Weapon {
  float xPos;
  float yPos;
  float ySpeed;
  Weapon() {
    xPos=myPlayer.xPos;
    yPos=myPlayer.yPos;
    ySpeed+=-20;
  }
  void drawWeapon() {
    fill(255);
    ellipse(xPos, yPos,10,10);
  }
  void launchWeapon() {
    yPos+=ySpeed;
  }
}
