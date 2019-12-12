//Fix the for loop so that it prints out the product of even integers from 2-10.
int row, column, distance;
void setup() {
  size(600, 600);
  row = 5;
  column = 5;
  distance = width/6;
}

void draw() {
  background(0); 

  for (int i = 1; i < row+1; i++) {
    for (int j = 1; j < column+1; j++)
      text(str(i*2*j*2), i*distance, j*distance); 
    //hint : str() converts an integer to a string
  }
}
