

class SpacePong {

  Paddle leftPaddle;
  Paddle rightPaddle;
  Score score;

  int PADDLE_INSET = 8;

  boolean returnToMenu = false;

  Star[] stars= new Star[800];

  float t1 = random(0, 100);

  int initialTimeAdd ;
  int intervalAdd = 2000;//two second
  ArrayList <Ball> ball = new ArrayList <Ball>();
  ArrayList <Ball> ball2 = new ArrayList <Ball>();



  SpacePong() {

    size(640, 480);
    initialTimeAdd = millis();
    leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'm');

    for (int i= 0; i < stars.length; i++) {
      stars[i] = new Star();
    }

    score = new Score();
  }

  void update() {
    background(0);

    rectMode(CENTER);
    float petOneX = height*noise(t1);

    t1+= 0.01;

    if (millis() - initialTimeAdd > intervalAdd) {
      initialTimeAdd = millis();
      intervalAdd = int(random(1000, 4000));

      ball.add(new Ball(width/2, petOneX, color(255, 0, 0), 3));
      ball2.add(new Ball(width/2, petOneX, color(0, 0, 255), -3));
    }



    leftPaddle.update();
    rightPaddle.update();


    leftPaddle.display();
    rightPaddle.display();



    for (Ball s : ball) {
      s.display();
      score.display();
      s. update();
      s.collide(leftPaddle);
      s.collide(rightPaddle);
      score.update(s);
    }


    for (Ball c : ball2) {
      score.display();
      c.display();
      c. update();
      c.collide(leftPaddle);
      c.collide(rightPaddle);
      score.update(c);
    }


    //  space Craft
    fill(255);
    rect(width/2, petOneX, 50, 60);
    rect(width/2, petOneX, 100, 20);





    translate(width/2, height/2);
    for (int i=0; i<stars.length; i++) {
      stars[i].update();
      stars[i].display();
    }
  }

  void reset() {
    for (Ball s : ball) {
      s.reset();
    }

    for (Ball c : ball2) {
      c.reset();
    }

    leftPaddle.reset();
    rightPaddle.reset();
    returnToMenu = false;
  }



  void keyPressed() {

    leftPaddle.keyPressed();
    rightPaddle.keyPressed();

    if (key == 'b' || key == 'B') {
      returnToMenu = true;
    }
  }


  void keyReleased() {
    leftPaddle.keyReleased();
    rightPaddle.keyReleased();
  }
}