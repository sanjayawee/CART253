class Bullet {

  int xx;
  int yy;
  int vx=2;
  int vy=1;
  int w=20;
  int h=80;

  Bullet(int tempxx, int tempyy) {

    xx=tempxx;
    yy=tempyy;
  }


  void update() {

    yy=yy-vy;
  }

  void displaybullet() {


    fill(0);
    rect(xx, yy, w, h);
  }
}