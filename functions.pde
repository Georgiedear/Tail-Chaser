void drawGrad() {
  //GRADIENT TIMING

  int score_t = millis();

  // grad.setGradient(color(0, 255, 210), color(255, 193, 244));
  grad.setGradient(color(0, 255, 210), color(255, 193, 244, 40));
  if (score_t > 15000) {
    grad.setGradient(color(66, 60, 238), color(255, 193, 244, 40));
  } 
  if (score_t > 25000) {

    grad.setGradient(color(87, 35, 219), color(255, 100, 116, 40));
  }


  if (score_t > 35000) {

    grad.setGradient(color(17, 36, 174), color(0));
  }
}



void spawn() {
  enemies.add(new Enemies());
}

void hover() {
  float hover = map(distance, 0, 250, 0, 100); 
  fill(255);
  ellipse(xPos+150, yPos+hover, rad, rad);

  if ((hover > 0) && (hover < 5)) {
    yPos++;
  } else if ((hover > 5) && (hover < 10)) {
    yPos--;
  }
}

void collision() { 
//  float d = dist(xPos, yPos, size, rad);

}
