// screen size
float screenW,
      screenH;
// screen origin
float originX,
      originY;

Bar[] bars;

KeysTracker kt1, kt2;

void setup() {
  size(800, 400);
  screenW = 800;
  screenH = 400;
  originX = screenW / 2;
  originY = screenH / 2;
  
  bars = new Bar[2];
  bars[0] = new Bar(-screenW * 0.4, 0, 15, 80, 10, 0.5); // left bar
  bars[1] = new Bar(screenW * 0.4, 0, 15, 80, 10, 0.5); // right bar
  for(Bar bar : bars) {
    bar.setLimitY(screenH / 2);
  }
  
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
  translate(originX, originY);
  /* w or UP = -1
     s or DOWN = 1
     else 0 */
  bars[0].direction = kt1.isPressed('w') ? -1 :
      (kt1.isPressed('s') ? 1 : 0);
  bars[1].direction = kt2.isPressed(UP) ? -1 :
      (kt2.isPressed(DOWN) ? 1 : 0);
  
  /* same as
  for (int i = 0; i < bars.length; i++) {
    bars[i].move();
    bars[i].draw();
  } */
  for (Bar b : bars) {
    b.move();
    b.draw();
  }
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
