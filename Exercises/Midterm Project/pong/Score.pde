class Score {

  
  int winningScore = 1;


  color player1 = color (255, 0, 0);
  color player2 = color (0, 255, 0);

  void scores() {

    fill (255);
    text ("Player 1: " + leftPaddle.score, 155, 40);
    text ("Player 2: " + rightPaddle.score, 480, 40);
  }

  /* void showWinner() {
   
   if (leftPaddle.score==5) {
   fill(145,0,0,214);
   rectMode(CENTER);
   rect(width/2, height/2,640,480);
   fill(255);
   text("WINNER IS LEFT", width/2, height/2);
   fill(255);
   text("Score = 20", width/2-20, height/2-20);
   
   } else if (rightPaddle.score==5) {
   text("Score = 20", width/2-20, height/2-20);
   text("WINNER IS RIGHT", width/2, height/2);
   
   }
   }*/

  void gameOver() {
    if (leftPaddle.score >= winningScore) {
      gameOverPage1();
    }
    if (rightPaddle.score >= winningScore) {
      gameOverPage2();
    }
  }
  
  void gameOverPage1 () {

    
  float j= random(320,360);
  float f= random(240,282);
  photo7.resize(90,90);
  image(photo7,j,f);
  fill (0,0,150,50);
  stroke(255, 255, 255);
  strokeWeight(4);
  rect (320, 250, 320, 200);
  fill (255);
  text ("GAME OVER", width/2, height/3 + 40);
  //text (text, width/2, height/3 + 80);
  text ("Click to play again", width/2, height/3 + 120);}
}

void gameOverPage2 () {

  float j= random(320,360);
  float f= random(240,282);
  photo7.resize(90,90);
  image(photo7,j,f);
  fill (150,0,0,50);
  stroke(255, 255, 255);
  strokeWeight(4);
  rect (320, 250, 320, 200);
  fill (255);
  text ("GAME OVER", width/2, height/3 + 40);
  //text (text, width/2, height/3 + 80);
  text ("Click to play again", width/2, height/3 + 120);

}