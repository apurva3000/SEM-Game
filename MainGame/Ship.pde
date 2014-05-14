class Ship{
  
  float x, y, z, v;                 // x,y - position; z - rotation; v - velocity
  boolean north, south, west, east; // direction
  int gw;                           // width limit
  int gh;                           // height limit 
  boolean fire = false;             // indicate if Ship is firing or not
  int pt_type;                      // type of projectiles - shooter/freezer/tractor 
  boolean freeze =  false;          // Ship is freezed or not (using when it is using tractor weapon)
 
  final float SPD = .2, ROT = .05, ACCEL = .98;  // speed, roation, accelerate values

  /*
   * Description: Ship's constructor
   */
  Ship(int SCREEN_HEIGHT,int SCREEN_WIDTH, int t) {
      gw = SCREEN_WIDTH;
      gh = SCREEN_HEIGHT;
   
      x = gw>>1;
      y = gh - 100;
      pt_type = t; // default projectile
  }
  
  /*
   * Description: set the direction for the ship
   */ 
  void setKeys(int k, boolean decision) {
      if      (k == UP    | k == 'W')   north = decision;
      else if (k == DOWN  | k == 'S')   south = decision;
      else if (k == LEFT  | k == 'A')   west  = decision;
      else if (k == RIGHT | k == 'D')   east  = decision;
  }

  /*
   * Description: Ship set a fire
   */  
  void setFire(){
      Projectile p = new Projectile(x, y, z, pt_type);
      projs.add(p);
      fire=true;  
  }

  /*
   * Description: set the type of projectile
   */    
  void setProjectile(int type) {
       pt_type = type; 
  }


  /*
   * Description: update the ship's position
   */    
  void update(){    
      if (freeze == false) {
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
  }

  /*
   * Description: display the ship
   */    
  void display(boolean over) {
      background(space_bg);
      
      if (over == false) {
          pushMatrix();
          translate(x, y);
          rotate(z);
          image(spaceship, -5,-5,50,50);
          spaceship.loadPixels();
          int loc = int(x) + int(y*spaceship.width);
          popMatrix();
          if(fire == true){ 
              for (Projectile p : projs){     
                  p.update();
              }
          }
      }
      else {
         state = GAME_END_STA;
      } 
  }
  
  /*
   * Description: reeze or Unfreeze the ship during tractor beam
   */   
   void freeze(int state){
       if(state==1)
         freeze=true;
       else
         freeze=false;
   }
}
