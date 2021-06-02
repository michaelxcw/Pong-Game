Ball ball;
Paddle paddle;
ArrayList<Decor> decors;
int score;
int level;
boolean done;

void setup() {
  size(500, 500);
  ball = new Ball(width/2, height/2, 5);
  ball.speedX = 5;
  ball.speedY = random(-5, 5);
  paddle = new Paddle();
  score = 0;
  level = 1;
  decors = new ArrayList();
}

void draw() {
  background(0);
  decors.add(new Decor(int(random(width)), int(random(height))));
  for (int i = 0; i < decors.size(); i++) {
    Decor decor = decors.get(i);
    decor.display();
    decor.move();
    if (decor.reachedBottom()) {
      decors.remove(decor);
    }
  }
  paddle.display();
  ball.move();
  ball.display();
  if (ball.x > width) {
    ball.speedX = -ball.speedX;
    if (level > 1 && !done) {
      ball.speedX *= 1.2;
      ball.speedY *= 1.2;
      done = true;
    }
  }

  if (ball.x < 0) {
    ball.speedX = -ball.speedX;
    if (level > 1 && !done) {
      ball.speedX *= 1.2;
      ball.speedY *= 1.2;
      done = true;
    }
  }

  if (ball.y > height) {
    ball.x = width/2;
    ball.y = height/2;
    if (level < 2) {
      ball.speedY = random(-5, 5);
    } else {
      if (level > 1 && !done) {
        ball.speedX *= 1.2;
        ball.speedY *= 1.2;
        done = true;
      }
    }
    ball.health -=1;
  }

  if (ball.y < 0) {
    ball.speedY = -ball.speedY;
    if (level > 1 && !done) {
      ball.speedX *= 1.2;
      ball.speedY *= 1.2;
      done = true;
    }
  }

  if (ball.x < mouseX+50 && ball.x > mouseX-50 && ball.y > 450 && ball.y < 452) {
    ball.speedY = -ball.speedY;
    if (level > 1 && !done) {
      ball.speedX *= 1.2;
      ball.speedY *= 1.2;
      done = true;
    }
    score += 1;
  }
  
  if (score > 5 && level < 2) {
    level += 1;
  }

  if (score > 10) {
    fill(0);
    rect(250, 250, 500, 500);
    fill(255);
    text("You Win!", width/2, height/2);
  }

  if (ball.health < 1) {
    fill(0);
    rect(250, 250, 500, 500);
    fill(255);
    text("You Lose LOL!", width/2, height/2);
  }
  infoPanel();
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, 0, 500, 50);
  fill(255, 128);
  text("Health:" + ball.health, 20, 20);
  text("Score:" + score, 100, 20);
  text("Level:" + level, 180, 20);
}
