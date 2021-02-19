class Bar {

  float x, y; // position
  float w, h; // size
  float vY, maxSpeed, acel; // y-velocity and acceleration
  int direction; // can take -1, 0 and 1
  float limitY; // movement
  
  Bar(float x, float y, float w, float h, float speed, float acel) {
    // vars
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.maxSpeed = speed;
    this.acel = acel;
    // constants
    this.vY = 0;
    this.direction = 0;
  }
  
  void setLimitY(float lY) {
    this.limitY = lY - h / 2;
  }
  
  void move() {
    println(direction);
    if (direction == 0) { // it's not moving
      if (vY >= 0) { // it's going up
        vY = Math.max(vY - acel, 0); // decrease +y speed
      }
      else { // it's going down
        vY = Math.min(vY + acel, 0); // decrease -y speed
      }
    } else { // it's moving
      if (direction == -1) { // it's going up
        vY = Math.max(vY - acel, -maxSpeed);
      }
      else { // it's going down
        vY = Math.min(vY + acel, maxSpeed);
      }
    }
    // bounce
    float expectedY = y + vY;
    y = Math.min(Math.max(y + vY, -limitY), limitY);
    if (expectedY != y) vY = 0; // try vY *= -0.5 :)
  }
  
  void draw() {
    rectMode(CENTER);
    /*
      It goes from 0 to f (0, 1, ... 8, 9, a, b, ... e, f)
      1st and 2nd (alpha)
      3rd and 4th (red)
      5th and 6th (green)
      7th and 8th (blue)
    */
    fill(0xffffffff); // white
    rect(x, y, w, h);
  }
  
}
