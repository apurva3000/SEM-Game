class Player {
  
  String name;
  int score;
  
  
  Player(String name, int score){
    
    this.name = name;
    this.score = score;
    
    
  }
  
  void updateScore(){
    
    this.score = this.score+1;
    
  }
  
  void setScore(int score){
    
    this.score = score;
    
  }
  
  String getName(){
    
   
   return this.name;
   
  }
  
  
  int getScore(){
    
   
   return this.score; 
    
  }
     
 
  
  
}
