// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

import ddf.minim.*; //import minim library
import processing.sound.*;//import sound library

//CHANGED
//
char puseButton='p'; //verible for the pause button
char playButton='s'; // veriable for the play button

//CHANGED
//
Minim minim;
AudioPlayer player;
boolean play;
//CHANGED
//
SoundFile file1;
SoundFile file2;
//String audioName1 = "Dubsteps1.mp3";//audio file
String audioName2 = "DE.mp3"; //audio file for ball
//String path1;
String path2;




// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

//CHANGED
//
Environment environment;// Global variables for the Envoronment
Music music;// Global variables for the Music
//
//
//CHANGED
//
PImage photo1, photo2, photo3, photo4, photo_3, photo_4, photo5, photo6;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

//CHANGED
// The background colour during play (black)
color backgroundColor = color(120,237,234);//change the background color


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'q', 'z');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '8', '2');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  //CHANGED
  //
  //Create a new object into the variable environment
  environment=new Environment();
  //Create a new object into the variable music
  music=new Music();

  //CHANGED
  //
  photo1 = loadImage("pong.png");
  photo2= loadImage("ponghit.png");
  photo3 = loadImage("M1.png");
  //photo3 = loadImage("tt.jpg");
  photo4= loadImage("P1.png");
  photo_3= loadImage("M2.png");
  photo_4= loadImage("P2.png");
  photo5= loadImage("mount2.png");
  photo6= loadImage("sun.png");



  //CHANGED
  //
  minim=new Minim(this);
  player=minim.loadFile("Dubsteps1.mp3");//audio file for backgorund music
  //path1 = sketchPath(audioName1);
  // file1 = new SoundFile(this, path1);
  path2 = sketchPath(audioName2);
  file2 = new SoundFile(this, path2);
  // file1.play(); 
  //player.amp(0.5);
  player.setGain(0);//Trying to reduse the background music volume 
  player.play();//play background music
  
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);
  //CHANGED
  //
 environment.displayEnv();
 music.displyBar();
  

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  
  
  

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();

  //CHANGED
  // if P button press..Pause the game.. 
  if (key == puseButton) {
    noLoop();
  }
  // if S button press..Play the game..
  else if (key == playButton) {
    loop();
  }
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}

//CHANGED
//
void mousePressed() {
  //if mouse press on this area do the backgorund music pause function
  if (mouseX>610 && mouseX < 630 && mouseY > 455 && mouseY < 475) {
    // file1.stop();
    //file1.pause();
    //play = !play;
    player.pause();
  }
  //if mouse press on this area do the backgorund music play function
  else if (mouseX>580 && mouseX < 600 && mouseY > 455 && mouseY < 475) {
    // file1.play();
    player.play();
  }

  //if mouse press on this area pause the game and music
  if (mouseX>55 && mouseX < 76 && mouseY > 455 && mouseY < 475) {
    noLoop();
    player.pause();
  }
  //if mouse press on this area resume the game and music
  else if (mouseX>24 && mouseX < 40 && mouseY < 475 && mouseY > 455) {
    loop();
    player.play();
  }
}