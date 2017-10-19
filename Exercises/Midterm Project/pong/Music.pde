class Music {

  //CHANGED
  //variable for Floor
  int floorX=width/2;
  int floorY=height-15;


//CHANGED
//
  void displyBar() {
    //Add a bar to the game
    fill(255);
    rect(floorX, floorY, 640, 30);//
    imageMode(CENTER);
    // photo3.resize(30,30);
    image(photo3, width-20, floorY);

    image(photo4, width-50, floorY);
    mousehanddle();//call the mousehandel1
    fill(0);
    triangle(24, 455, 24, 475, 40, 465);

    rect(60, 465, 6, 20);
    rect(70, 465, 6, 20);
    mousehandel2();//call the mousehandel2
  }

//CHANGED
//
//if mouse point touch this areas change the images and show text
//hover images
void mousehanddle() {
  if (mouseX>610 && mouseX < 630 && mouseY > 455 && mouseY < 475) {
    text("STOP MUSIC", width/2, height/2);
    //rect(width/2,height/2,50,50);
    image(photo_3, width-20, floorY);
  }
  if (mouseX>580 && mouseX < 600 && mouseY > 455 && mouseY < 475) {
    text("PLAY MUSIC", width/2, height/2);
    image(photo_4, width-50, floorY);
  }
}
//CHANGED
//
//if mouse pointtouch this areas chnage the size of the rectangle,triangle and show texts
void mousehandel2() {
  if (mouseX>55 && mouseX < 76 && mouseY > 455 && mouseY < 475) {
    text("PAUSE GAME or PRESS P", width/2, height/2);
    rect(60, 465, 8, 22);
    rect(70, 465, 8, 22);
  }
  if (mouseX>24 && mouseX < 40 && mouseY < 475 && mouseY > 455) {
    text("PLAY GAME or PRESS S", width/2, height/2);
    triangle(28, 458, 27, 478, 43, 468);
  }
  
 }

}