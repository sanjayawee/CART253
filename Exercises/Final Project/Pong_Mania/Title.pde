// Title
//
// A simple class to display the title of the game on the
// screen and listen for a press of any key. When a key is pressed
// it remembers the title is finished and the main program checks
// this in order to advance to the menu.


class Title {
  // A variable to track whether the title screen is finished
  boolean finished = false;

  // The constructor does nothing
  Title() {
  }

  // update()
  //
  // Just displays the title
  void update() {
    display();
  }

  // display()
  //
  // Displays the title of the game and the basic instructions
  // to press any key
  
  void display() {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(255);
    text("WELCOME TO PONG MANIA", width/2, height/2-100);
    textSize(25);
    text("Q and W Left Paddle Controls", width/2, height/2);
    text("O and M Right Paddle Controls", width/2, height/2+50);

    textSize(random(30, 31));
    text("Press Enter", width/2, 3*height/4);
  }

  void keyPressed() {
    finished = true;
  }

  // keyReleased()
  //
  // Does nothing.

  void keyReleased() {
  }

  void mouseClicked() {

    if (mouseX<width/2 && mouseY < height/2) {
      finished = true;
    }
  }
}