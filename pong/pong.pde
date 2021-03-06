static final float
    SCREEN_WIDTH = 800,
    SCREEN_HEIGHT = 400;
Point origin; // To translate the canvas
Bar[] bars; // Array of bars
Ball ball;

KeysTracker kt1, kt2;

void setup() {
  size(800, 400);
  origin = new Point(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
  
  // Bars initialization
  bars = new Bar[2];
  bars[0] = new Bar(-SCREEN_WIDTH * 0.4, 0); // left bar
  bars[1] = new Bar(SCREEN_WIDTH * 0.4, 0); // right bar
  
  // Ball initialization
  ball = new Ball(0, 0);
  
  // keeps a track of the passed keys
  kt1 = new KeysTracker(new int[] {
    'w', 's'
  }, false); // false = alphanumeric keys
  kt2 = new KeysTracker(new int[] {
    UP, DOWN
  }, true); // true = special keys
}

void draw() {
  background(0);
  translate(origin.x, origin.y);
  bars[0].setYDirection(kt1.isPressed('w') ? BaseObject.up : (kt1.isPressed('s') ? BaseObject.down : BaseObject.none));
  bars[1].setYDirection(kt2.isPressed(UP) ? BaseObject.up : (kt2.isPressed(DOWN) ? BaseObject.down : BaseObject.none));
  
  /* same as
  for (int i = 0; i < bars.length; i++) {
    bars[i].move();
    bars[i].draw();
  } */
  for (Bar b : bars) {
    b.move();
    if (b.colliding(ball)) ball.bounce(b);
    b.draw();
    // Draw scoreboard
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(SCREEN_WIDTH / 20);
    text(String.valueOf(b.points), b.x * 0.2, -SCREEN_HEIGHT * 0.4);
  }
  ball.move();
  if (Math.abs(ball.x) == ball.limitX) { // Bouncing in a limit in X
    // If touch the left, +1 for the second player, else to the first
    bars[ball.x < 0 ? 1 : 0].goal();
  }
  ball.draw();
  // Draw middle bar
  stroke(255);
  strokeWeight(SCREEN_WIDTH / 200);
  line(0, -SCREEN_HEIGHT * 0.4, 0, SCREEN_HEIGHT * 0.4);
}

/* says to the KeysTrackers
that a key was pressed */
void keyPressed() {
  kt1.keyPressed();
  kt2.keyPressed();
}

/* says to the KeysTrackers
that a key was released */
void keyReleased() {
  kt1.keyReleased();
  kt2.keyReleased();
}
