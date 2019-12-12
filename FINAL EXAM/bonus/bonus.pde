int badNum=10;
Invader myInvader;
ArrayList <Weapon> myWeapons = new ArrayList<Weapon>();
Bad[] badGuys = new Bad[badNum];

int score=0;

void setup() {
  size(600, 600); 
  myInvader = new Invader();
  for (int i=0; i < badNum; i ++) {
    badGuys[i] = new Bad();
  }
  noStroke();
  println("press mouse to launch bullet");
}


void mousePressed() {
  myWeapons.add(new Weapon());
}

void draw() {
  background(255);
  for (int i=0; i < badNum; i ++) {
    badGuys[i].display();
    badGuys[i].move();
    badGuys[i].checkBoundaries();
  }

  myInvader.display();
  myInvader.control();
  myInvader.checkBoundaries();
  for (int j=0; j<badNum; j++) {
    if (myInvader.xPos >= badGuys[j].xPos-20 && myInvader.xPos <= badGuys[j].xPos+50 && myInvader.yPos >= badGuys[j].yPos-20
      && myInvader.yPos <= badGuys[j].yPos+40) {
      myInvader = new Invader();
      badGuys[j] = new Bad();
    }
  }
  for (int i=0; i<myWeapons.size(); i++) { 
    Weapon w = myWeapons.get(i);
    w.drawWeapon();
    w.launchWeapon();
    if (w.yPos < 0) {
      myWeapons.remove(i);
    }
    for (int j=0; j<badNum; j++) {
      if (myInvader.xPos >= badGuys[j].xPos && myInvader.xPos+50 <= badGuys[j].xPos+50 && myInvader.yPos >= badGuys[j].yPos
        && myInvader.yPos+40 <= badGuys[j].yPos+40) {
        myInvader = new Invader();
      }
      if (w.yPos+5 >= badGuys[j].yPos && w.yPos-5 <= badGuys[j].yPos + 40
        && w.xPos+5 >= badGuys[j].xPos && w.xPos-5 <= badGuys[j].xPos+ 50) {
        badGuys[j]=new Bad();
        score+=10;
      }
    }
  }
  text("score: "+score, width/9, height/9);
}
