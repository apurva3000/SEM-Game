class Projectile{
 
 
 float projectile_speed = random(0.25, 0.5);
 float X,Y,Z;
 float xPos,yPos; // Position for the projectile
 int gw,gh;
 float Ox,Oy; // Original coordinates 
 boolean isDestroyed=false; //Check if destroyed
 int type;
 
 //Constructor Class based on X,Y and rotation Z
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


void update(){
  if(isDestroyed==false){
   if(xPos>1200){
     isDestroyed=true;
   }
   else{
      xPos=xPos+5;
      yPos=1;
       pushMatrix();
       translate(X,Y);
       rotate(Z);
       // display different type of weapons
       if (type == WEAPON_SHOOTER_TYPE) {
         fill(255, 0, 0); 
        ellipse(xPos,yPos,10,15);   
       } else if (type == WEAPON_FREEZER_TYPE) {
         fill(0, 128, 255);
         ellipse(xPos,yPos,10,15);
       } else if (type == WEAPON_TRACTOR_TYPE) {
         fill(0, 255, 0);
         // TODO: display the tractor beam
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

