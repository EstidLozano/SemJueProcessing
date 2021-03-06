class Bar extends BaseObject {
  
  int points;
  
  Bar(float x, float y) {
    // Calls its parent (BaseObject) and give it each attribute
    super(SCREEN_WIDTH / 50, SCREEN_WIDTH / 10, x, y, SCREEN_WIDTH / 80, SCREEN_WIDTH / 1000);
    restitution = 0.4;
    points = 0;
  }
  
  void draw() {
    /*
      It goes from 0 to f (0, 1, ... 8, 9, a, b, ... e, f)
      1st and 2nd (alpha)
      3rd and 4th (red)
      5th and 6th (green)
      7th and 8th (blue)
    */
    fill(0xffffffff); // white
    rectMode(CENTER);
    noStroke();
    rect(x, y, width, height);
  }
  
  boolean colliding(Ball b) {
    // Check collision with the given bar
    float dx = Math.abs(b.x - x) - width / 2;
    float dy = Math.abs(b.y - y) - height / 2;
    if (dx > b.radious || dy > b.radious) return false;
    if (dx <= 0 || dy <= 0) return true;
    return dx * dx + dy * dy <= b.radious * b.radious;
  }
  
  boolean goal() {
    return ++points == 10;
  }
  
}
