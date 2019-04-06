//TAILCHASERS BY GEORGINA YEBOAH
//COURSE: Program! DIGF – 6014 - 001
// Instructors: Rhys Mendes and Kyle Duffield 
import processing.serial.*;

//REFERENCES:
//GRADIENT REFERENCE FROM PROCESSING AND LATER SORTED IN A CLASS BY YOURS TRULY: https://processing.org/examples/lineargradient.html
//ELLIPSE ARRAY TAIL REFERENCE: https://forum.processing.org/beta/num_1264911247.html




//CLASSES
Gradient grad;
Player [] player = new Player[20];
ArrayList<Enemies> enemies;
Serial myPort;
float distance;
float xPos;
float yPos;
float rad;

float hover;
float size;
//PVector location;

int frame = 0;

void setup() {
  size(800, 250);

  //INSTANTIATE GRADIENT OBJECT
  grad = new Gradient(0, 0, width, height, color(0, 255, 210), color(255, 193, 244), 1);

  //INSTANTIATE PLAYER OBJECT
  for (int i = 0; i < player.length; i++) {
    player[i] = new Player(20);
  }

  //INSTANTIATE ENEMY OBJECT

  enemies = new ArrayList<Enemies>();

  myPort = new Serial(this, "/dev/cu.usbmodem1411", 9600);
  distance = 0;
  size = 20;
  rad = 20;

  // location = new PVector(width, random(size, height));
}

void draw() {

  if (myPort.available() > 0) {

    distance = myPort.read();
  }
  switch(frame) {
  case 0:
    fill(0, 0, 0, 10);
    noStroke();
    rect(0, 0, width, height);
    fill(255);
    textSize(40);
    text("TailChaser", 285, 70);
    textSize(14);
    text("By Georgina Yeboah", 315, 95);

    textSize(16);
    text("Fly through the sky as long as you can", 240, 130);
    text("and avoid the white cubes.", 280, 160);
    text("If you hit one it's game over!", 270, 190);
    text("Tap to Start", 330, 220);



    break;
  case 1:


    drawGrad();
    spawn(); //ENEMIES Make an enemy every frame...you probably don't want this...
    //enemies.add(new Enemies()); 
    // hover();
    //DRAWING TAIL PLAYER
    collision();

    for (int i = 0; i < player.length; i++) {
      player[i].move();
      player[i].displayScore();
    }
    //DRAWING ENEMIES
    for (int i = 0; i < enemies.size(); i++) {
      Enemies e = enemies.get(0);
      e.display();
      e.move();
      //  e.collisionB();
      //Return boolean from class of whether object has exceeded bounds
      if (e.isDead()) {
        // Remove from array
        enemies.remove(i);
        // println(enemies.size());
      }
      collision();
    }
    break;
  case 2:
    textSize(22);
   // int score_t = millis();

    fill(255);
    text ("Score:", 600, 30);

    text("Thanks for playing!", 270, 60);
  }

  // if ( collision( player, enemies) == true ) fill (255, 128);
  // else fill(0, 255, 0, 128);
}


void mousePressed() {
  if (mousePressed) {
    frame++;
  }
}


//////////////////////////////////////////////////////////
/*

 boolean collision ( Player [] p, ArrayList<Enemies> e) {
 
 
 //float d = dist(p.xPos, p.yPos, e.size, e.size);
 //  if ( p.rad + e.size < d ) {
 
 return false; //they do not
 // } else {
 //   return true; // they do
 //  }
 }
 
 */
