//Soccer Pong
//
//

class SoccerPong {

  // Variables to store the main objects in the game (the paddles,ball,score,images)
  PImage ground, soccerBall;
  Ball ball;
  Paddle leftPaddle;
  Paddle rightPaddle;
  Score score;

  // The distance from the edge of the window a paddle should be
  int PADDLE_INSET = 8;
  // define an array of players
  Players[] players = new Players[5];


  //players size
  int playerSize=20;
  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;


  SoccerPong() {

    //load the background image
    ground= loadImage("ground.jpg");
    soccerBall= loadImage("soccerBall.png");

    // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'm');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2, color(255), 5);

    // Create the player at the random locations
    // give random X and Y parameters
    for (int i = 0; i < players.length; i++) {
      int x = floor(random(0, width/playerSize));
      int y = floor(random(0, height/playerSize));
      players[i] = new Players(x * playerSize, y * playerSize, playerSize);
    }

    // Create the score
    score = new Score();
  }

  //update()
  //
  //
  void update() {

    // Update the paddles,score and ball by calling their update methods
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
    display();
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    score.display();

    // Display and update the players by calling their update and display methods
    //
    for (int i=0; i< players.length; i++) {
      players[i].update();
      players[i].display();
      ballHit(players [i]);
      ballHit2(players [i]);
    }

    //if gameOver is true, show the result and rest the ball and paddle
    if (score.gameOver) {
      ball.reset();
      //ball.resetScore();
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
    //leftPaddle.reset();
    //rightPaddle.reset();
    returnToMenu = false;
  }


  void ballHit2(Players players) {

    boolean insideLeft1 = (ball.x + ball.SIZE/2 > players.x - players.size/2);
    boolean insideTop1 = (ball.y + ball.SIZE/2 > players.y - players.size/2);
    boolean insideBottom1 = (ball.y - ball.SIZE/2 < players.y + players.size/2);

    if (insideLeft1  &&  insideTop1 && insideBottom1) {
      if (ball.vx > 0) {
        // Reset its position to align with the left side of the paddle
        ball.x = players.x - players.size/2 - ball.SIZE/2;
        ball.vx = -ball.vx;
      }
      // And make it bounce
    }
  }

  void ballHit(Players players) { 


    boolean insideRight2 = (ball.x -ball.SIZE/2 < players.xx + players.size/2);
    boolean insideTop2 = (ball.y + ball.SIZE/2 > players.yy - players.size/2);
    boolean insideBottom2 = (ball.y - ball.SIZE/2 < players.yy + players.size/2);

    if (insideRight2   && insideTop2 && insideBottom2) {
      if (ball.vx < 0) {
        // Reset its position to align with the left side of the paddle
        ball.x = players.xx + players.size/2 + ball.SIZE/2;
        ball.vx = -ball.vx;
      }
    }
  }

  // Display  
  //  
  //
  void display() {


    // Add background image for the game   
    imageMode(CENTER);
    image(ground, width/2, height/2);
  }



  void keyPressed() {

    leftPaddle.keyPressed();
    rightPaddle.keyPressed();
  }


  void keyReleased() {
    leftPaddle.keyReleased();
    rightPaddle.keyReleased();
  }


  void mouseClicked() {
    if (mouseX > width/2-100-70 && mouseX < width/2-100+70 && mouseY < height/2+65+20 && mouseY > height/2+65-20) {
      score.gameOver = false;
      ball.reset();
      ball.resetScore();
      leftPaddle.reset();
      rightPaddle.reset();
    }
    if (mouseX > width/2+100-70 && mouseX < width/2+100+70 && mouseY < height/2+65+20 && mouseY > height/2+65-20)
    {
      returnToMenu = true;
    }
  }
}