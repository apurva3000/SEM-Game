
class Asteroid {
   int type;             // asteroid types: large, medium, small, and extra-small
   int x_size, y_size;   // size of asteroid
   PImage ast_img;       // image source of asteroid
   float xPos;           // x - coordinate
   float yPos;           // y - coordinate
   float angle;          // asteroid's angle
   float speed;          // asteroid's speed
   boolean isDestroyed;  // indicate whether this asteroid was destroyed or not
   boolean isMoving;     // indicate if the Asteroid is moving or not
   boolean isPulled;     // indicate if the asteroid is pulled toward the ship or not
   
   float X,Y,Z;
   Projectile p;
   /*
    * Description: Asteroid's constructor
    */
   Asteroid (int s, float tempXPos, float tempYPos, float a) {
      type = s;
      switch(type) {
      case AST_LARGE_SIZE:
         ast_img = ast_l;
         speed = random(0.25, 0.5);
         break;
      case AST_MEDIUM_SIZE:
         ast_img = ast_m;
         speed = random(0.5, 0.7);
         break;
      case AST_SMALL_SIZE:
         ast_img = ast_s;
         speed = random(0.7, 0.9);
         break;
      default:
         ast_img = ast_xs;
         speed = random(0.9, 1);
      }
      
      x_size = ast_img.width;
      y_size = ast_img.height;
      xPos = tempXPos;
      yPos = tempYPos;
      angle = a;
      isDestroyed = false;
      isMoving = true;
   }
   
   /*
    * Description: display asteroid
    */
   void display() {
      //display asteroid
      if(isDestroyed) return; // do nothing if it was destroyed
      
      if (isPulled==true) {
          if(p.isDestroyed==true){ 
              isPulled=false;
              isMoving=true;
              xPos = Ox;
              yPos = Oy;
          } else
              pull();
      }
      else {        
          image(ast_img, xPos, yPos);  
          if (isMoving) move(); // update the asteroid's position if it is moving
      }
    }
  
    /*
     * Description: freeze the asteroid
     */
    void freeze() {
       isMoving = false; 
    }
 
 
   // Pull the asteroid towards sh 
    void startPull(Projectile p){    
       this.p = p;
       
       isPulled = true;
       isMoving = false; 
       this.X = p.X;
       this.Y = p.Y;
       this.Z = p.Z;    
    }
    
    /*
     * Description: re-calculate coordinate when it is moving
     */
    void move() {
        if (isDestroyed || !isMoving) return; // do nothing if it was destroyed or freezed
        //text(xPos,100,100);
        //text(yPos,100,200);
        xPos = xPos + speed*cos(radians(angle));
        yPos = yPos + speed*sin(radians(angle));
        
        if (xPos > width) {
            xPos = 0 - x_size;
        }
        if (xPos < 0 - x_size) {
            xPos = width;
        }
        if (yPos > height) {
           yPos = 0 - y_size;
        }
        if (yPos < 0 - y_size) {
           yPos = height;
        }
    }
   
   
    float xPosPull=0;
    float yPosPull=0;
    float Ox;
    float Oy;
  
  
    /*
     * Description: pull asteroid towards the ship
     */
     void pull(){
         xPosPull = xPosPull - 0.5;
         yPosPull = 1;
         pushMatrix(); 
         translate(xPos,yPos);
         rotate(Z);
         image(ast_img, xPosPull, yPosPull);
         popMatrix();
         
         //The coordinates in original dimensions
         Ox = xPos + cos(Z) * xPosPull;
         Oy = yPos + sin(Z) * xPosPull;     
     }
   
    /*
     * Description: destroy asteroid
     */
    void destroyed() {
        xPos = -1000;
        speed = 0;
        isDestroyed = true;
    }
}
