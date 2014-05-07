class Projectile{
 
 
 float projectile_speed = random(0.25, 0.5);
 float X,Y,Z;
 float xPos,yPos; // Position for the projectile
 int gw,gh;
 float Ox,Oy; // Original coordinates 
 boolean isDestroyed=false; //Check if destroyed
 
 //Constructor Class based on X,Y and rotation Z
Projectile(float x, float y, float z){
   X=x;Y=y;Z=z;
   pushMatrix();
   translate(x,y);
   rotate(z);
   //ellipse(0,0,10,20);
  //triangle(x,y,x+30,y+30,x-30,y-30);
  popMatrix();
    gw = SCREEN_WIDTH;
    gh = SCREEN_HEIGHT;
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
       ellipse(xPos,yPos,10,15);
   
       popMatrix();
  
       Ox = X + cos(Z) * xPos;
       Oy = Y + sin(Z) * xPos;
       //text(Ox,100,500);
       //text(Oy,100,600);
       text(Oy,100,500);
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

