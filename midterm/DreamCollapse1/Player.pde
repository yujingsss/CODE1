class Player {
  float xPos, xPos0, yPos0, yPos;
  float xSpeed, ySpeed;
  int size;
  PImage character;
  PImage character0;
  PImage character1;
  PImage characterCollided;
  float ySpeedWeapon;
  float x, y;

  Player() {
    xPos=width/2;
    yPos=height/2;
    yPos0=height*3/5;
    xPos0=-width/10;
    size=50;
    character = loadImage("character1.gif");
    character0 = loadImage("character1-0.png");
    character1 = loadImage("character1-1.png");
    ySpeedWeapon=-70;
    x=xPos;
    y=yPos;
  }
  void drawPlayer0() {   
    image(character, xPos0, yPos0, size, size);
  }
  void drawPlayer() {
    imageMode(CENTER);
    if (frameCount % 14 >= 0 && frameCount % 14 <= 6) {
      image(character0, xPos, yPos, size, size);
    } else {
      image(character1, xPos, yPos, size, size);
    }
  }
  void playerCollided() {
    characterCollided = loadImage("character2.png");
    imageMode(CENTER);
    image(characterCollided, xPos, yPos, size*2, size*2);
  }
  void controlPlayer() {
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

  void movePlayer0() {
    xPos0+=3;
    yPos0+=0;
  }
  void checkBoundaries0() {
    if (xPos0>width-size/2) {
      xPos0=-width/10;
    }
  }
  void checkBoundaries() {
    if (xPos>width-size/2) {
      jump.play();
      xPos=width/5;
    }
    if (xPos < size/2) {
      jump.play();
      xPos=width*4/5;
    }
    if (yPos>height-size/2) {
      jump.play();
      yPos=height/5;
    }
    if (yPos < size/2) {
      jump.play();
      yPos=height*4/5;
    }
  }

  void brickAvoid() {
    if (xPos>100 && xPos<190 && yPos>0 && yPos<95) {
      jump.play();
      xPos=700; 
      yPos=575;
      xSpeed=0;
      ySpeed=0;
    }
    if (xPos>255 && xPos<365 && yPos>0 && yPos<180) {
      jump.play();
      xPos=650; 
      yPos=180;
    }
    if (xPos>400 && xPos<495 && yPos>0 && yPos<95) {
      jump.play();
      xPos=700; 
      yPos=455;
    } 
    if (xPos>500 && xPos<590 && yPos>0 && yPos<95) {
      jump.play();
      xPos=700; 
      yPos=455;
    }
    if (xPos>640 && xPos<750 && yPos>0 && yPos<180) {
      jump.play();
      xPos=530;
      yPos=625;
    }
  }

  void drawWeapon() {    
    fill(255);
    ellipse(x, y, 10, 10);
    y+=ySpeedWeapon;
  }
}
