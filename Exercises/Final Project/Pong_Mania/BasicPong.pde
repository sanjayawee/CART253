// BasicPong
//
//
// We now use the constructor BasicPong() to set up the game, instead of
// setup(), and we use update() to update the game, instead of draw().
//
class BasicPong {

  // Variables to store the main objects in the game (the paddles and ball)
  Paddle leftPaddle;
  Paddle rightPaddle;
  Ball ball;
  Score score;

  // The distance from the edge of the window a paddle should be
  int PADDLE_INSET = 8;

  // The background colour during play (black)
  color backgroundColor = color(0);

  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;

  // BasicPong()
  //
  // Creates the paddles and ball

  BasicPong() {
    // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'm');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2, color(255), 5);

    score = new Score();
  }

  // update()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.

  void update() {

    // Fill the background each frame so we have animation
    background(backgroundColor);

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    score.update(ball);

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

  // keyPressed()
  //
  // The paddles need to know if they should move based on a keypress
  // so when the keypress is detected in the main program we need to
  // tell the paddles

  void keyPressed() {
    // Just call both paddles' own keyPressed methods
    leftPaddle.keyPressed();
    rightPaddle.keyPressed();
  }

  // keyReleased()
  //
  // As for keyPressed, except for released!

  void keyReleased() {
  // Call both paddles' keyReleased methods
    leftPaddle.keyReleased();
    rightPaddle.keyReleased();
  }

  // mouseClicked()
  //
  //Clicking this areas...
  void mouseClicked() {
    
    if (mouseX > width/2-100-70 && mouseX < width/2-100+70 && mouseY < height/2+65+20 && mouseY > height/2+65-20) {
  //reset the ball,score,paddles      
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
}