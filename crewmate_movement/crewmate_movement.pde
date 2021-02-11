final int screenWidth = 720,
    screenHeight = 480;

int x,
    y,
    blockSize,
    speed;

PImage crewmate;

void setup() {
  size(720, 480);
  x = screenWidth / 2;
  y = screenHeight / 2;
  blockSize = screenWidth / 10;
  speed = blockSize / 10;
  crewmate = loadImage("cyan-crewmate.png");
}

void draw() {
  background(0);
  image(crewmate, x, y, blockSize, blockSize);
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
