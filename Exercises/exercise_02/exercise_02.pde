//CHANGED
import processing.sound.*; //import sound library

    SoundFile file;
    String audioName = "se.wav"; //audio file 
    String path; //

color backgroundColor = color(0); //color of the background (black)

int numStatic = 1000; //number of statics that loops
int staticSizeMin = 1; //statics min size
int staticSizeMax = 3; //statics max size
color staticColor = color(195,215,235);// color of the statics

int paddleX;// paddle location x veriable
int paddleY;// paddle location y veriable
int paddleVX; // paddle velocity
int paddleSpeed = 10; //speed of the paddel movement
int paddleWidth = 128; // paddle width
int paddleHeight = 16; // paddle height
color paddleColor = color(255); // paddel color

int ballX; //ball location x
int ballY; //ball location y
int ballVX;// ball velocity x
int ballVY;// ball velocity y
int ballSpeed = 5; //ball speed
int ballSize = 16; //ball size
color ballColor = color(255,152,246);// color of the ball

int count=0; //CHANGED




//setup the canvus,ball and paddle
void setup() {
  size(640, 480);//canvus size
  setupPaddle();//paddel setup
  setupBall();//ball setup
  
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
}

//setup paddle
void setupPaddle() {
  paddleX = width/2; // paddle X location 320
  paddleY = height - paddleHeight; //padle Y location 480-16=464
  paddleVX = 0;
  
  
}

//setup ball
void setupBall() {
  ballX = width/2; // ball x locaiton 320
  ballY = height/2; // ball y location 240
  ballVX = ballSpeed; 
  ballVY = ballSpeed;
}

//draw
//
void draw() {
  background(backgroundColor); //background color

  drawStatic();// draw statics

  updatePaddle(); //draw ball accourding to the updates
  updateBall(); //draw ball accourding to the updates

  drawPaddle();//draw paddle
  drawBall();//draw ball
  drawScore();//CHANGED
}

//draw static
//
void drawStatic() {
  for (int i = 0; i < numStatic; i++) //
  {
   float x = random(0,width);//randomly choose the loaction
   float y = random(0,height);//
   float staticSize = random(staticSizeMin,staticSizeMax);//random static size
   
   fill(staticColor);
   //rect(x,y,staticSize,staticSize);
   ellipse(x,y,staticSize,staticSize); //CHANGED
   
  }
}
//
//
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);// paddle maximum lacations
}


//
//
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

//draw paddle
//
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  
 
}

//draw ball
//
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  //rect(ballX, ballY, ballSize, ballSize);
  ellipse(ballX, ballY, ballSize, ballSize); //CHANGED
}

//
//CHANGED
void drawScore(){
   textSize(32);
   fill(255);
   text("Score="+count, 50,50);
  
}


//If balloverlapspaddle function true.change the ballVY and ballY vlaues.
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    
    //CHANGED
     float r=round (random(255));
     float g=round (random(255));
     float b=round (random(255));
    ballColor = color(r,g,b); //change ball color randomly when ball hit the paddle
    
    file.play();//play the sound when ball hit the paddle
    count += 1;
  }
}

//
//checking,does ball overlaps the paddele.if yes return ture otherwise return false.
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2)
  {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

//
//
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}
//
//
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}
//
//
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}


//
//If left arrow key pressed assign minus value of paddlespeed to paddleVX
//If right arrow key pressed assign value of paddlespeed to paddleVX
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
    
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}


//If left arrow key released and paddleVX is less than 0,assign value of 0 to passleVX
//If right arrow key released and paddleVX is greater than 0,assign value of 0 to passleVX
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}