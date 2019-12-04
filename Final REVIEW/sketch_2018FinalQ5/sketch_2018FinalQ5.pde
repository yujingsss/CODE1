//currently all of the shapes are drawn in the top left corner 
//and the size is constantly oscillating. 
//Fix the sketch so the shape is drawn at the mouse position 
//and the size is randomized but doesn't flicker throughout the draw loop.

ArrayList <Shape> shapes = new ArrayList<Shape>(); 

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  for (int i = 0; i<shapes.size(); i++) {
    Shape s =   shapes.get(i); 
    s.display();
  }
}

void mousePressed() {
  shapes.add(new Shape(mouseX, mouseY));
}

class Shape {
  float x, y; 
  float size; 

  Shape(float _x, float _y) {
    x = _x; 
    y = _y;
    size = random(30,100);
  }

  void display() {
    //size = _size; 
    ellipse(x, y, size, size);  
    triangle(x, y-size/2, x+size/3, y+size/3, x-size/3, y+size/3);
  }
}
