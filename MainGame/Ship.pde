class Ship{
  
  float x, y, z, v;
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  
  int wid;
  int hei;
 
  float Acceleration = 0.98;
  float Speed = 0.2;
  float Rotation = 0.05;
  

  Ship(int SCREEN_HEIGHT,int SCREEN_WIDTH){
    wid = SCREEN_WIDTH;
    hei = SCREEN_HEIGHT;
 
    x = wid/2-30;
    y = hei/2-30;
   
  }
  
  
  void mapMovement(int keycode, boolean choice) {
  if (keycode == UP)
    up = choice;
  else if (keycode == DOWN)
    down = choice;
  else if (keycode == LEFT)
    left  = choice;
  else if (keycode == RIGHT)
    right  = choice;
}
 


void update(){
  
  v  = v + (up? Speed : 0) - (down? Speed : 0);
  z  = z +  (right?  Rotation : 0) - (left?  Rotation : 0);
  
  x = (x + cos(z)*v);
  y = (y + sin(z)*v);
  
  if(x>wid-10) x=1;
  if(x<0) x=wid-10;
  if(y>hei-5) y=1;
  if(y<0) y=hei-10;

<<<<<<< HEAD
  v  = v*Acceleration;
  
  
  
=======
  v *= ACCEL;  
>>>>>>> test
}
 
void display(boolean over) {
  background(space_bg);
  
  if(over==false){
    pushMatrix();
    translate(x, y);
    rotate(z);
    image(spaceship, -5,-5,50,50);
    spaceship.loadPixels();
    int loc = int(x) + int(y*spaceship.width);
    //text(x,50,50);
    
    popMatrix();
  }
  else{
   text("Game Over" , gw/2,gh/2);
  } 
  text(brightness(spaceship.pixels[100]),500,500);
}


  
  
<<<<<<< HEAD
 
=======
   
>>>>>>> test
}
