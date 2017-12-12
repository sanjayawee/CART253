class Menu2{

State select = State.NONE;

boolean soccerBall=false;

Menu2(){

}

void update(){
display();
}

void display(){

    background(0);
    /*fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("PONG1", width/2, 50);
    text("PONG2", width/2, 100);
    text("PONG3", width/2, 150);
    text("PONG4", width/2, 200);*/
    
    mouseHandle();
    
    fill(255);
    rectMode(CENTER);
    //mousehandle();
    rect(width/2, height/2-150, 150, 40);
    rect(width/2, height/2-100, 150, 40);
    rect(width/2, height/2-50, 150, 40);
    rect(width/2, height/2+0, 150, 40);
    rect(width/2, height/2+50, 150, 40);
    rect(width/2, height/2+100, 150, 40);
    rect(width/2, height/2+150, 150, 40);
    

    textSize(15);
    textAlign(CENTER);
    fill(0);
    text("Regular Pong", width/2, height/2-145);
    text("Soccer Pong", width/2, height/2-95);
    text("Future Pong", width/2, height/2-45);
    text("Western Pong", width/2, height/2+5);
    text("Space Pong", width/2,height/2+55);
    text("Crazy Pong",width/2,height/2+105);
    text("Real Pong",width/2,height/2+155);
    
    
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
    
  }
 void keyReleased() {
  }
  
  void mouseHandle(){
  
    if (mouseX > width/2-75 && mouseX < width/2+75 && mouseY < height/2-150+20 && mouseY > height/2-150-20){
    rect(width/2, height/2-150, 155, 45);
    }
    else{
    rect(width/2, height/2-150, 150, 40);
    }
    

    
    
    
  
  }


}