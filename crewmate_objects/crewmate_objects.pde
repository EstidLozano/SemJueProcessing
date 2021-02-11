final int screenWidth = 720,
          screenHeight = 480;
    
int originX,
    originY;

Crewmate crew1,
         crew2;

void setup() {
  size(720, 480);
  
  originX = screenWidth / 2;
  originY = screenHeight / 2;
  
  PImage imgCyanCrew = loadImage("cyan_crew.png"),
         imgPurpleCrew = loadImage("purple_crew.png");
  imageMode(CENTER);
  
  crew1 = new Crewmate(-50, 0, 50, 5, imgCyanCrew);
  crew2 = new Crewmate(50, 0, 50, 7, imgPurpleCrew);

  crew1.setLimits(originX, originY);
  crew2.setLimits(originX, originY);
}

void draw() {
  translate(originX, originY);
  background(0);
  crew1.move();
  crew2.move();
  crew1.render();
  crew2.render();
}

void keyPressed() {
  if (key == CODED) { // special key
    if (keyCode == UP) {
      crew1.directions[0] = true;
    } else if (keyCode == DOWN) {
      crew1.directions[1] = true;
    } else if (keyCode == LEFT) {
      crew1.directions[2] = true;
    } if (keyCode == RIGHT) {
      crew1.directions[3] = true;
    }
  } else { // non-special key
    if (key == 'w') { // up
      crew2.directions[0] = true;
    } else if (key == 's') { // down
      crew2.directions[1] = true;
    } else if (key == 'a') { // left
      crew2.directions[2] = true;
    } else if (key == 'd') { // right
      crew2.directions[3] = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) { // special key
    if (keyCode == UP) {
      crew1.directions[0] = false;
    } else if (keyCode == DOWN) {
      crew1.directions[1] = false;
    } else if (keyCode == LEFT) {
      crew1.directions[2] = false;
    } if (keyCode == RIGHT) {
      crew1.directions[3] = false;
    }
  } else { // non-special key
    if (key == 'w') { // up
      crew2.directions[0] = false;
    } else if (key == 's') { // down
      crew2.directions[1] = false;
    } else if (key == 'a') { // left
      crew2.directions[2] = false;
    } else if (key == 'd') { // right
      crew2.directions[3] = false;
    }
  }
}
