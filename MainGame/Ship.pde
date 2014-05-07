class Ship{
  
  float x, y, z, v;
  boolean north, south, west, east;
  int gw;
  int gh;
  boolean fire=false;
 
  final float SPD = .2, ROT = .05, ACCEL = .98;

  Ship(int SCREEN_HEIGHT,int SCREEN_WIDTH){
    gw = SCREEN_WIDTH;
    gh = SCREEN_HEIGHT;
 
    //x = gw/2-30;
    //y = gh/2-30;
    x = gw>>1;
    y = gh>>1;
  }
  
  
  void setKeys(int k, boolean decision) {
  if      (k == UP    | k == 'W')   north = decision;
  else if (k == DOWN  | k == 'S')   south = decision;
  else if (k == LEFT  | k == 'A')   west  = decision;
  else if (k == RIGHT | k == 'D')   east  = decision;
}



void setFire(){
  
  Projectile p = new Projectile(x,y,z);
  fire=true;
  projs.add(p);
  
  
}
 


void update(){
  
  v += (north? SPD : 0) - (south? SPD : 0);
  z += (east?  ROT : 0) - (west?  ROT : 0);
  
  x = (x + cos(z)*v);
  y = (y + sin(z)*v);
  
  if(x>gw-10) x=1;
  if(x<0) x=gw-10;
  if(y>gh-5) y=1;
  if(y<0) y=gh-10;

  v *= ACCEL;  
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
    //ellipse(x,y,70,70);
    popMatrix();
    if(fire==true){
 
      for (Projectile p : projs){     
      p.update();
      }
    }
  }
  else{
   text("Game Over" , gw/2,gh/2);
  } 
}


  
  
   
}
