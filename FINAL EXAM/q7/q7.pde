//Replicate the following example, 
//you should have a string array and 
//change the color of the strings when the mouse hovers over it.

int numStrings = 7; 
float[] stringsX= new float[numStrings]; 
float[] stringsY = new float[numStrings]; 
String[] sentence = {"Hello", "is", "it", "me", "you're", "looking", "for"};

void setup() {

  size(700, 100); 
  smooth(); 

  int spacing = width / numStrings; 
  for (int i=0; i<numStrings; i++) {
    stringsX[i] = 50 + i*spacing; 
    stringsY[i] = 50;
  }
}

void draw() {
  background(255); 
  for (int i=0; i<numStrings; i++) {
    if (dist(mouseX, mouseY, stringsX[i], stringsY[i])<50) {
      fill(200, 0, 0);
    } else {
      fill(0);
    }
    text(sentence[i], stringsX[i], stringsY[i]);
  }
}
