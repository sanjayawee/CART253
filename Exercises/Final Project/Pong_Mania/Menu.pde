class Menu{

State selection = State.NONE;

Menu(){

}

void update(){
display();
}

void display(){

    background(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("PONG", width/2, 50);
    text("SNAKE", width/2, 100);
    text("FLAPPY BIRD", width/2, 150);
    text("BOUNCE", width/2, 200);
}

 void keyPressed() {
    if (key == 'p' || key == 'P') {
      selection = State.BASIC_PONG;
    } 
    else if (key == 'F' || key == 'f') {
     // selection = State.BLUE_PONG;
    }
    else if (key == 'b' || key == 'B') {
     // selection = State.BLUE_PONG;
    }
  }
 void keyReleased() {
  }


}