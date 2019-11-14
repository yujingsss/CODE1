//DreamCollapse
//http://soundbible.com/
//https://www.bensound.com/royalty-free-music/track/deep-blue
//https://freesound.org/people/
//https://www.zapsplat.com/?s=game&post_type=music&sound-effect-category-id=

import processing.sound.*;
SoundFile fileBGM;
SoundFile hit;
SoundFile bullet;
SoundFile jump;
int screen = 0;
PFont font;
int dotNum = 10000;
int gameDotNum = 5000;
int obstacleNum=20;
int swordNum=8;
Dot[] myDots= new Dot[dotNum];
Dot[] gameDots= new Dot[gameDotNum]; 
Player myPlayer;
Brick newBricks;
Sword[] newSwords= new Sword[swordNum];
Obstacle newObstacles[] = new Obstacle[obstacleNum];
int life=3;
boolean weapon=false;
int score=0;
int t=1800;
int timer=60;
int highestScore=0;
ArrayList <Weapon> myWeapons;

void setup() {
  size(800, 800);
  font = createFont("slkscr.ttf", 20);
  textFont(font);
  myWeapons = new ArrayList<Weapon>();

  newBricks = new Brick();
  myPlayer = new Player();
  for (int i = 0; i < dotNum; i++) {
    myDots[i] = new Dot();
  }
  for (int i = 0; i < gameDotNum; i++) {
    gameDots[i] = new Dot();
  }
  for (int i=0; i<obstacleNum; i++) {
    newObstacles[i] = new Obstacle();
  }
  for (int i=0; i<swordNum; i++) {
    newSwords[i]= new Sword();
  }
  fileBGM = new SoundFile(this, "bensound-deepblue.mp3");
  fileBGM.amp(.8);
  fileBGM.loop();
  hit = new SoundFile(this, "hit.wav");
  bullet = new SoundFile(this, "bullet.mp3");
  bullet.amp(.2);
  jump = new SoundFile(this, "jump.mp3");
  jump.amp(.6);
}

void draw() { 
  switch (screen) {
  case 0:
    introduction();
    break;
  case 1:
    startScreen();
    break;
  case 2:
    gameScreen();
    break;
  case 3:
    endScreen();
    break;
  case 4: 
    deadScreen();
    break;
  }
  //println(mouseX, mouseY);
}

void keyPressed() {
  if (screen == 0) {
    screen = 1;
  }
  if (screen == 4) {
    screen=1;
    life=3;
    score=0;
    t=1800;
    timer=60;
    for (int i=0; i<obstacleNum; i++) {
      newObstacles[i]=new Obstacle();
    }  
    myPlayer = new Player();
  }
}


void mousePressed() {
  if (mouseX>width/2 -25 && mouseX<width/2-25+50 && mouseY>height/2+30 && mouseY<height/2+30+20) {
    screen = 2;
  }
  if (screen==2) {
    //weapon=true;
    myWeapons.add(new Weapon());
    //myPlayer.y = myPlayer.yPos;
    //myPlayer.x = myPlayer.xPos;
  }
  //println(weapon);
  if (screen==3) {
    screen=1;
    life=3;
    score=0;
    t=1800;
    timer=60;
    for (int i=0; i<obstacleNum; i++) {
      newObstacles[i]=new Obstacle();
    }  
    myPlayer = new Player();
  }
}

void introduction() {
  background(0);
  myPlayer.drawPlayer0();
  myPlayer.movePlayer0();
  myPlayer.checkBoundaries0();
  fill(255);
  textSize(50);
  text("DREAM COLLAPSE", width/10, height/4);
  textSize(20);
  text("You are trapped in a collapsing dream, try to escape!", width/10, height/3, width*4/5, height/5 );
  text( "Press SPACE to see instructions.", width/10, height/3+100);
}
void startScreen() {
  background(0);
  for (int i = 0; i < dotNum; i++) {
    myDots[i].drawDot();
    myDots[i].moveDot();
  }
  textSize(20);
  fill(255);
  textAlign(CENTER, BOTTOM);
  text("Press mouse to launch bullet.", width/2, height/2-45);
  text("Use ARROW keys to control.", width/2, height/2-15); 
  text ("Press the button to start.", width/2, height/2+15);
  rect(width/2 - 25, height/2 + 30, 50, 20);
}
void gameScreen() {
  background(0);
  newBricks.drawBrick();
  myPlayer.drawPlayer();
  myPlayer.controlPlayer();
  myPlayer.brickAvoid();
  myPlayer.checkBoundaries();
  //if (weapon==true) {
  //myPlayer.drawWeapon();
  for (int i=0; i<myWeapons.size(); i++) {
    Weapon w = myWeapons.get(i);
    w.drawWeapon();
    w.launchWeapon();
    if (w.yPos < 0) {
      myWeapons.remove(i);
    }
    for (int j=0; j<obstacleNum; j++) {
      if (w.yPos+5 >= newObstacles[j].yPos && w.yPos-5 <= newObstacles[j].yPos + newObstacles[j].h
        && w.xPos+5 >= newObstacles[j].xPos && w.xPos-5 <= newObstacles[j].xPos+newObstacles[j].w) {
        newObstacles[j]=new Obstacle();
        bullet.play();
        score+=10;
        //weapon=false;
      }
    }
    //}
  }
  textSize(20);
  textAlign(LEFT);
  text("Life: " + life, width-140, height-180);
  text("score:" + score, width-140, height-150);
  t--;
  timer=floor(t/30);
  println(timer);
  text("time: " + timer, width-140, height-120);
  for (int i = 0; i < gameDotNum; i++) {
    gameDots[i].drawDot();
    gameDots[i].moveDotGame();
  }
  for (int i=0; i<swordNum; i++) {
    newSwords[i].drawSword();
    newSwords[i].moveSword();
    newSwords[i].checkBoundary();
    if (myPlayer.xPos>=newSwords[i].xPos-newSwords[i].size/2 && 
      myPlayer.xPos<=newSwords[i].xPos+newSwords[i].size/2 &&
      myPlayer.yPos>=newSwords[i].yPos-newSwords[i].size/2 &&
      myPlayer.yPos<=newSwords[i].yPos+newSwords[i].size/2) {
      jump.play();
      myPlayer.xPos=random(0+myPlayer.size, width-myPlayer.size);
      myPlayer.yPos=random(0+myPlayer.size, height-myPlayer.size);
    }
  }
  for (int i=0; i<obstacleNum; i++) {
    newObstacles[i].drawObstacle();
    newObstacles[i].moveObstacle();
    newObstacles[i].checkBoundary();
    if (myPlayer.xPos>newObstacles[i].xPos && myPlayer.xPos<newObstacles[i].xPos+newObstacles[i].w 
      && myPlayer.yPos>newObstacles[i].yPos && myPlayer.yPos<newObstacles[i].yPos+newObstacles[i].h) {
      newObstacles[i].collision=true;
    }
    if (newObstacles[i].collision != newObstacles[i].previousCollision) {
      newObstacles[i]=new Obstacle();
      hit.play();
      life+=-1;
      myPlayer.playerCollided();      
      textSize(20);
      fill(255);
      text("-1", myPlayer.xPos+30, myPlayer.yPos);
      println("LIFE" + life);
    }
    if (life<=0) {
      screen=4;
    }
    newObstacles[i].previousCollision=newObstacles[i].collision;
    //if (myPlayer.y >= newObstacles[i].yPos && myPlayer.y <= newObstacles[i].yPos+newObstacles[i].h
    //  && myPlayer.x >= newObstacles[i].xPos && myPlayer.x <= newObstacles[i].xPos+newObstacles[i].w) {
    //  newObstacles[i]=new Obstacle();
    //  bullet.play();
    //  score+=10;
    //  weapon=false;
    //} 
    //if (myPlayer.y <= -5) {
    //  weapon=false;
    //}
  }
  if (timer==0 && life>0) {
    screen=3;
  }
}

void endScreen() {
  background(0);
  if (score>=highestScore) {
    highestScore=score;
  }
  textSize(50);
  textAlign(CENTER, BOTTOM);
  text("ESCAPED", width/2, height/2);
  textSize(20);
  text("score:" + score, width/2, height/2+40);
  text("Highest Score:" +highestScore, width/2, height/2+60);
  textSize(15);
  text("Press mouse to play again", width/2, height/2+80);
}
void deadScreen() {
  background(0);
  textSize(50);
  textAlign(CENTER, BOTTOM);
  text("ESCAPE FAILED, TRAPPED", width/2, height/2);
  textSize(20);
  textAlign(CENTER, BOTTOM);
  text("Press SPACE key to restart", width/2, height/2+60);
}
