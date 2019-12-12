//Create a class for your space invader. 
//The class should have a display method,
//a move method that randomly moves the invader. Create one instance of your invader.

Invader myInvader;

void setup() {
  size(600, 600); 
  myInvader = new Invader();
  noStroke();
}

void draw() {
  background(255);
  myInvader.display();
  myInvader.move();
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
    xPos=200; 
    yPos=200;
  }

  void display() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid [i][j] == 1) {
          fill(0);
        } else {
          fill(255);
        }  
        rect(j*size+xPos, i*size+yPos, size, size);
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
