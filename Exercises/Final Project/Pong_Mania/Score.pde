//Score
//

class Score {

  // 
  int player1;
  int player2;
  
  // A boolean to track the winner
  boolean gameOver = false;
  
   /////////////// Constructor ///////////////
   
  // A constructor that does nothing
  Score() {
  }

  //update();
  //
  void update(Ball ball) {

  //Get the count value form ball class
    player1 = ball.count1;
    player2 = ball.count2; 
    
  //Check which player has high score
  
    if (player1==10 || player2==10) {
      gameOver = true;
    }
  }
  //display()
  //
  void display() {
  
  //Score Board
  //
    textAlign(CENTER);
    rectMode(CENTER);
    fill(255);
    stroke(0.5);
    rect(80, 30, 120, 35, 7);
    rect(560, 30, 120, 35, 7);
    textSize(20);
    fill(0);
    text("Player 01", 80, 35); 
    text("Player 02", 560, 35);
  
    textSize(30);
    fill(255);
    text(player1, 80, 80); 
    text(player2, 560, 80);
   
  }
  
  //overDisplay()
  //
  //Game over Window
  
  void overDisplay() {

    textAlign(CENTER);
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 400, 200, 8);
    fill(0);

    textSize(50);
    text("GAME OVER", width/2, 190);
    line(120, height/2-40, 520, height/2-40);
    textSize(random(25, 26));
    text("CONGRATULATIONS", width/2, height/2-5);
    
   // Check who has the high score and shows which player win
    if (player1>player2) {
      textSize(18);
      text("Player 01 Win", width/2, height/2+20);
    } else if (player1<player2) {
      textSize(18);
      text("Player 02 Win", width/2, height/2+20);
    }
    
    // Back and Restart Button

    fill(255);
    rect(width/2-100, height/2+65, 140, 40, 5);
    rect(width/2+100, height/2+65, 140, 40, 5);
    buttonHover();
    
    fill(0);
    text("RESTART", width/2-100, height/2+73);
    text("PONG MENU", width/2+100, height/2+73);
    

  }
  
  //Back and Restart Button effect
  
  void buttonHover(){
  
    
    if (mouseX > width/2-100-70 && mouseX < width/2-100+70 && mouseY < height/2+65+20 && mouseY > height/2+65-20) {
      fill(#C4C4C4);
      rect(width/2-100, height/2+65, 145, 45, 5);
    } else {
      fill(255);
      rect(width/2-100, height/2+65, 140, 40, 5);
    }
    
     if (mouseX > width/2+100-70 && mouseX < width/2+100+70 && mouseY < height/2+65+20 && mouseY > height/2+65-20) {
      fill(#C4C4C4);
      rect(width/2+100, height/2+65, 145, 45, 5);
    } else {
      fill(255);
      rect(width/2+100, height/2+65, 140, 40, 5);
    }
  
  }
  
  
}