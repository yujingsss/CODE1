//this sketch only draws a single particle that 
//eventually fades to black with each bounce. 
//Create an arrayList of the particles, 
//add a new particle every 30 frames, 
//and finally remove the particle when it is 'dead.'

ArrayList <Particle> myParticle = new ArrayList<Particle>(); 

void setup() {
  size(600, 600);
}

void draw() {
  background(0); 
  if (frameCount % 30 == 0) {
    myParticle.add(new Particle(width/2, height/2));
  }
  for (int i=0; i < myParticle.size(); i ++) {
    Particle p = myParticle.get(i);  
    p.move();
    p.bounce(); 
    p.display();
    //to check to see if a particle is still alive, can use .dead() method
    if (p.dead() == true) {
      println(p.dead());
      myParticle.remove(i);
    }
  }
}

class Particle {
  PVector pos; 
  PVector vel; 
  float size; 

  int opacity = 255; 

  Particle(float x, float y) {
    pos = new PVector(x, y); 

    vel = new PVector(random(-5, 5), random(-5, 5)); 

    size = random(5, 15);
  }

  void move() {
    pos.add(vel);
  }

  void bounce() {
    if (pos.x<= size/2 || pos.x>= width-size/2) {
      vel.x = - vel.x*.9; 
      opacity -= 80;
    }
    if (pos.y<= size/2 || pos.y>= height -size/2) {
      vel.y = - vel.y*.9; 
      opacity -= 80;
    }
  }

  void display() {
    fill(255, opacity); 
    ellipse(pos.x, pos.y, size, size);
  }

  boolean dead() {
    if (opacity <= 20) {
      return true;
    } else {
      return false;
    }
  }
}
