enum State {

  NONE, 
    TITLE, MENU, MENU2, BASIC_PONG, WESTERN_PONG, FUTURE_PONG, SOCCER_PONG, SPACE_PONG, CRAZY_PONG, INSTRUCTION, REAL_PONG
}

State state;

Title title;
Menu menu;
BasicPong basicPong;
Instruction instruction;
Menu2 pongmenu;
SoccerPong soccerPong;

//WesternPong westernPong;
//FuturePong futurePong;
//SpacePong spacePong;
//CrazyPong crazyPong;
//RealPong crazyPong;

void setup() {
  size(640, 480);

  title = new Title();
  menu = new Menu();
  pongmenu = new Menu2();
  basicPong = new BasicPong();
  instruction= new Instruction();
  soccerPong= new SoccerPong();

  state = State.TITLE;
}

void draw() {

  switch (state) {
    // If our state is NONE, we do nothing
  case NONE:
    break;

  case TITLE:
    title.update();
    if (title.finished) {
      state = State.MENU;
    }
    break;

    /*case MENU:
     menu.update();
     if (menu.selection != State.NONE) {
     state = menu.selection;
     menu.selection = State.NONE;
     }*/

  case MENU:
    menu.update();
    if (menu.selection != State.NONE) {
      state = menu.selection;
      menu.selection = State.NONE;
    }
    break;

  case MENU2:
    pongmenu.update();
    if (pongmenu.select != State.NONE) {
      state = pongmenu.select;
      pongmenu.select = State.NONE;
    }
    break;

  case INSTRUCTION:
    instruction.update();
    if (instruction.finished) {
      state = State.SOCCER_PONG;
      //state = State.BASIC_PONG;
    }
    break;


  case BASIC_PONG:
    basicPong.update();
    if (basicPong.returnToMenu) {
      state = State.MENU;
      basicPong.reset();
    }
    break;
    
    

  case SOCCER_PONG:
    soccerPong.update();
    if (soccerPong.returnToMenu) {
      state = State.MENU;
      soccerPong.reset();
    }
    break;
  }
}

void keyPressed() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyPressed();
    break;

  case MENU:
    menu.keyPressed();
    break;

  case MENU2:
    pongmenu.keyPressed();
    break;

  case INSTRUCTION:
    instruction.keyPressed();
    break;

  case BASIC_PONG:
    basicPong.keyPressed();
    break;

  case SOCCER_PONG:
    soccerPong.keyPressed();
    break;
  }
}

void keyReleased() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyReleased();
    break;

  case MENU:
    menu.keyReleased();
    break;

  case MENU2:
    pongmenu.keyReleased();
    break;

  case INSTRUCTION:
    instruction.keyReleased();
    break;


  case BASIC_PONG:
    basicPong.keyReleased();
    break;

  case SOCCER_PONG:
    soccerPong.keyReleased();
    break;
  }
}

void mouseClicked() {
  switch (state) {
  case MENU:
    menu.mouseClicked();
    break;
  }
}