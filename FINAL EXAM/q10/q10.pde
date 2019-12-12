//Create an array list to store your invaders.
//Add a new invader object to your array list every 60 frames.

ArrayList <Invader> myInvader = new ArrayList<Invader>();

void setup() {
  size(600, 600); 
  noStroke();
}

void draw() {
  background(255);
  if (frameCount % 60 == 0) {
    myInvader.add(new Invader());
  }
  for (int i=0; i < myInvader.size(); i ++) {
    Invader I = myInvader.get(i);  
    I.display();
    I.move();
    //to check to see if a particle is still alive, can use .dead() method
  }
}

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
  int size = 10; 
  float xPos, yPos;

  Invader() {
    xPos=random(size/2, width-size/2); 
    yPos=random(size/2, height-size/2);
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


  void move() {
    float r = random(0, 1);
    if (r <= .25) {
      xPos ++;
      yPos ++;
    }
    //finish the logic here!
    else if ( r > .25 && r < .5) {      
      xPos ++;
      yPos --;
    } else if ( r > .5 && r < .75) {      
      xPos --;
      yPos ++;
    } else {
      xPos --;
      yPos --;
    }
  }
}
