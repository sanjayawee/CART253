class Menu {

  State selection = State.NONE;

  Menu() {
  }

  void update() {
    display();
  }

  void display() {

    background(0);
    /*textAlign(CENTER, CENTER);
     textSize(32);
     text("PONG", width/2, 50);
     text("SNAKE", width/2, 100);
     text("SHIP", width/2, 150);
     text("BOUNCE", width/2, 200);*/

    //create Buttons for 
    fill(255);
    rectMode(CENTER);
    mouseHandle();
    rect(width/2, height/2-90, 150, 40);
    rect(width/2, height/2-40, 150, 40);
    rect(width/2, height/2+10, 150, 40);
    rect(width/2, height/2+60, 150, 40);

    //Add 
    textSize(15);
    textAlign(CENTER);
    fill(0);
    text("PONG", width/2, height/2-85);
    text("SNAKE", width/2, height/2-35);
    text("SPACE", width/2, height/2+15);
    text("BOUNCE", width/2, height/2+65);
  }

  void keyPressed() {
    if (key == 'p' || key == 'P') {
      selection = State.MENU2;
    } else if (key == 'F' || key == 'f') {
      // selection = State.BLUE_PONG;
      //sanke game
    } else if (key == 'b' || key == 'B') {
      // selection = State.BLUE_PONG;
      //sapce game
    }
  }
  void keyReleased() {
  }

  //Mouse Clicked
  //
  //Call the MENU2 if user clicked in this area.


  void mouseClicked() {
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-90+20 && mouseY > height/2-90-20) {

      selection = State.MENU2;
    }
  }


  //Mouse Handel
  //
  //If mouse point is in this areas change the rectangles (Buttons) size.

  void mouseHandle() {

    //if(mouseX < width/2 && mouseY < height/2)
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-90+18 && mouseY > height/2-90-18) {

      rect(width/2, height/2-90, 160, 50);
    } else {

      rect(width/2, height/2-90, 150, 40);
    }

    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-40+18 && mouseY > height/2-40-18) {

      rect(width/2, height/2-40, 160, 50);
    } else {

      rect(width/2, height/2-40, 150, 40);
    }

    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+10+18 && mouseY > height/2+10-18) {

      rect(width/2, height/2+10, 160, 50);
    } else {

      rect(width/2, height/2+10, 150, 40);
    }

    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+60+18 && mouseY > height/2+60-18) {

      rect(width/2, height/2+60, 160, 50);
    } else {

      rect(width/2, height/2+60, 150, 40);
    }
  }
}