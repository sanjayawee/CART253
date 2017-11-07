//in this exercise, I'm trying to do track the specific color from the webcam.
//And add that data to the program and interact with some objects. unfortunately,
//my webcam doesn't work.So i created a video that red dot moving in the green 
//background.And track that red dot.
//reference: https://processing.org/tutorials/video/

//importing processing video libarary
import processing.video.*;
Movie myMovie;//Declare a Movie object
Ball[] ball =new Ball[80];


float followX;
float followY;

void setup() {

  size(640, 480);
  myMovie = new Movie(this, "qq.mp4"); //Initialize Movie object
  myMovie.loop();//loop the video

//create X and Y random locations for all balls
//Create a new object into the variable ball
//pass the parameters to Ball() constructor
  for (int i=0; i<ball.length; i++) {

    int x=floor(random(0, width/10));
    int y=floor(random(0, height/10));
    ball[i]=new Ball(x*10, y*10, 30);
  }
}

void draw() {

  background(255);
  //update and display all the Balls in array
  for (int j=0; j<ball.length; j++) {
    ball[j].update();
    ball[j].display();
  }

  int reddestX = 0;
  int reddestY = 0;
  float record = 1000;

//calculate all the column pixels in the video
  for ( int x = 0; x < myMovie.width; x++ ) {
//calculate all the raw pixels in the video
    for ( int y = 0; y < myMovie.height; y++ ) {
      //calculates a location in the array of pixels based on an x and y
      int loc = x + y * width;
      // What is current color of the pixel
      color pixelColor = myMovie.pixels[loc];
      //Calculates the distance between two colors
      //compare colors using dist function
      float amount = dist(255,0,0,red(pixelColor),green(pixelColor),blue(pixelColor));
      //float amount = dist(0,128,0,green(pixelColor));
      //float amount = dist(0,0,128,blue(pixelColor));
     // float amount = dist(255,0,0,red(pixelColor));
     
     //
      if (amount < record) {
        record = amount;
        reddestX = x;
        reddestY = y;
        followX=x;
        followY=y;
      }
    }
  }

  fill(0, 0, 120);
  tint(255, 126);// Apply transparency to the video without changing color
  image(myMovie,0,0);
  ellipse(reddestX, reddestY, 30, 30);
  
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}