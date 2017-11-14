class UI {

  void display() {
    mousehanddle();//call mouse handdle function
    
    //Create player UI and add cover
    //
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 310, 110 );
    rectMode(CORNER);
    imageMode(CORNER);
    image(im5, 165, 185);
    
    //Song title and the artist name
    //
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text("Lines of the Broken", width/2+60, height/2-20);
    textSize(16); 
    text("San Holo", width/2+60, height/2-5);


    //Add play,pause,stop,forward buttons
    //
    fill(255, 0, 0);
    ellipseMode(CENTER);
    imageMode(CENTER);
    image(im1, width/2, height/2+25);
    image(im2, width/2+40, height/2+25);
    image(im3, width/2+80, height/2+25);
    image(im4, width/2+120, height/2+25);
  }
}

void mousehanddle() {
  
  
  //
  //
  if (mouseX<width/2+15 && mouseX > width/2-15 && mouseY > height/2+25-15 && mouseY < height/2+25+15) {
    text("PLAY MUSIC", 100, 100);
    image(im44, width/2, height/2+25);
  }
  if (mouseX < width/2+40+15 && mouseX > width/2+40-15 && mouseY > height/2+25-15 && mouseY < height/2+25+15) {
    text("PAUSE MUSIC", 100, 100);
    image(im33, width/2+40, height/2+25);
  }

  if (mouseX < width/2+80+15 && mouseX > width/2+80-15 && mouseY > height/2+25-15 && mouseY < height/2+25+15) {
    text("STOP MUSIC ", 100, 100);
    image(im11, width/2+80, height/2+25);
  }

  if (mouseX < width/2+120+15 && mouseX > width/2+120-15 && mouseY > height/2+25-15 && mouseY < height/2+25+15) {
    text("NEXT MUSIC", 100, 100);
    image(im22, width/2+120, height/2+25);
  }
}