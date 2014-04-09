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
  
/** The ship constructor for contructing the ship on screen **/
  Ship(int SCREEN_HEIGHT,int SCREEN_WIDTH){
    wid = SCREEN_WIDTH;
    hei = SCREEN_HEIGHT;
 
    x = wid/2-30;
    y = hei/2-30;
   
  }
  
  /** Map the keys from keyboard into direction and velocty**/
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
 

/** Update the ship based on key movements**/
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
<<<<<<< HEAD
  v  = v*Acceleration;
  
  
  
=======
  v *= ACCEL;  
>>>>>>> test
=======
  v *= ACCEL;  
>>>>>>> c457622bbdc905664087194293ca3eb700e7f9a0
}
 
void display(boolean over) {
  background(space_bg);
  
<<<<<<< HEAD
  /** If game is still running, do the normal functionality**/
=======
>>>>>>> c457622bbdc905664087194293ca3eb700e7f9a0
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
<<<<<<< HEAD
  /**Else display game over for now**/
=======
>>>>>>> c457622bbdc905664087194293ca3eb700e7f9a0
  else{
   text("Game Over" , gw/2,gh/2);
  } 
  text(brightness(spaceship.pixels[100]),500,500);
}


  
  
<<<<<<< HEAD
<<<<<<< HEAD
 
=======
   
>>>>>>> test
=======
   
>>>>>>> c457622bbdc905664087194293ca3eb700e7f9a0
}
