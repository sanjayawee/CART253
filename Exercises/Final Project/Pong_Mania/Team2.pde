class Team2 {



  int x;
  int y;
  int size;

  Team2(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    
    
  }

  void update() {
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += 5 * xMoveType;
    y += 5 * yMoveType;

    if (x > width/2-50) {
      x = 0;
    } else if (x <= 0) {
      x += width/2-50;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }
  }

  void display() {

   
     fill(0,0,255);
     rect(x,y,size,size);
  }
}