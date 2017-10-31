//Polliwogs
//
// A class defining the behavior of a single polliwog


class Polliwog {

  //position,size,movespeed,and noise time
  int polliX;
  int polliY;
  int polliSize;
  // float theta = 0.0;
  float easing =0.05;
  int polliSpeed =5;
  //give the Independent value to the polliT & polliTT
  float polliT = random(0, 100);
  float polliTT = random(0, 100);
  float polliVX;
  float polliVY;

// Set up the Polliwogs with the location and size
  Polliwog(int tempx, int tempy, int tempSize) {


    polliX=tempx;
    polliY=tempy;
    polliSize=tempSize;
  }
  
//Polliwogs Update
//
  void update() {

    //Math Tricks
    //
    //add noice function to the polliwog's velocity
    //polliwog moves smoothly and randomly
    polliVX = polliSpeed * (noise(polliT)*2 -1 );
    polliVY = polliSpeed * (noise(polliTT)*2-1);
   
   // polliVX = polliSpeed * (random(-1,2));
   // polliVY = polliSpeed * (random(-1,2));

    polliX+=polliVX;
    polliY+=polliVY;


//prevent the polliwogs to go off the screen
    if (polliX < 0) {
      polliX += width;
    } else if (polliX >= width) {
      polliX -= width;
    }
    if (polliY < 0) {
      polliY += height;
    } else if (polliY >= height) {
      polliY -= height;
    }
    polliT += 0.01;
    polliTT += 0.01;

    mouseFollow();//call the mouse follow function
  }

  //display Polliwog
  //
  void display() {
    //translate(width/2,height/2);
    //translate(250,200);
    // rotate(theta);
    rectMode(CENTER);
    //theta += 0.01;
    //rotate(theta1);
    imageMode(CENTER);
    image(photo1, polliX, polliY);
    //rect(polliX,polliY,ballsize,ballsize);
  }

  //
  //mouseFollow function
  //
  void mouseFollow() {

    // if LEFT mouse button pressed
    if (mousePressed && (mouseButton == LEFT)) {
      //
      //gather all the polliwog in to the mouse pointer
      //if Left mouse button press,targetX equal to the mouseX
      float targetX = mouseX;
      //create new postion for polliwog
      float dx = targetX - polliX;
      //keep distance from the mouse pointer
      polliX += dx * easing ;

      float targetY = mouseY;
      float dy = targetY - polliY;
      polliY += dy * easing;

      polliSpeed=10;//change the speed

      image(photo2, mouseX, mouseY);//Put a image on mouse pointer
    } 

    //if RIGHT mouse button pressed
    else if (mousePressed && (mouseButton == RIGHT)) {

      polliSpeed=30;//change the speed of polliwogs
      collision();//call the collision function
      image(photo3, mouseX, mouseY);//Put a another image on mouse pointer
    } else {

      polliSpeed=15;//default speed
    }
  }

  //Calculate the area of the Perdator
  void collision() {
    boolean leftSideX = (polliX > mouseX-160 );
    boolean rightSideX = (polliX  < mouseX+160);
    boolean topY = (polliY > mouseY-160);
    boolean bottomY = (polliY < mouseY+160);

    //check if the polliwogs enter the predator area
    if (leftSideX && rightSideX && topY && bottomY) {
      //And polliwogs move opposite side or keep away from predator
      polliX=polliX-15;
      polliY=polliY-15;
    }
  }
}