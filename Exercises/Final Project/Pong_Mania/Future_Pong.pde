class FuturePong {


  Ball ball;
  Paddle leftPaddle;
  Paddle rightPaddle;
  Score score;


  boolean returnToMenu = false;
  boolean checkPlay = true;

  int PADDLE_INSET = 8;



  FuturePong() {

    leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'm');
    ball = new Ball(width/2, height/2, color(255), 5);

    score = new Score();
  }

  void update() {
    background(0);


    leftPaddle.update();
    rightPaddle.update();
    rightPaddle.autoPaddle(ball);
    leftPaddle.mouseControl();
    ball.update();
    score.update(ball);

    if (checkPlay) {
      display();
    }


    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }


    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    score.display();

    if (score.gameOver) {
      ball.reset();
      //ball.resetScore();
      leftPaddle.reset();
      rightPaddle.reset();
      score.overDisplay();
    }
  }

  void reset() {
    ball.reset();
    leftPaddle.reset();
    rightPaddle.reset();
    returnToMenu = false;
  }

  void display() {
    fill(255);
    rect(width/2, height/2, 200, 100);
  }


  void keyPressed() {

    leftPaddle.keyPressed();
    rightPaddle.keyPressed();

    if (key == 'b' || key == 'B') {
      returnToMenu = true;
    }
  }


  void keyReleased() {
    leftPaddle.keyReleased();
    rightPaddle.keyReleased();
  }

  void mouseClicked() {
  }


  void mouseReleased() {
    leftPaddle.mouseReleased();
    rightPaddle.mouseReleased();

    if (mouseX > width/2-100 && mouseX < width/2+100 && mouseY < height/2+50 && mouseY > height/2-50) {

      checkPlay=false;
    }
  }
}