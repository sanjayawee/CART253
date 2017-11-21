//Team01 Class
//
//

class Team1 {

  int x;
  int y;
  int size;


// Set up the players with the location and size
//add arguments to the constructor
//
  Team1(int tempX, int tempY, int tempSize) {
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

// keep all the team 1 players in right-side of the screen
//
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
  
  //display()
  //
  //Draw the Team 01 players

  void display() {

    fill(255, 0, 0);
    rect(x, y, size, size);
   
    
  }
}