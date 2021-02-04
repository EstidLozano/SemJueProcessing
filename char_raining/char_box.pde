class CharBox {

  public float x, y, speed;
  private float size, fontSize;
  public char value;
  
  CharBox(float x, float y, char value, float size, float speed) {
    this.x = x;
    this.y = y;
    this.value = value;
    
    setSize(size);
    this.speed = speed;
  }
  
  public void render() {
    fill(200);
    rect(x, y, size, size);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    fill(0);
    text(value, x + fontSize, y + fontSize);
  }
  
  public void move() {
    this.y += speed;
  }
  
  public void setSize(float val) {
    size = val;
    fontSize = size / 2;
  }
  
}
