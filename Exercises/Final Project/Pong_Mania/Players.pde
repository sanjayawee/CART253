class Players {

  PImage redTeam, blueTeam;

  int x;
  int y;
  int size;

  int xx;
  int yy;

  Players(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    xx = tempX;
    yy = tempY;
    size = tempSize;

    redTeam= loadImage("redplayers.png");
    blueTeam= loadImage("blueplayers.png");
  }

  void update() {
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += 5 * xMoveType;
    y += 5 * yMoveType;

    xx += 5 * xMoveType;
    yy += 5 * yMoveType;
    
    
    team1();
    team2();
    
  }

  void display() {

    imageMode(CENTER);
    image(redTeam, x, y);
    image(blueTeam, xx, yy);
  }

  void team1() {
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

  void team2() {
    if (xx > width/2-50) {
      xx = 0;
    } else if (xx <= 0) {
      xx += width/2-50;
    }
    if (yy < 0) {
      yy += height;
    } else if (yy >= height) {
      yy -= height;
    }
  }
}