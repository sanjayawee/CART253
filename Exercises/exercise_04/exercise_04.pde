// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;

// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
//
//CHANGED
//
Eclipies[] eclipies = new Eclipies[50];
//
// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  //ANSWER: 
  //creating X and Y random locations for all griddies
  //
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }

  //CHANGED
  //
  for (int e = 0; e < eclipies.length; e++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    eclipies[e] = new Eclipies(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // ANSWER: 
      // if j is not equal to the i. Do the following thing
      //
      if (j != i) {
        // QUESTION: What does this line check?
        // ANSWER: 
        // 
        //
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
  }


  //
  //CHANGED
  //
  for (int e = 0; e < eclipies.length; e++) {

    eclipies[e].EclUpdate();
    eclipies[e].EclDisplay();
    eclipies[e].collide(eclipies);
  }
}