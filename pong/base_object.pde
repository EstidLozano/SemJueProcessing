abstract class BaseObject {
  
  // Directions
  static final int
      none = 0,
      up = 1,
      down = 2,
      left = 3,
      right = 4;
  
  float width, height;
  float x, y, limitX, limitY; // Position
  float velocityX, velocityY, maxSpeed; // Velocity
  float accelerationX, accelerationY, acceleration; // Acceleration
  float restitution; // Restitution coefficient
  
  // Full constructor
  BaseObject(float width, float height, float x, float y, float maxSpeed, float acceleration) {
    // Given
    setSize(width, height);
    setPosition(x, y);
    this.maxSpeed = maxSpeed;
    this.acceleration = acceleration;
    // Default
    setVelocity(0, 0);
    setAcceleration(0, 0);
    this.restitution = 0;
  }
  
  // Default constructor
  BaseObject() {
    // Call the full constructor
    this(0, 0, 0, 0, 0, 0);
  }
  
  /* Do not implement draw
  Childs (classes which extends BaseObject) will do it */
  abstract void draw();
  
  void move() {
    // Change velocity from acceleration
    if (accelerationX == none) { // Decelerate
      if (abs(velocityX) - acceleration < 0) velocityX = 0;
      else velocityX -= Math.signum(velocityX) * acceleration;
    } else { // Accelerate
      velocityX = Math.min(Math.max(velocityX + accelerationX, -maxSpeed), maxSpeed);
    }
    
    if (accelerationY == none) {  // Decelerate
      if (abs(velocityY) - acceleration < 0) velocityY = 0;
      else velocityY -= Math.signum(velocityY) * acceleration;
    } else { // Accelerate
      velocityY = Math.min(Math.max(velocityY + accelerationY, -maxSpeed), maxSpeed);
    }
    // Change position from velocity
    float expectedX = x + velocityX;
    float expectedY = y + velocityY;
    x = Math.min(Math.max(expectedX, -limitX), limitX);
    y = Math.min(Math.max(expectedY, -limitY), limitY);
    // Bounce if goes outside
    if (x != expectedX) velocityX *= -restitution;
    if (y != expectedY) velocityY *= -restitution;
  }
  
  void setSize(float width, float height) {
    this.width = width;
    this.height = height;
    this.limitX = (SCREEN_WIDTH - width) / 2;
    this.limitY = (SCREEN_HEIGHT - height) / 2;
  }
  
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void setVelocity(float velocityX, float velocityY){
    this.velocityX = velocityX;
    this.velocityY = velocityY;
  }
  
  void setAcceleration(float accelerationX, float accelerationY){
    this.accelerationX = accelerationX;
    this.accelerationY = accelerationY;
  }
  
  void setXDirection(int direction) {
    if (direction == none) this.accelerationX = 0;
    else if (direction == left) this.accelerationX = -acceleration;
    else if (direction == right) this.accelerationX = acceleration;
  }
  
  void setYDirection(int direction) {
    if (direction == none) this.accelerationY = 0;
    else if (direction == up) this.accelerationY = -acceleration;
    else if (direction == down) this.accelerationY = acceleration;
  }
  
  void setDirection(int directionX, int directionY) {
    setXDirection(directionX);
    setYDirection(directionY);
  }
  
}
