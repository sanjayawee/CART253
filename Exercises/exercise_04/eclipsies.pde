class Eclipies{



  int maxEnergy =255;
  int moveEnergy = -1;
  int collideEnergy = 10;

  int x;
  int y;
  int size;
  int energy;
  color fill = color(0, 255, 14);


  Eclipies(int tempX, int tempY, int tempSize) {

    x=tempX;
    y=tempY;
    size=tempSize;
    energy = maxEnergy;
  }

  void EclUpdate() {

  //  if (energy == 0 ) {
   //   return;
   // }

    int xMoveType = floor(random(1, 3));
    int yMoveType = floor(random(1, 3));
    x+=size*xMoveType;
    y+=size*yMoveType;

    if (x<0) {
      x+=width;
    } else if (x>=width) {
      x-=width;
    }
    if (y<0) {
      y+=height;
    } else if (y>=height) {
      y-=height;
    }

    energy+=moveEnergy;

    energy = constrain(energy, 0, maxEnergy);
  }

  void collide(Griddie other) {

    if (energy == 0 || other.energy == 0) {

      return;
    }
    if (x == other.x && y== other.y) {

      energy+=collideEnergy;
      energy = constrain(energy, 0, maxEnergy);
    }
  }




  void EclDisplay() {
    fill(fill, energy);
    noStroke();
    ellipse(x, y, size, size);
  }


}