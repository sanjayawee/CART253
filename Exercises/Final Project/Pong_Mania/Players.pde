class Team1 {

  PImage redTeam;

  int x;
  int y;
  int size;

  Team1(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
   
     redTeam= loadImage("redplayers.png");
  }

  void update() {
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += 5 * xMoveType;
    y += 5 * yMoveType;

    if (x < width/2+50) {
      x += width;
    } else if (x >= width) {
      x -= width/2+50;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }
  }

  void display() {

    imageMode(CENTER);
    image(redTeam, x, y);
    //fill(255,0,0);
    // rect(x,y,size,size);
    //fill(255);
    // line(width/2,0,width/2,height);
    // noFill();
    // ellipse(width/2,height/2,50,50);
  }
}