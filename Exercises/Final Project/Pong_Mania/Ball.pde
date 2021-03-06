// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.


class Ball {

  /////////////// Properties ///////////////

 
  
  PImage soccerBall;
 // Default values for speed and size
  int SPEED = 5;
  int SIZE = 16;
 // veriable for count the score
  int count1;
  int count2;

  // The location of the ball
  float x;
  float y;
   // The velocity of the ball
  int vx;
  int vy;
  
  
  // The colour of the ball
  color ballColor;
  
  /////////////// Constructor ///////////////
   

  Ball(int tempX, float tempY, color tempColor, int tempSpeed) {
    x=tempX;
    y=tempY;
    SPEED=tempSpeed;
    vy=SPEED;
    vx=SPEED;
    ballColor=tempColor;

    soccerBall= loadImage("soccerBall.png");
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

  void resetScore() {
    count1=0;
    count2=0;
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
        file1.play(); // play sound
        count1++;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
        file1.play(); //play sound
        count2++;
      }
      // And make it bounce
      vx = -vx;
    }
  }

  void bulletHit(Bullet bullet) {
      
    boolean insideLeft = (x + SIZE/2 > bullet.x - bullet.size/2);
    boolean insideRight = (x - SIZE/2 < bullet.x + bullet.size/2);
    boolean insideTop = (y + SIZE/2 > bullet.y - bullet.size/2);
    boolean insideBottom = (y - SIZE/2 < bullet.y + bullet.size/2);
    

    if (insideLeft && insideRight && insideTop && insideBottom) {
     if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = bullet.x - bullet.size/2 - SIZE/2;
        
        vx = -vx;   
       
      }
      // And make it bounce   
    }
  }





  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    ellipseMode(CENTER);

    // Draw the ball
    ellipse(x, y, SIZE, SIZE);
    
    //if player select soccer pong, change the ball to
    if (pongmenu.soccerBall) {
      imageMode(CENTER);
      image(soccerBall, x, y);
    }
  }
}