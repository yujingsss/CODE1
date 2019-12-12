String welcomeMsg; 
boolean isCodeGreat;
float[] floatArray = new float[100];

void setup() {
  welcomeMsg = "welcome to the first midterm question!";

  isCodeGreat = true;

  println(welcomeMsg);

  println("now we'll do a loop and print the iterating value!");
  for (int i = 0; i < 3; i++) { 
    println("this is loop number ", i);
  }
  for (int i=0; i<100; i++) {
    floatArray[i]=1;
  }
}

void draw() {
  if (isCodeGreat == true) {
    println(floatArray[0]);
  }
}
