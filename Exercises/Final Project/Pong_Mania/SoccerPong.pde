class SoccerPong {
  
  PImage ground,soccerBall;
  Ball ball;
  Paddle leftPaddle;
  Paddle rightPaddle;


  int PADDLE_INSET = 8;

  Team1[] team1 = new Team1[5];
  Team2[] team2 = new Team2[5];


  int playerSize=20;
  boolean returnToMenu = false;
  color backgroundColor = color(87, 157, 57);

  SoccerPong() {
    
    //load the background image
    ground= loadImage("ground.jpg");
    soccerBall= loadImage("soccerBall.png");
   
    
    leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'm');
    ball = new Ball(width/2, height/2);

    for (int i = 0; i < team1.length; i++) {
      int x = floor(random(0, width/playerSize));
      int y = floor(random(0, height/playerSize));
      team1[i] = new Team1(x * playerSize, y * playerSize, playerSize);
    }
    
    for (int i = 0; i < team2.length; i++) {
      int x = floor(random(0, width/playerSize));
      int y = floor(random(0, height/playerSize));
      team2[i] = new Team2(x * playerSize, y * playerSize, playerSize);
    }
    
  }

  void update() {
    
    display();
    leftPaddle.update();
    rightPaddle.update();
    ball.update();

    // frameRate(20);

    ball.collide(leftPaddle);
    ball.collide(rightPaddle);


    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }


    leftPaddle.display();
    rightPaddle.display();
    ball.display();

    for (int i=0; i< team1.length; i++) {
      team1[i].update();
      team1[i].display();
      ballHit(team1 [i]);
    }
    
    for (int i=0; i< team1.length; i++) {
      team2[i].update();
      team2[i].display();
      ballHit(team2 [i]);
    }
  }



  void reset() {
    ball.reset();
    // leftPaddle.reset();
    // rightPaddle.reset();
    returnToMenu = false;
  }


  void ballHit(Team1 team1) {
    
    
    

    boolean insideLeft1 = (ball.x + ball.SIZE/2 > team1.x - team1.size/2);
   // boolean insideRight = (ball.x -ball.SIZE/2 < team1.x + team1.size/2);
    boolean insideTop1 = (ball.y + ball.SIZE/2 > team1.y - team1.size/2);
    boolean insideBottom1 = (ball.y - ball.SIZE/2 < team1.y + team1.size/2);

    if (insideLeft1  &&  insideTop1 && insideBottom1) {



     if (ball.vx > 0) {
        // Reset its position to align with the left side of the paddle
        ball.x = team1.x - team1.size/2 - ball.SIZE/2;
         ball.vx = -ball.vx;
        
      }
      // And make it bounce  
     
    }
  }
  
  void ballHit(Team2 team2) {
    
    
    

    boolean insideLeft2 = (ball.x + ball.SIZE/2 > team2.x - team2.size/2);
    boolean insideRight2 = (ball.x -ball.SIZE/2 < team2.x + team2.size/2);
    boolean insideTop2 = (ball.y + ball.SIZE/2 > team2.y - team2.size/2);
    boolean insideBottom2 = (ball.y - ball.SIZE/2 < team2.y + team2.size/2);

    if (insideRight2  &&  insideLeft2 && insideTop2 && insideBottom2) {
       if (ball.vx < 0) {
        // Reset its position to align with the left side of the paddle
        ball.x = team2.x + team2.size/2 + ball.SIZE/2;
         ball.vx = -ball.vx;
         
      }
    }
      // And make it bounce  
     
    
  }
  
// Display  
//  
  void display(){
    
   
// Add background image for the game   
   imageMode(CENTER);
   image(ground,width/2,height/2);
   
  
   
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
}