class Environment{

  //CHANGED
  //
  //veriable for backgound moving images
  float x=-160;
  float y=420;
  float vx=0.4;
  float s=width/2+100;
  float n=height;
  float nVX=0.1;

  
  void displayEnv(){
    
    //image for the Mountines
    image(photo6,s,n);
    
    n=n-nVX;
    
    //image for the Sun
    image(photo5,x, y);
    
    x=x+vx;
  
  }
  

}