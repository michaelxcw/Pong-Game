class Paddle {
  float x;
  color c;

  Paddle() {
    c = (225);
  }

  void display() {
    fill(c);
    if (mouseX+50 < width) {
      rectMode(CENTER);
      rect(mouseX, 530, 100, 100);
    } else {
      rectMode(CENTER);
      rect(450, 530, 100, 100);
    }
  }
}
