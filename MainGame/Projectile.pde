class Projectile{   
    float projectile_speed = random(0.25, 0.5);
    
    float X,Y,Z;     // X,Y - position, Z - rotation
    float xPos,yPos; // Position for the projectile
    int gw,gh;       
    float Ox,Oy;     // Original coordinates 
    boolean isDestroyed=false; //Check if destroyed
    int type; // type of projectile: shooter - freezer - tractor
   
    /*
     * Description: Projectile's constructor
     * Input: x, y - position
     *        z - rotation
     *        t - type of projectile
     */
    Projectile(float x, float y, float z, int t){
        X=x;Y=y;Z=z;
        pushMatrix();
        translate(x,y);
        rotate(z);
        //ellipse(0,0,10,20);
        //triangle(x,y,x+30,y+30,x-30,y-30);
        popMatrix();
        gw = SCREEN_WIDTH;
        gh = SCREEN_HEIGHT;
        type = t;
    }
  
    /*
     * Description: update the position of projectile
     */
    void update(){
        if (isDestroyed == false) {
             if (xPos > 1200) { // Destroy the projectile upon crossing the border
                 isDestroyed = true;
                 if (tractor == true) {
                      ship.freeze(0); //Unfreeze the ship, if the tractor beam is over
                 } 
             } else {
                xPos=xPos+5;
                yPos=1;
                pushMatrix();
                translate(X,Y);
                rotate(Z);
                // display different types of weapons
                if (type == WEAPON_SHOOTER_TYPE) {
                   fill(255, 0, 0); 
                   ellipse(xPos,yPos,10,15);   
                } else if (type == WEAPON_FREEZER_TYPE) {
                   fill(0, 128, 255);
                   ellipse(xPos,yPos,10,15);
                } else if (type == WEAPON_TRACTOR_TYPE) {
                   fill(255, 255, 0);
                   // TODO: display the tractor beam
                   rect(0,0,xPos,10);
                }       
                fill (255, 255, 255);
                popMatrix();
                
                Ox = X + cos(Z) * xPos;
                Oy = Y + sin(Z) * xPos;
                //text(Oy,100,500);
            }        
        }
    }
  
    /*
     * Description: destroy projectile
     */
    void destroyed() {
        xPos = 1500;
        isDestroyed = true;  
    }
}

