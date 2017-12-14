class WesternPong {
  
  Paddle leftPaddle;
  Paddle rightPaddle;
  Ball ball;
  Score score;
  
  //create array list for bullets
  ArrayList <Bullet> bullet = new ArrayList <Bullet>();
  ArrayList <Bullet> bullet2 = new ArrayList <Bullet>();

  int initialTimeAdd ;
  int intervalAdd = 1000;

  int PADDLE_DIS = 8;
  
  boolean returnToMenu = false;

  int x;
  int y=height;
  int vx=2;

  WesternPong() {

    initialTimeAdd = millis();

    leftPaddle = new Paddle(PADDLE_DIS, height/2, 'q', 'z');
    rightPaddle = new Paddle(width-PADDLE_DIS, height/2, 'o', 'm');
    ball= new Ball(width/2, height/2, color(255), 5);
    score = new Score();
  }

  void update() {

    // Fill the background each frame so we have animation
    background(25, 48, 152);

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    score.update(ball);


    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

   
    if (ball.isOffScreen()) {
      ball.reset();
    }

  
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    display();
    score.display();
    
   
    if (millis() - initialTimeAdd > intervalAdd) {
      initialTimeAdd = millis();
      intervalAdd = int(random(100, 1000));
      
    
      bullet.add(new Bullet(x+30, y, color(255, 0, 0), random(3, 5)));
      bullet2.add(new Bullet(x-30, y, color(0, 0, 255), random(5, 8)));
    }


    for (Bullet s : bullet) {
      s.display();
      s. update();
      ball.bulletHit(s);
    }

    for (Bullet c : bullet2) {
      c.display();
      c. update();
      ball.bulletHit(c);
    }

    //shooter move

    x+=vx;
    if (x < 0  || x  > width) {
      vx = -vx;
    }
    
     if (score.gameOver) {
      ball.reset();
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
    //shooter
    rectMode(CENTER);
    rect(x, y, 100, 30);
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