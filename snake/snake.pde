final static int WIDTH = 600, HEIGHT = 600;
Point origin;
KeysTracker kt;

Snake snake;

void setup() {
  size(600, 600);
  origin = new Point(WIDTH / 2, HEIGHT / 2);
  kt = new KeysTracker(new int[] {
    'w', 'a', 's', 'd', // Movement
    ENTER, // Play again
    '1', '2', '3', '4', '5' // Speed control
  });
  
  play();
}

void play() {
  delay = 8;
  frame = 0;
  snake = new Snake(new Point(0, 0), new Dimension(60, 60), new Dimension(600, 600));
}

int delay, frame;
void draw() {
  if (kt.isPressed('1')) delay = 64;
  else if (kt.isPressed('2')) delay = 32;
  else if (kt.isPressed('3')) delay = 16;
  else if (kt.isPressed('4')) delay = 8;
  else if (kt.isPressed('5')) delay = 4;
  if (snake.alive) {
    if (frame++ % delay != 0) return;
    if (kt.isPressed('w')) snake.setDirection(Snake.up);
    else if (kt.isPressed('s')) snake.setDirection(Snake.down);
    else if (kt.isPressed('a')) snake.setDirection(Snake.left);
    else if (kt.isPressed('d')) snake.setDirection(Snake.right);
  } else {
    if (kt.isPressed(ENTER)) play();
    if (frame++ % delay != 0) return;
  }
  background(0);
  translate(origin.x, origin.y);
  snake.move();
  snake.draw();
  // Text
  fill(0xffffff00);
  textAlign(CENTER, CENTER);
  textSize(WIDTH / 50);
  text("Size: " + String.valueOf(snake.body.size), -WIDTH * 0.46, -HEIGHT * 0.48);
  if (!snake.alive) {
    textSize(WIDTH / 30);
    text("Game Over", 0, 0);
  }
}

void keyPressed() {
  kt.keyPressed();
}

void keyReleased() {
  kt.keyReleased();
}
