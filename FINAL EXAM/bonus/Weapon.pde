class Weapon {
  float xPos;
  float yPos;
  float ySpeed;
  Weapon() {
    xPos=myInvader.xPos;
    yPos=myInvader.yPos;
    ySpeed+=-20;
  }
  void drawWeapon() {
    fill(0);
    ellipse(xPos+25, yPos+20, 10, 10);
  }
  void launchWeapon() {
    yPos+=ySpeed;
  }
}
