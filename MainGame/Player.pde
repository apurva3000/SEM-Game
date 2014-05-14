class Player {  
    String name;  // player's name
    int score;    // player's score
    
    /*
     * Description: Player's constructor
     * Input: name - player's score
     *        score - player's name
     */ 
    Player(String name, int score){    
        this.name = name;
        this.score = score;    
    }
    
    /*
     * Description: update player's score
     */
    void updateScore(){    
        this.score = this.score+1;    
    }
    
    /*
     * Description: set player's score
     */
    void setScore(int score){    
        this.score = score;    
    }
    
    /*
     * Description: get player's name
     */
    String getName(){   
       return this.name;   
    }
    
    /*
     * Description: get player's score
     */
    int getScore(){   
       return this.score;     
    }  
  
}
