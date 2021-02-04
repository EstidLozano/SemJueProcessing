
Dimension screenSize = new Dimension(720, 480);

final LinkedList<CharBox> chars = new LinkedList<CharBox>();
int highScore, score, size = 40;
float speed;
boolean play;

void setup() {
  size(720, 480);
  init();
}

void init() {
  chars.removeAll();
  score = 0;
  setSpeed();
  createChar();
  play = true;
}

void draw() {
  if (!play) return;
  update();
  background(0);
  for(CharBox box : chars) {
    box.render();
  }
  fill(255, 255, 255);
  textSize(15);
  textAlign(LEFT, TOP);
  text("high score: " + highScore, 5, 5);
  text("score: " + score, 5, 25);
}

void update() {
  for(CharBox box : chars) {
    box.move();
    if (box.y > screenSize.h - size) {
      gameOver();
    }
  }
  if (chars.getLast().y > size * 2) {
    createChar();
  }
}

void createChar() {
  int x = (int) (Math.random() * (screenSize.w - size));
  char value = (char) (Math.random() * ('z' - 'a') + 'a');
  chars.addLast(new CharBox(x, - size, value, size, speed));
}

void destroyChar(char value) {
  CharBox box = chars.getFirst();
  if (box.value == value) {
    if (chars.getSize() == 1) createChar(); 
    chars.removeFirst();
    score++;
    setSpeed();
  }
}

void setSpeed() {
  speed = (float) Math.sqrt(Math.log(score + 10));
  println(speed);
}

void gameOver() {
  play = false;
  if (score > highScore) highScore = score;
}

void keyPressed() {
  if (play) {
    if (key != CODED) destroyChar(key);
  } else if (key == 10) init();
  
}
