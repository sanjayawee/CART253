//Pong Menu
//
// A simple class to display a menu of possible games to play
// and to respond to the player's selection by setting a variable
// that the main program can see and then switch to the selected
// state

class Menu2 {
  // A variable to track the user's selection (starts as NONE)
  State select = State.NONE;
  
  // A boolean to track whether player select the soccer pong and change the ball
  boolean soccerBall=false;
  // A constructor that does nothing
  Menu2() {
  }

  // update()
  //
  // The update method just displays the menu
  void update() {
    display();
  }

  // display()
  //
  // display Pong game versions (Basic, Future, Soccer, Western, Real and Space Pong)
  void display() {

    background(25,45,124);

  

    fill(255);
    rectMode(CENTER);

    rect(width/2, height/2-150, 150, 40);
    rect(width/2, height/2-100, 150, 40);
    rect(width/2, height/2-50, 150, 40);
    rect(width/2, height/2, 150, 40);
    rect(width/2, height/2+50, 150, 40);
    rect(width/2, height/2+100, 150, 40);

    mouseHandle();

    textSize(15);
    textAlign(CENTER);
    fill(0);
    text("Regular Pong", width/2, height/2-145);
    text("Soccer Pong", width/2, height/2-95);
    text("Future Pong", width/2, height/2-45);
    text("Western Pong", width/2, height/2+5);
    text("Space Pong", width/2, height/2+55);
    text("Real Pong", width/2, height/2+105);

    
    
  }

  void keyPressed() {

  }
  
  
  void keyReleased() {
  }
  
  //mouseClicked()
  //
  // Called by the main program when the pong menu is active. If the player
  // Click a button to select one of the pong game, this object
  // will remember the state chosen.

  void mouseClicked() {

    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-150+20 && mouseY > height/2-150-20) {
      select = State.BASIC_PONG;
      soccerBall=false;
    }
    
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-100+20 && mouseY > height/2-100-20) {
      select = State.SOCCER_PONG;
      soccerBall=true;
      stereoSound.play();
    }
    
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-50+20 && mouseY > height/2-50-20) {
      select = State.FUTURE_PONG;
      soccerBall=false;
    }
    
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+20 && mouseY > height/2-20) {
      select = State.WESTERN_PONG;
      soccerBall=false;
    }
    
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+50+20 && mouseY > height/2+50-20) {
      select = State.SPACE_PONG;
      soccerBall=false;
    }
    
  } 

  //mouseHandel();
  //
  //If mouse point is in this areas change the rectangles (Buttons) size.

  void mouseHandle() {

    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-150+20 && mouseY > height/2-150-20) {
      rect(width/2, height/2-150, 155, 45);
    } else {
      rect(width/2, height/2-150, 150, 40);
    }
    
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-100+20 && mouseY > height/2-100-20) {
      rect(width/2, height/2-100, 155, 45);
    } else {
      rect(width/2, height/2-100, 150, 40);
    }
    
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-50+20 && mouseY > height/2-50-20) {
      rect(width/2, height/2-50, 155, 45);
    } else {
      rect(width/2, height/2-50, 150, 40);
    }
    
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+20 && mouseY > height/2-20) {
      rect(width/2, height/2, 155, 45);
    } else {
      rect(width/2, height/2, 150, 40);
    }
    
     if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+50+20 && mouseY > height/2+50-20) {
      rect(width/2, height/2+50, 155, 45);
    } else {
      rect(width/2, height/2+50, 150, 40);
    }
    
     if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+100+20 && mouseY > height/2+100-20) {
      rect(width/2, height/2+100, 155, 45);
    } else {
      rect(width/2, height/2+100, 150, 40);
    }
     
    
  }
}