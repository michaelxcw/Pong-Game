class Decor {

  int x, y, speed, dia;
  color c;

  Decor(int x, int y) {
    this.x = x;
    this.y = y;
    c = color(255,255,0);
    speed = int(1);
    dia = int(random(4,10));
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c);
    rect(x, y, dia, dia);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y> height+50) {
      return true;
    } else {
      return false;
    }
  }
}
