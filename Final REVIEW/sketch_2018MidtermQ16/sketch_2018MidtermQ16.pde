//this sketch uses a single array of floats to store values used 
//in a drawing function. 
//change the sketch so that it instantiates an array 
//of 100 ellipses instead. you will need to change 
//the way the values are given to the array.
//map the values in the array so that when drawn,
//the ellipses will be evenly spaced moving down the screen from the top to the bottom.

float[] pos = new float[100];

void setup() {
  size(600, 600);
  for (int i=0; i<100; i++){
  pos[i] = i * 600/100;}
}

void draw() {
  background(240);
  for (int i = 0; i < pos.length; i++) {
    ellipse(width/2, pos[i], 50, 50);
  }
}
