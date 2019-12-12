//Fix the sketch so that the scene number increases with the right arrow key 
//and decrease with the left arrow key. When you get to the end of the scenes, 
//the screneNumber should start back at 0. 
//(The logic for this is already there for you).

int sceneNumber = 0; 

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  //write a switch for your scenes
  switch (sceneNumber) {
    case 0:
      scene0();
      break;
     case 1:
      scene1();
      break;
     case 2:
      scene2();
      break;
     case 3:
      scene3();
      break;
  }
  if (sceneNumber < 0) {
    sceneNumber = 3;
  }

  if (sceneNumber > 3) {
    sceneNumber = 0;
  }

  fill(255); 
  text("the scene number is: " + str(sceneNumber), 100, 100);
}

//use the void keyPressed functions to increase the scene number with the 
//right key and decrease the screen number with the left key 

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      sceneNumber++;
      //println(sceneNumber);
    } else if (keyCode == LEFT) {
      sceneNumber--;
      //println(sceneNumber);
    }
  }
}

void scene0() {
  background(255, 0, 255);
}

void scene1() {
  background(0, 0, 255);
}

void scene2() {
  background(0, 255, 255);
}

void scene3() {
  background(255, 0, 0);
}
