enum State {

  NONE, 
    TITLE,MENU, BASIC_PONG,WESTERN_PONG,FUTURE_PONG_SOCCER_PONG,SPACE_PONG,
    CRAZY_PONG,REAL_PONG
}

State state;

Title title;
Menu menu;
BasicPong basicPong;
//SoccerPong soccerPong;
//WesternPong westernPong;
//FuturePong futurePong;
//SpacePong spacePong;
//CrazyPong crazyPong;
//RealPong crazyPong;

void setup() {
  size(640, 480);

  title = new Title();
  menu = new Menu();
  basicPong = new BasicPong();

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

  case BASIC_PONG:
    basicPong.update();
    if (basicPong.returnToMenu) {
      state = State.MENU;
      basicPong.reset();
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

  case BASIC_PONG:
    basicPong.keyPressed();
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


  case BASIC_PONG:
    basicPong.keyReleased();
    break;

}}