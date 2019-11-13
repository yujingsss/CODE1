class Brick {
  float pos[] = {100, width/2, width-150, width/3, width*3/5, width*39/80};

  PImage brick1;
  PImage brick2;
  PImage brick3;

  Brick() {
    brick1 = loadImage("brick-05.png");
    brick2 = loadImage("brick-06.png");
    brick3 = loadImage("brick-07.png");
  }
  void drawBrick() {
    imageMode(CORNER);
    image(brick1, pos[0], 0, 100, 100);
    image(brick2, pos[1], 0, 100, 100);
    image(brick3, pos[2], 0, 200, 200);  
    image(brick1, pos[4]+20, 0, 100, 100);
    image(brick3, pos[3], 0, 200, 200); 
    pushMatrix();
    translate(width, 0);
    rotate(PI/2);
    image(brick3, pos[3], 0, 200, 200);    
    image(brick2, pos[5], 0, 100, 100);
    image(brick1, pos[4], 0, 100, 100);
    popMatrix();
    pushMatrix();
    translate(width, height);
    rotate(-PI);
    image(brick1, pos[0], 0, 100, 100);
    image(brick2, pos[1], 0, 100, 100);
    image(brick3, pos[2], 0, 200, 200);
    image(brick3, pos[3], 0, 200, 200); 
    popMatrix();
  }
}
