//SIMPLE LINEAR GRADIENT USED FROM PROCESSING'S REFERENCE LIBRARY PUT INTO A CLASS
// Constants
class Gradient {

  int Y_AXIS;
  color c1, c2;
  int x, y, axis;
  float w, h;
  float r;
  color c;

  PVector location;
  PVector velocity;
  PVector acceleration;
  int scoreT;

  Gradient (int x_, int y_, float w_, float h_, color c1_, color c2_, int axis) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c1 = c1_;
    c2 = c2_;
    r = 10;
    Y_AXIS = axis;

    location = new PVector(0, height/2);
    velocity = new PVector(2.5, 2.5);
    acceleration = new PVector(0, 0);

    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        c = lerpColor(c1, c2, inter);
     
        stroke(c);
        line(x, i, x+w, i);
      }
    }
  }



  void setGradient(color c1_, color c2_) {

    //println("true?");
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      c = lerpColor(c1_, c2_, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }

  void score() {

    textSize(38);
    int score_t = millis();
    fill(255);
    text ("score", 420, 150);
    text(score_t, 430, 190);
  }
}
