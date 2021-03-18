class Snake {

  // Directions
  public static final int
      up = -1,
      down = 1,
      left = -2,
      right = 2;
  
  final LinkedList<Point> body;
  final Dimension mapSize, cellSize;
  final Point mapPosition, foodPosition;
  int direction;
  boolean alive;
  
  Snake(Point mapPosition, Dimension gridSize, Dimension mapSize) {
    this.body = new LinkedList<Point>();
    body.addFirst(new Point(gridSize.w / 2 - 1, gridSize.h / 2));
    for(int i = 0; i < 2; i++) {
      body.addLast(new Point(body.getLast().x + 1, body.getLast().y));
    }
    this.mapPosition = mapPosition;
    this.mapSize = gridSize;
    this.cellSize = new Dimension(mapSize.w / (gridSize.w + 1), mapSize.h / (gridSize.h + 1));
    direction = right;
    foodPosition = new Point(0, 0);
    putFood();
    alive = true;
  }
  
  void draw() {
    noStroke();
    rectMode(CENTER);
    float halfMapW = mapSize.w / 2, halfMapH = mapSize.h / 2;
    // Draw food
    fill(0xffff0000);
    rect(mapPosition.x + cellSize.w * (foodPosition.x - halfMapW), 
          mapPosition.y + cellSize.h * (foodPosition.y - halfMapH),
          cellSize.w, cellSize.h);
    // Draw body
    fill(255);
    for(Point p : body) {
      rect(mapPosition.x + cellSize.w * (p.x - halfMapW), 
          mapPosition.y + cellSize.h * (p.y - halfMapH),
          cellSize.w, cellSize.h);
    }
  }
  
  void move() {
    if (!alive) return;
    Point head = body.getLast(), tail = body.getFirst();
    if (head.equals(foodPosition)) {
      tail = tail.copy();
      body.addFirst(tail);
      putFood();
    }
    tail.x = head.x;
    tail.y = head.y;
    if (direction == left) tail.x -= 1;
    else if (direction == right) tail.x += 1;
    else tail.y += direction;
    body.removeFirst();
    body.addLast(tail);
    if (colliding()) {
      alive = false;
    }
  }
  
  boolean colliding() {
    Point head = body.getLast();
    if (head.x < 0 || head.y < 0) return true;
    if (head.x > mapSize.w || head.y > mapSize.h) return true;
    return isBody(head);
  }
  
  boolean isBody(Point p) {
    for (Point i : body) {
      if (i.equals(p) && i != body.getLast()) return true;
    }
    return false;
  }
  
  void putFood() {
    foodPosition.x = (int) random(mapSize.w);
    foodPosition.y = (int) random(mapSize.h);
    while (foodPosition.equals(body.getLast()) || isBody(foodPosition)) {
      foodPosition.x = (int) (++foodPosition.x % mapSize.w);
      if (foodPosition.x == 0) {
        foodPosition.y = (int) (++foodPosition.y % mapSize.h);
      }
    }
  }
  
  boolean setDirection(int direction) {
    if (direction == -this.direction) return false;
    if (direction == up || direction == down
        || direction == left || direction == right) {
      this.direction = direction;
      return true;
    }
    return false;
  }
  
}
