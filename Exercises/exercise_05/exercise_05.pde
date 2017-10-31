
//This is a life system.The polliwogs are move around randomly.
//when pressing the left mouse key all the polliwogs gather to mouse pointer and move 
//slowly,then pressing the right mouse button all the polliwogs are move fast and 
//trying to move away from mouse pointer

//A array for all the polliwogs
Polliwog[] Polli =new Polliwog[10];
//Mother mom;
//Predator pred;


PImage photo1;
PImage photo2;
PImage photo3;

void setup() {
  // Set up the window size and loadImages
  size(640, 480);
  photo1 = loadImage("img.png");
  photo2 = loadImage("imgmother.png");
  photo3 = loadImage("Predator.png");
  
  surface.setResizable(true);//set window resizable

//create X and Y random locations for all polliwogs
//
  for (int i=0; i<Polli.length; i++) {

    int x=floor(random(0, width/10));
    int y=floor(random(0, height/10));
    Polli[i]=new Polliwog(x*10, y*10, 30);
  }
}

void draw() {

  background(255);
  //update and display all the polliwogs in array
  for (int j=0; j<Polli.length; j++) {
    Polli[j].update();
    Polli[j].display();
  }
}