//Future Pong
//
//In this pong version player can control left paddel using mouse
//Right paddle move automatically
//The Right paddle doesn't miss the ball
//
class FuturePong {

  // Variables to store the main objects in the game (the paddles and ball)
  Ball ball;
  Paddle leftPaddle;
  Paddle rightPaddle;
  Score score;

  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;
  // A boolean to check player click the Play button
  boolean checkPlay = true;
  // The distance from the edge of the window a paddle should be
  int PADDLE_INSET = 8;



  FuturePong() {
    // Create paddles on both side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'm');
    // Create a ball,give color and speed
    ball = new Ball(width/2, height/2, color(255), 5);
    // Create score
    score = new Score();
  }

  // Update()
  //
  //
  void update() {
    background(0);

    // Update the paddles,score and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    // Calling autoPaddle funtion
    rightPaddle.autoPaddle(ball);
    // Calling mouseControl function
    leftPaddle.mouseControl();
    ball.update();
    score.update(ball);

    // display
    if (checkPlay) {
      display();
    }

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }

    // Display the paddles,score and the ball
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    score.display();

    //if gameOver is true, show the result and rest the ball and paddle
    if (score.gameOver) {
      ball.reset();
      leftPaddle.reset();
      rightPaddle.reset();
      score.overDisplay();
    }
  }

  // reset()
  //
  // Resets the game by resetting the ball and paddles and setting
  // returnToMenu to false
  void reset() {
    ball.reset();
    leftPaddle.reset();
    rightPaddle.reset();
    returnToMenu = false;
  }

  //display()
  //
  //
  void display() {
    fill(255);
    rect(width/2, height/2, 200, 100, 7);

    rect(width/2, height/2+20, 100, 50, 7);
    moseHandel();
    
    textSize(25);
    fill(0);
    text("Play",width/2, height/2+25);
     textSize(20);
    text("Use Mouse",width/2, height/2-20);
  }


  // keyPressed()
  //
  // The paddles need to know if they should move based on a keypress
  // so when the keypress is detected in the main program we need to
  // tell the paddles 

  void keyPressed() {

    leftPaddle.keyPressed();
    rightPaddle.keyPressed();
  }


  void keyReleased() {
    leftPaddle.keyReleased();
    rightPaddle.keyReleased();
  }

  // mouseClicked()
  //
  //Clicking in this areas...

  void mouseClicked() {

    //reset the ball,score,paddles and restart the game  
    if (mouseX > width/2-100-70 && mouseX < width/2-100+70 && mouseY < height/2+65+20 && mouseY > height/2+65-20) {
      score.gameOver = false;
      ball.reset();
      ball.resetScore();
      leftPaddle.reset();
      rightPaddle.reset();
    }

    //return to pong menu 
    if (mouseX > width/2+100-70 && mouseX < width/2+100+70 && mouseY < height/2+65+20 && mouseY > height/2+65-20)
    {
      returnToMenu = true;
    }
  }

  //mouseReleased()
  //
  //
  void mouseReleased() {
    // Call both paddles' mouseReleased methods
    leftPaddle.mouseReleased();
    rightPaddle.mouseReleased();

    //checkPlay 
    if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY < height/2+20+25 && mouseY > height/2+20-25) {
      checkPlay=false;
    }
  }
  
  //mouseHandle()
  //
  //
  void moseHandel() {
    if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY < height/2+20+25 && mouseY > height/2+20-25) {
      fill(255);
      rect(width/2, height/2+20, 100, 50, 7);
    } else {
      fill(#C1BFC0);
      rect(width/2, height/2+20, 105, 55, 7);
      
    }
  }
}