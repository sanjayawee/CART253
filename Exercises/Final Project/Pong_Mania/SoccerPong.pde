class SoccerPong {
  
  PImage ground,soccerBall;
  Ball ball;
  Paddle leftPaddle;
  Paddle rightPaddle;


  int PADDLE_INSET = 8;

  Players[] players = new Players[5];



  int playerSize=20;
  boolean returnToMenu = false;
  

  SoccerPong() {
    
    //load the background image
    ground= loadImage("ground.jpg");
    soccerBall= loadImage("soccerBall.png");
   
    
    leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'm');
    ball = new Ball(width/2, height/2);

    for (int i = 0; i < players.length; i++) {
      int x = floor(random(0, width/playerSize));
      int y = floor(random(0, height/playerSize));
      players[i] = new Players(x * playerSize, y * playerSize, playerSize);
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

    for (int i=0; i< players.length; i++) {
      players[i].update();
      players[i].display();
      ballHit(players [i]);
      ballHit2(players [i]);
    }
    
  }



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

    boolean insideLeft2 = (ball.x + ball.SIZE/2 > players.xx - players.size/2);
    boolean insideRight2 = (ball.x -ball.SIZE/2 < players.xx + players.size/2);
    boolean insideTop2 = (ball.y + ball.SIZE/2 > players.yy - players.size/2);
    boolean insideBottom2 = (ball.y - ball.SIZE/2 < players.yy + players.size/2);

    if (insideRight2  &&  insideLeft2 && insideTop2 && insideBottom2) {
       if (ball.vx < 0) {
        // Reset its position to align with the left side of the paddle
        ball.x = players.xx + players.size/2 + ball.SIZE/2;
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