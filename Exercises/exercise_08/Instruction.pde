class Instruction {

  boolean finished = false;



  Instruction() {
  }

  void update() {
    display();
  }

  void display() {

    background(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(255);
    text("Left-side player Q and Z", width/2, height/2);
    text("Right-side player O and M", width/2, height/2+50);
    text("Press ENTER to start the game", width/2, height-50);
  }

  void keyPressed() {
    if (keyCode == ENTER) {
      finished = true;
    }
  }

  // keyReleased()
  //
  // Does nothing.

  void keyReleased() {
  }
}