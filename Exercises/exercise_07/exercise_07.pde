//in this exercise, I'm trying to do a Audio React Visualizer.


//importing processing minim library
import ddf.minim.analysis.*;
import ddf.minim.*;

PImage im1, im2, im3, im4, im5;
PImage im11, im22, im33, im44;

Minim minim;//Declare a minim object
UI ui;//Declare a ui object
AudioPlayer player1;
AudioPlayer player2;

FFT fft;
FFT fft2;
int bandsPerOctave = 2;

boolean play;
//String path2;


void setup() {


  size(640, 480);
  ui = new UI();//Initialize ui object
  minim = new Minim(this);//Initialize minim object
  player1=minim.loadFile("xxx.mp3", 1024);//load the sound file
  player2=minim.loadFile("xx.mp3", 1024);


  fft = new FFT(player1.bufferSize(), player1.sampleRate());
  fft2 = new FFT(player2.bufferSize(), player2.sampleRate());
  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into a number of bands
  fft.logAverages(22, bandsPerOctave);
fft2.logAverages(22, bandsPerOctave);

  im1=loadImage("play.png");
  im2=loadImage("puser.png");
  im3=loadImage("stop.png");
  im4=loadImage("forward.png");
  im5=loadImage("cover.png");


  im11=loadImage("play1.png");
  im22=loadImage("puser1.png");
  im33=loadImage("stop1.png");
  im44=loadImage("forward1.png");
}

void draw() {

  background(255);



  // perform a forward FFT on the samples in song's mix buffer
  fft.forward(player1.mix);
  fft2.forward(player2.mix);

  for (int i = 0; i < fft.avgSize(); i++)
  {
    // get the amplitude of the frequency band
    float amplitude = fft.getAvg(i);

    //change the fill color 
    fill(0*amplitude);
    noStroke();

    //create circles in random loactions.
    //change size according to the amplitude
    ellipse(random(width), random(height), 1*amplitude, 1*amplitude);

    //create
    rectMode(CORNER);
    rect(165, height/2+60, 0.4*amplitude, 3);
    rect(165, height/2+65, 0.6*amplitude, 3);
    rect(165, height/2+70, 0.8*amplitude, 3);
    rect(165, height/2+75, 1*amplitude, 3);
    ui.display();//call display funtion in UI class
  }
}


void mousePressed() {

  //Mouse Pressed
  //
  //If mouse pressed on this areas do following funtions.
  if (mouseX<width/2+15 && mouseX > width/2-15 && mouseY > height/2+25-15 && mouseY < height/2+25+15) {
    //play
    player1.play();
  }
  if (mouseX < width/2+40+15 && mouseX > width/2+40-15 && mouseY > height/2+25-15 && mouseY < height/2+25+15) {
    //pause
    player1.pause();
    player2.pause();
  }

  if (mouseX < width/2+80+15 && mouseX > width/2+80-15 && mouseY > height/2+25-15 && mouseY < height/2+25+15) {
    //close the player 1 and 2
    player1.close();
    player2.close();
  }

  if (mouseX < width/2+120+15 && mouseX > width/2+120-15 && mouseY > height/2+25-15 && mouseY < height/2+25+15) {
    //pause
    player1.pause();
    player2.play();
  }
}