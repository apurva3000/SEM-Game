
class Asteroid {
   //int id; // identifier for asteroid
   int type; // asteroid types: large, medium, small, and extra-small
   int x_size, y_size; // size of asteroid
   PImage ast_img; // image source of asteroid
   float xPos; // x - coordinate
   float yPos; // y - coordinate
   float angle; // asteroid's angle
   float speed; // asteroid's speed
   boolean isDestroyed; // idicate whether this asteroid was destroyed or not
   
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
   }
   
   /*
    * Description: display asteroid
    */
   void display() {
    //display asteroid
    if(isDestroyed) return; // do nothing if it was destroyed
    image(ast_img, xPos, yPos);  
    move();
  }
  
  /*
   * Description: re-calculate coordinate when it is moving
   */
  void move() {
    if (isDestroyed) return; // do nothing if it was destroyed
    
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
 
  /*
   * Description: destroy asteroid
   */
  void destroyed() {
    xPos = -1000;
    speed = 0;
    isDestroyed = true;
  }
}
