// Bullet
//
//This bullet class use in Western Pong version
//In here, create a ball to go upward


class Bullet {

  float speed;
  int size = 10;

  float x;
  float y;

  float vy;
  float vx;
  color bulletcolor;

   /////////////// Constructor ///////////////
  //
  //
  Bullet(float tempX, float tempY, color tempbulletcolor, float tempSpeed) {
    x=tempX;
    y=tempY;
    speed=tempSpeed;
    vy=speed;
    vx=speed;
    bulletcolor= tempbulletcolor;
     
  }
  //update
  //
  //Move bullets on y axis
  void update() {
    y-=vy;
  }
  
  //display()
  //
  //display bullets
  void display() {
   
    noStroke();
    fill(bulletcolor);
    ellipseMode(CENTER);
    ellipse(x, y, size, size);    
  }
}