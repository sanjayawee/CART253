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
    text("W to up Z to down", width/2, height/2);
    text("P to up M to down", width/2, height/2+50);
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