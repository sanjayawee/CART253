class Menu2 {

  State select = State.NONE;

  boolean soccerBall=false;

  Menu2() {
  }

  void update() {
    display();
  }

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
    rect(width/2, height/2+150, 150, 40);
    mouseHandle();

    textSize(15);
    textAlign(CENTER);
    fill(0);
    text("Regular Pong", width/2, height/2-145);
    text("Soccer Pong", width/2, height/2-95);
    text("Future Pong", width/2, height/2-45);
    text("Western Pong", width/2, height/2+5);
    text("Space Pong", width/2, height/2+55);
    text("Crazy Pong", width/2, height/2+105);
    text("Real Pong", width/2, height/2+155);
    
    
  }

  void keyPressed() {
    if (key == '1' || key == '1') {
      //select = State.INSTRUCTION;
      select = State.BASIC_PONG;
      soccerBall=false;
    } 
    if (key == '2' || key == '2') {
      //select = State.INSTRUCTION;
      select = State.SOCCER_PONG;
      soccerBall=true;
    }
    if (key == '5' || key == '5') {
      //select = State.INSTRUCTION;
      select = State.SPACE_PONG;
      soccerBall=false;
    }
  }
  void keyReleased() {
  }

  void mouseClicked() {

    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-150+20 && mouseY > height/2-150-20) {
      select = State.BASIC_PONG;
      soccerBall=false;
    }
    
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-100+20 && mouseY > height/2-100-20) {
      select = State.SOCCER_PONG;
      soccerBall=true;
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
    
     if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2+150+20 && mouseY > height/2+150-20) {
      rect(width/2, height/2+150, 155, 45);
    } else {
      rect(width/2, height/2+150, 150, 40);
    }
    
    
  }
}