//Main Menu
//
// A simple class to display a menu of possible games to play
// and to respond to the player's selection by setting a variable
// that the main program can see and then switch to the selected
// state

class Menu {
  
  // A variable to track the user's selection (starts as NONE)
  State selection = State.NONE;
  // A constructor that does nothing
  Menu() {
  }

  // update()
  //
  // The update method just displays the menu
  
  void update() {
    display();
  }

  // display()
  //
  // display Main games (PONG,SNAKE,SPACE)
  
  void display() {

    background(0);


    
    fill(255);
    rectMode(CENTER);
  // calling thr mouseHandle function
    mouseHandle();
    rect(width/2, height/2-90, 150, 40);
    rect(width/2, height/2-40, 150, 40);
    rect(width/2, height/2+10, 150, 40);
    


    textSize(15);
    textAlign(CENTER);
    fill(0);
    text("PONG", width/2, height/2-85);
    text("SNAKE", width/2, height/2-35);
    text("SPACE", width/2, height/2+15);
   
  }


  void keyReleased() {
  }

  //mouseClicked()
  //
  // Called by the main program when the menu is active. If the player
  // Click a button to select one of the game, this object
  // will remember the state chosen.
  
  void mouseClicked() {
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-90+20 && mouseY > height/2-90-20) {

      selection = State.MENU2;
    }
  }

  //mouseHandel();
  //
  //If mouse point is in this areas change the rectangles (Buttons) size and color.

  void mouseHandle() {


    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-90+18 && mouseY > height/2-90-18) {
      fill(255);
      rect(width/2, height/2-90, 160, 50);
    } else {
      fill(#C1BFC0);
      rect(width/2, height/2-90, 150, 40);
    }

    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-40+18 && mouseY > height/2-40-18) {
      fill(255);
      rect(width/2, height/2-40, 160, 50);
    } else {
      fill(#C1BFC0);
      rect(width/2, height/2-40, 150, 40);
    }

    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+10+18 && mouseY > height/2+10-18) {
      fill(255);
      rect(width/2, height/2+10, 160, 50);
    } else {
      fill(#C1BFC0);
      rect(width/2, height/2+10, 150, 40);
    }
 
  }
}