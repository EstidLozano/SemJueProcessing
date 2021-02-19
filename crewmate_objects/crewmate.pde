class Crewmate {

  float x, y, size, speed;
  PImage img;

  float limitX, limitY;
  
  /*
    [0] = up
    [1] = down
    [2] = left
    [3] = right
  */
  boolean[] directions;
  
  Crewmate (float x, float y, float size, float speed, PImage img) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;
    this.img = img;
    
    directions = new boolean[4];
  }
  
  void move() {
    float dx = directions[2] ? -speed : (directions[3] ? speed : 0),
          dy = directions[0] ? -speed : (directions[1] ? speed : 0);
    x += dx;
    y += dy;
    
    x = Math.min(Math.max(x, -limitX), limitX);
    y = Math.min(Math.max(y, -limitY), limitY);
  }
  
  void setLimits(float limitX, float limitY) {
    this.limitX = limitX - size / 2;
    this.limitY = limitY - size / 2;
  }
  
  void render() {
    image(img, x, y, size, size);
  }
  
}
