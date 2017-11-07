//Balls
//
// A class defining the behavior of a single Ball


class Ball {

  //Variables for the position,size,movespeed,and noise time
  int ballX;
  int ballY;
  float ballSize;
  // float theta = 0.0;
  float easing =0.05;
  int ballSpeed =15;
  //give the Independent value to the ballT & ballTT
  float ballT = random(0, 100);
  float ballTT = random(0, 100);
  float ballVX;
  float ballVY;

// Set up the Balls with the location and size
//add arguments to the constructor
  Ball(int tempx, int tempy, float tempSize) {


    ballX=tempx;
    ballY=tempy;
    ballSize=tempSize;
  }
  
//Balls Update
//
  void update() {

    //add noice function to the Ball's velocity
    //Ball moves smoothly and randomly
    ballVX = ballSpeed * (noise(ballT)*2 -1 );
    ballVY = ballSpeed * (noise(ballTT)*2-1);
   
    ballSize = random(2,15);//create random size balls 
  

    ballX+=ballVX;
    ballY+=ballVY;


//prevent the Balls to go off the screen
    if (ballX < 0) {
      ballX += width;
    } else if (ballX >= width) {
      ballX -= width;
    }
    if (ballY < 0) {
      ballY += height;
    } else if (ballY >= height) {
      ballY -= height;
    }
    ballT += 0.01;
    ballTT += 0.01;

    mouseFollow();//call the mouse follow function
   // collision();//call the collision function
  }

  //display Ball
  //
  void display() {
   
    rectMode(CENTER);
    fill(255,0,0);
    ellipse(ballX,ballY,ballSize,ballSize);
  }

  //
  //mouseFollow function
  //
 void mouseFollow() {

     
      //gather all the Ball in to the 
      float targetX = followX ;
      //create new postion for Ball
      float dx = targetX - ballX;
      //keep distance from the mouse pointer
      ballX += dx * easing ;

      float targetY = followY;
      float dy = targetY - ballY;
      ballY += dy * easing;

     

    
       
 }    

  //Calculate the area of the traking point
 /* void collision() {
    boolean leftSideX = (ballX > followX-60 );
    boolean rightSideX = (ballX  < followX+60);
    boolean topY = (ballY > followY-60);
    boolean bottomY = (ballY < followY+60);

    //check if the Balls enter the predator area
    if (leftSideX && rightSideX && topY && bottomY) {
      //And Balls move opposite side or keep away from predator
      if(followX<ballX && followY<ballY){
         ballX=ballX+5;
         ballY=ballY+5;
      }
      else if(followX<ballX && followY<ballY){
         ballX=ballX+-5;
         ballY=ballY-5;
      }
       else if(followX>ballX && followY<ballY){
         ballX=ballX+-5;
         ballY=ballY-5;
      }
        else if(followX<ballX && followY>ballY){
         ballX=ballX+-5;
         ballY=ballY-5;
      }
    }
  }*/
}