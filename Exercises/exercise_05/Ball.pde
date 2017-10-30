class Ball{

  int ballx;
  int bally;
  int ballsize;
  float theta = 0.0;
  float easing =0.05;
  int speed =20;
  float tx = random(0,100);
  float ty = random(0,100);
  
  Ball(int tempx,int tempy,int tempSize){
  
  
    ballx=tempx;
    bally=tempy;
    ballsize=tempSize;
  
  }
  
  void update(){
  
  float vx = speed * (noise(tx) * 2 - 1);
  float vy = speed * (noise(ty) * 2 - 1);
    
  ballx+=vx;
  bally+=vy;
  
   if (ballx < 0) {
      ballx += width;
    }
    else if (ballx >= width) {
      ballx -= width;
    }
    if (bally < 0) {
      bally += height;
    }
    else if (bally >= height) {
      bally -= height;
    }
     tx += 0.01;
  ty += 0.01;
   mouseFallow();
  }

void display(){
  
 //translate(width/2,height/2);
  //translate(250,200);
  //rotate(theta);
  rectMode(CENTER);

  theta += 0.01;
  //rotate(theta1);
  rect(ballx,bally,ballsize,ballsize);
  
  
}

void mouseFallow(){

  float targetX = mouseX;
  float dx = targetX - ballx;
  ballx += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - bally;
  bally += dy * easing;

}


}