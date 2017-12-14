//Players
//
//This player class use in Soccer pong version
//

class Players {

  PImage redTeam, blueTeam;
  
  // The position of the Red Players
  int x;
  int y;
 
  // The position of the Blue Players
  int xx;
  int yy;

  int size;

   /////////////// Constructor ///////////////
   //
   //Set the players X and y  positions and size based on arguments
   //Load the images

  Players(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    xx = tempX;
    yy = tempY;
    size = tempSize;

    redTeam= loadImage("redplayers.png");
    blueTeam= loadImage("blueplayers.png");
  }
  
   // update()
   //
   // Updates position based on velocity 

  void update() {
  
  // create a random value veriable   
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
  // Update red and blue players position with random MoveType between -1 and 2  (to move the players) 
    x += 5 * xMoveType;
    y += 5 * yMoveType;

    xx += 5 * xMoveType;
    yy += 5 * yMoveType;
    
  //calling team1 and team2 functions  
    team1();
    team2();
    
  }
  // display()
  //
  // Display the Players at their location
  
  void display() {

    imageMode(CENTER);
    image(redTeam, x, y);
    image(blueTeam, xx, yy);
  }
  
  //team1()
  // preventing team 1 players (RED) going off the screen 
  // and Left side 
  
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

  //team2()
  // preventing team 1 players (Blue) going off the screen 
  // and Right side 
  
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