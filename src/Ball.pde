class Ball { 
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
  float health;

  Ball(float x, float y, float health) {
    this.x = x;
    this.y = y;
    this.health = health;
    speedX = 0;
    speedY = 0;
    c = (225);
  }

  void move() {
    y = y + speedY;
    x = x + speedX;
  }

  void display() {
    fill(c);
    ellipse(x, y, 50, 50);
  }
}
