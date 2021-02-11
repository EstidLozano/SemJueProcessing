final int screenWidth = 720, screenHeight = 480;

int x, y, crewmateSize, speed;

PImage imgCrewmate;

void setup() {
  size(720, 480);
  x = screenWidth / 2;
  y = screenHeight / 2;
  crewmateSize = screenWidth / 10;
  speed = crewmateSize / 10;
  imgCrewmate = loadImage("cyan_crew.png");
}

void draw() {
  background(0);
  image(imgCrewmate, x, y);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y -= speed;
    } else if (keyCode == DOWN) {
      y += speed;
    } else if (keyCode == LEFT) {
      x -= speed;
    } if (keyCode == RIGHT) {
      x += speed;
    }
  }
}
