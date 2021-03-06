class Ball extends BaseObject {
  
  float radious;
  
  Ball(float x, float y) {
    // Calls its parent (BaseObject) and give it each attribute
    super(SCREEN_WIDTH / 80, SCREEN_WIDTH / 80, x, y, SCREEN_WIDTH / 150, 0);
    restitution = 1;
    setVelocity(maxSpeed, random(maxSpeed / 2) - maxSpeed / 4);  
  }
  
  void draw() {
    fill(0xffffffff);
    ellipseMode(CENTER);
    noStroke();
    circle(x, y, radious * 2);
  }
  
  void setSize(float radious) {
    setSize(radious, radious);
  }
  
  @Override
  void setSize(float width, float height) {
    float radious = (width + height) / 2;
    super.setSize(radious, radious);
    this.radious = radious;
  }
  
  void bounce(Bar b) {
    velocityX *= -restitution;
    x = b.x + (b.width / 2 + radious) * Math.signum(velocityX);
    velocityY += b.velocityY * restitution * b.restitution / 2;
  }

}
