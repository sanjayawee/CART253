class Eclipies{



  int maxEnergy =255;
  int moveEnergy = -1;
  int collideEnergy = 10;
  int collideSize = 5;

  int xx;
  int yy;
  int size;
  int energy;
  
  float r=round(random(0,255));
  float g=round(random(0,255));
  float b=round(random(0,255));
  
  
  color fill = color(0,255,100);
  //color fill = color(r,g,b);
 
  Eclipies(int tempX, int tempY, int tempSize) {

    xx=tempX;
    yy=tempY;
    size=tempSize;
    energy = maxEnergy;
  }

  void EclUpdate() {

    if (energy == 0 ) {
      return;
   }

    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    xx+=size*xMoveType;
    yy+=size*yMoveType;

    if (xx<0) {
      xx+=width;
    } else if (xx>=width) {
      xx-=width;
    }
    if (yy<0) {
      yy+=height;
    } else if (yy>=height) {
      yy-=height;
    }

    energy+=moveEnergy;

    energy = constrain(energy, 0, maxEnergy);
  }

  void collide(Eclipies other) {

    if (energy == 0 || other.energy == 0) {

      return;
    }
    if (xx == other.xx && yy== other.yy) {

      energy+=collideEnergy;
      energy = constrain(energy, 0, maxEnergy);
      //size+=collideSize;
      //color fill = color(r,g,b);
      
    }
    
  }




  void EclDisplay() {
    fill(fill, energy);
    noStroke();
    ellipse(xx,yy,size,size);
    
  }


}