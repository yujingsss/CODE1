// Fix all the syntax errors so the code runs.
int counter = 0;
String welcomeMsg = "welcome to the first midterm question!";
float []floatArray = new float[100];

void setup() {
  frameRate(4);
  // we'll create a counter variable to count the frames

  //boolean isCodeGreat = true;
  println(welcomeMsg);
  println("now we'll do a loop and print the iterating value!");
  for (int i = 0; i < 3; i++) {
    println("this is loop number " + i);
  }
  println("there are " + floatArray.length + " positions in floatArray");
}

void draw() {
  background(0);
  counter++;
  // we'll increment counter every frame until 60, then reset
  if (frameCount % 60 == 0) {
    counter=0;
  } 
  text(counter, width/2, height/2);
}
