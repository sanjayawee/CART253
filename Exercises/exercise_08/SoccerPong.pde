//Soccer Pong Class
//
//

class SoccerPong {

  Ball ball; //Declare a ball object
  Paddle leftPaddle; //Declare a leftPaddle object
  Paddle rightPaddle; //Declare a rightPaddle object


  int PADDLE_INSET = 8;
  // An array storing all the team1
  Team1[] team1 = new Team1[5];
  // An array storing all the team2
  Team2[] team2 = new Team2[5];


  int playerSize=20; //players size

  boolean returnToMenu = false;

  color backgroundColor = color(87, 157, 57);



  SoccerPong() {

    leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'm');
    ball = new Ball(width/2, height/2);
    
  //create X and Y random locations for all team1 players
  //Create a new object into the variable ball
  //pass the parameters to Team1() constructor
  //
    for (int i = 0; i < team1.length; i++) {
      int x = floor(random(0, width/playerSize));
      int y = floor(random(0, height/playerSize));
      team1[i] = new Team1(x * playerSize, y * playerSize, playerSize);
    }

  //create X and Y random locations for all team2 players
  //Create a new object into the variable ball
  //pass the parameters to Team2() constructor
  //
    for (int i = 0; i < team2.length; i++) {
      int x = floor(random(0, width/playerSize));
      int y = floor(random(0, height/playerSize));
      team2[i] = new Team2(x * playerSize, y * playerSize, playerSize);
    }
  }

  void update() {
  // Call display,ball,paddles functions
    display();
    leftPaddle.update();
    rightPaddle.update();
    ball.update();

    // frameRate(20);
    //
    //Call ball collide functions
    //
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);


    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }


    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    
    //
    //loop every team1 players one by one
    //and update and display
    //and call the ballHit function
    //
    for (int i=0; i< team1.length; i++) {
      team1[i].update();
      team1[i].display();
      ballHit(team1 [i]);
    }
    //
    //loop every team2 players one by one
    //and update and display
    //and call the ballHit function
    //
    for (int i=0; i< team1.length; i++) {
      team2[i].update();
      team2[i].display();
      ballHit(team2 [i]);
    }
  }

  // reset()
  //
  //

  void reset() {
    ball.reset();
    leftPaddle.reset();
    rightPaddle.reset();
    returnToMenu = false;
  }

  // ballHit(Team1 team1)
  //
  // Calculate possible overlaps with the team1 players side by side
  //
  void ballHit(Team1 team1) {

    boolean insideLeft1 = (ball.x + ball.SIZE/2 > team1.x - team1.size/2);
    // boolean insideRight = (ball.x -ball.SIZE/2 < team1.x + team1.size/2);
    boolean insideTop1 = (ball.y + ball.SIZE/2 > team1.y - team1.size/2);
    boolean insideBottom1 = (ball.y - ball.SIZE/2 < team1.y + team1.size/2);
    //Check ball overlaps with the players
    if (insideLeft1  &&  insideTop1 && insideBottom1) {
      if (ball.vx > 0) {
        // Reset its position to align with the left side of the player
        ball.x = team1.x - team1.size/2 - ball.SIZE/2;
        ball.vx = -ball.vx; //And bounce to the left side
      }
    }
  }

  //ballHit(Team2 team2)
  //
  // Calculate possible overlaps with the team1 players side by side
  //
  void ballHit(Team2 team2) {

    boolean insideLeft2 = (ball.x + ball.SIZE/2 > team2.x - team2.size/2);
    boolean insideRight2 = (ball.x -ball.SIZE/2 < team2.x + team2.size/2);
    boolean insideTop2 = (ball.y + ball.SIZE/2 > team2.y - team2.size/2);
    boolean insideBottom2 = (ball.y - ball.SIZE/2 < team2.y + team2.size/2);

    if (insideRight2  &&  insideLeft2 && insideTop2 && insideBottom2) {
      if (ball.vx < 0) {
        // Reset its position to align with the left side of the player
        ball.x = team2.x + team2.size/2 + ball.SIZE/2;
        ball.vx = -ball.vx; //And bounce to the right side
      }
    }
  }

  //display()
  //
  //draw backgorund

  void display() {

    background(backgroundColor);
  }

  // keyPressed()
  //
  //
  void keyPressed() {

    leftPaddle.keyPressed(); // call the left paddle keypressed function
    rightPaddle.keyPressed(); // call the right paddle keypressed function

  //

    if (key == 'b' || key == 'B')
    {
      returnToMenu = true;
    }
  }
  // keyReleased()
  //
  //
  void keyReleased() {
    leftPaddle.keyReleased(); // call the right paddle keyReleased function
    rightPaddle.keyReleased(); // call the right paddle keyReleased function
  }
}