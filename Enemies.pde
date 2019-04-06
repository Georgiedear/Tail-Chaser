class Enemies {
  int move;
  color c;
//  float size;
  float col;
  PVector location;
  PVector velocity;
  float x;
  float y;
  
  Enemies() {

    c = color(random(255), random(255), random(255));
   location = new PVector(width, random(size, height)); // Must be X 2 because we're using size as the center
    velocity = new PVector(-0.2, 0);
  //  size = 20;
  
  } 

  void display() {
    fill(255);
    rect(location.x, location.y, size, size);
  }

  void move() {
    //  velocity.add(acceleration);
    location.add(velocity);
  }

  void end() {
  }

  // If the enemy passes the left side of the screen
  boolean isDead() {
    if (location.x < 0 -size*2 || location.y - size < 0 || location.y + size > height) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean collisionB() {
    if(rad+size < yPos  ) {
    background(0);
    
      return true;
    } else {
      return false;
    }
  }
}
