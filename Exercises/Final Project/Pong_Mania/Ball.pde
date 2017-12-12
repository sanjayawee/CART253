class Ball {

  int SPEED = 5;
  int SIZE = 16;

  int x;
  int y;

  int vx;
  int vy;

  color ballColor = color(255);

  Ball(int tempX, int tempY) {
    x=tempX;
    y=tempY;
    vy=SPEED;
    vx=SPEED;
  }


  void update() {
    x+= vx;
    y+= vy;

    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      vy = -vy;
    }
  }

  void reset() {
    x = width/2;
    y = height/2;
  }

  boolean isOffScreen() {
    return(x + SIZE/2 < 0 || x- SIZE > width);
  }

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx;
    }
  }







  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    rectMode(CENTER);

    // Draw the ball
    rect(x, y, SIZE, SIZE);
  }
}