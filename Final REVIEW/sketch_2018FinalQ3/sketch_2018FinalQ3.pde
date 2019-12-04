//this sketch should draw 25 ellipses, 
//evenly across the canvas, that oscillate at slightly different frequency. 
//adjust the ellipse spacing, change the y offset 
//so the wave starts in the middle of the canvas, 
//and change the height of the wave so it covers the entire canvas.

int num = 25; 
float xPos [] = new float[num]; 
int size = 20; 
float theta;

int waveOffset; 

void setup(){
  size(500, 500); 
  waveOffset = height/2;
  int spacing = width/num; 
  
  for(int i = 0; i<num; i++){
    xPos[i] = i*spacing + size/2; 
  }
}

void draw(){
  background(100); 
  
 
  for(int i = 0; i<num; i++){
    ellipse(xPos[i], height/2 + sin(theta + i*.2)*waveOffset, size, size );  
  }
  
  theta += .01; 
}
