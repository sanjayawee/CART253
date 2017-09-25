color backgroundColor = color(0); //color of the background (black)

int numStatic = 1000; //number of statics that loops
int staticSizeMin = 1; //
int staticSizeMax = 3; //
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
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255,152,246);





void setup() {
  size(640, 480);
  
  setupPaddle();
  setupBall();
}

void setupPaddle() {
  paddleX = width/2; // paddle X location 320
  paddleY = height - paddleHeight; //padle Y location 480-16=464
  paddleVX = 0;
  
  
}

void setupBall() {
  ballX = width/2; // ball x locaiton 320
  ballY = height/2; // ball y location 240
  ballVX = ballSpeed; 
  ballVY = ballSpeed;
}

void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}

void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
   //ellipse(x,y,staticSize,staticSize);
  }
}

void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  println(paddleX,paddleY);
 
}



void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  //rect(ballX, ballY, ballSize, ballSize);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
     float r=round (random(255));
     float g=round (random(255));
     float b=round (random(255));
    ballColor = color(r,g,b);
    
  }
}

boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2)
  {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

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

void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}