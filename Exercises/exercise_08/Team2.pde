// Team02 Class
//
//

class Team2 {

  int x;
  int y;
  int size;
  
  // Set up the players with the location and size
  //add arguments to the constructor
  //

  Team2(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
  }

    // update()
    // 
    // Add random movement for the players
    
  void update() {
    int xRun = floor(random(-1, 2));
    int yRun = floor(random(-1, 2));
    x += 5 * xRun;
    y += 5 * yRun;

// keep all the team 2 players in right-side of the screen
//

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

 //display()
  //
  //Draw the Team 02 players

  void display() {

    fill(0, 0, 255);
    rect(x, y, size, size);
  }
}