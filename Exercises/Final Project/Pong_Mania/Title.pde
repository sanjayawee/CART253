class Title {

  boolean finished = false;



  Title() {
  }

  void update() {
    display();
  }

  void display() {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(255);
    text("WELCOME TO GAME MANIA", width/2, height/2);

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
}