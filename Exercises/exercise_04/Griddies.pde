// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;
  
  int collideSize = 1;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255,0,0);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {
    
    // QUESTION: What is this if-statement for?
    // ANSWER: 
    // if energy is 0 do not execute below lines.
    //
    if (energy == 0) {
      return;
    }
    
    // QUESTION: How does the Griddie movement updating work?
    //
    // ANSWER:
    //xMoveType and yMoveType values are random between -1 and +2.
    //if both max and min random numbers are positive griddie moves same way
    //in this case griddies are moving randomly 
    //x and y coordinats are equal to the size(gridSize) multiplied by x and y MoveType
    // x=20*(-1 || 0 || 1 || 2)     y=20*(-1 || 0 || 1 || 2)
    //
    int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    // QUESTION: What are these if statements doing?
    //
    // ANSWER: 
    //if x less than 0, change the X to x=x+width 
    //it's mean, if rectangle touch the left side of the wall then move it to the right side of the wall
    //this if and else if statements is preventing the rectangle to go off the screen
    //all the Griddies stay in side of the screen
    // 
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    
    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy,0,maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  
  void collide(Griddie other) {
    // QUESTION: What is this if-statement for?
    // ANSWER: 
    //if energy or other.energy is 0 skip the line statement below
    //
    //
    if (energy == 0 || other.energy == 0) {
      return;
    }
    
    // QUESTION: What does this if-statement check?
    // ANSWER: 
    //checking the griddies overlapping if this statement true increase the energy by adding collideEnergy
    //
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
    
  }
  
  
  void checkingCollision(Eclipies ww,Griddie qq){
  
    if(ww.xx==qq.x){
    size+=collideSize;
    }
  
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    // ANSWER:
    //change the color opacity level according to the engergy level
    //fill(rgb, alpha) alpha mean opacity of the fill
    //
    //
    fill(fill, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}