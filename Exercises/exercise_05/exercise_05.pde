

Ball[] ball =new Ball[10] ;

color defaultcolor= color(255);
PImage photo1;



void setup() {
  photo1 = loadImage("pong.png");
  size(400, 400);
  surface.setResizable(true); // Put this in setup
  for (int i=0; i<ball.length; i++) {

    int x=floor(random(0, width/30));
    int y=floor(random(0, height/30));
    ball[i]=new Ball(x*30, y*30, 30);
  }
}
void draw() {
  background(defaultcolor);
  for (int j=0; j<ball.length; j++) {
    ball[j].update();
    ball[j].display();
    //ball[j].mouseFallow();
  }
}
void mouseClicked() {
  surface.setSize(400, 400); // Change size with this
}

void changeColor() {
}