

enum State {

  NONE, 
    TITLE, MENU, MENU2, BASIC_PONG, WESTERN_PONG, FUTURE_PONG, SOCCER_PONG, SPACE_PONG, CRAZY_PONG, REAL_PONG
}

State state;

Title title;
Menu menu;
BasicPong basicPong;
Menu2 pongmenu;
SoccerPong soccerPong;
SpacePong spacePong;
WesternPong westernPong;
FuturePong futurePong;

//CrazyPong crazyPong;
//RealPong realPong;
//Capture video;

void setup() {
  size(640, 480);

  title = new Title();
  menu = new Menu();
  pongmenu = new Menu2();
  basicPong = new BasicPong();
  soccerPong = new SoccerPong();
  spacePong = new SpacePong();
  futurePong = new FuturePong();
  westernPong = new WesternPong();
  // realPong = new RealPong();



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

  case BASIC_PONG:
    basicPong.update();
    if (basicPong.returnToMenu) {
      state = State.MENU2;
      basicPong.reset();
    }
    break;

  case SOCCER_PONG:
    soccerPong.update();
    if (soccerPong.returnToMenu) {
      state = State.MENU2;
      soccerPong.reset();
    }
    break;

  case SPACE_PONG:
    spacePong.update();
    if (spacePong.returnToMenu) {
      state = State.MENU2;
      spacePong.reset();
    }
    break;

  case FUTURE_PONG:
    futurePong.update();
    if (futurePong.returnToMenu) {
      state = State.MENU2;
      futurePong.reset();
    }
    break;

  case WESTERN_PONG:
    westernPong.update();
    if (westernPong.returnToMenu) {
      state = State.MENU2;
      westernPong.reset();
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

  

  case MENU2:
    pongmenu.keyPressed();
    break;

  case BASIC_PONG:
    basicPong.keyPressed();
    break;

  case SOCCER_PONG:
    soccerPong.keyPressed();
    break;

  case SPACE_PONG:
    spacePong.keyPressed();
    break;

  case FUTURE_PONG:
    futurePong.keyPressed();
    break;
    
    case WESTERN_PONG:
    westernPong.keyPressed();
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


  case BASIC_PONG:
    basicPong.keyReleased();
    break;

  case SOCCER_PONG:
    soccerPong.keyReleased();
    break;

  case SPACE_PONG:
    spacePong.keyReleased();
    break;

  case FUTURE_PONG:
    futurePong.keyReleased();
    break;
    
    case WESTERN_PONG:
    westernPong.keyReleased();
    break;
  }
}

void mouseClicked() {
  switch (state) {
  case MENU:
    menu.mouseClicked();
    break;

  case MENU2:
    pongmenu.mouseClicked();
    break;

  case BASIC_PONG:
    basicPong.mouseClicked();
    break;

  case SOCCER_PONG:
    soccerPong.mouseClicked();
    break;

  case FUTURE_PONG:
    futurePong.mouseClicked();
    break;

  case WESTERN_PONG:
    westernPong.mouseClicked();
    break;
  }
}


void mouseReleased() {
  switch (state) {
  case FUTURE_PONG:
    futurePong.mouseReleased();
    break;
  }
}