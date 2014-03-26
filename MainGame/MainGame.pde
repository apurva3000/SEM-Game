/**
* sprint1
*/

import controlP5.*;

// static size for objects
static final int SCREEN_HEIGHT = 700;
static final int SCREEN_WIDTH = 1000;
static final int PLAYER_NAME_BOX_HEIGHT = 60;
static final int PLAYER_NAME_BOX_WIDTH = 500;
static final int SUBMIT_BOX_HEIGHT = 40;
static final int SUBMIT_BOX_WIDTH = 100;
static final int SPACESHIP_HEIGHT = 42;
static final int SPACESHIP_WIDTH = 65;

// Program status
static final int PLAYER_NAME_REQUEST_STA = 0;
static final int PLAYER_GREETING_STA = 1;
static final int GAME_START_STA = 2;

// Asteroid size options
static final int AST_LARGE_SIZE = 0;
static final int AST_MEDIUM_SIZE = 1;
static final int AST_SMALL_SIZE = 2;
static final int AST_EXTRA_SMALL_SIZE = 3;

static final int AST_NUM = 3;

// static strings
static final String GAME_NAME_STR = "FLAPPY SHIP ANGRY ASTEROIDS";
static final String ENTER_NAME_STR = "Please enter your name"; 
static final String PLAYER_GREETING_STR = "WELCOME TO THE ADVENTURE";

// time for display welcome screen
static final int WELCOME_DELAY_TIME = 2000;

<<<<<<< HEAD

Player player;
=======
>>>>>>> test

// global variables
String player_name_str = "";
int state = 0;
int now, time_delay;
PImage spaceship, space_bg, welcome_bg;
PImage ast_l, ast_m, ast_s, ast_xs;
ArrayList<Asteroid> asteroids;
Ship ship;
ControlP5 cp5;
Textlabel txtTimer;
long timer = -1;
StopWatchTimer sw;
boolean over = false;

/* 
 * Description: initialize and load image resources
 */
void initImages() {
  spaceship = loadImage("spaceship.png"); 
  space_bg = loadImage("space_background.png");
  welcome_bg = loadImage("welcome_background.png");
  ast_l = loadImage("asteroid_big.png");
  ast_m = loadImage("asteroid_medium.png");
  ast_s = loadImage("asteroid_small.png"); 
  ast_xs = loadImage("asteroid_xsmall.png");
}

/* 
 * Description: setup first asteroids
 */
void initAsteroids() {
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < AST_NUM; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float angle = random(0, 360);
    asteroids.add(new Asteroid(AST_LARGE_SIZE, x, y, angle));
  }
}

/* 
 * Description: setup function, will be called at first when program start
 */
void setup() {
  size(SCREEN_WIDTH,SCREEN_HEIGHT);
  // setup interface at starting point
  initForPlayerNameRequest();
  // load static images
  initImages();
  smooth();
  // initialize ship and asteroids
  ship = new Ship(height, width);
  initAsteroids();
}

/* 
 * Description: initialize interface to get player's name
 */
void initForPlayerNameRequest() {
     
  PFont font = createFont("Belwe_light.TTF", 40);
  
  cp5 = new ControlP5(this);
  
  // setup box for text               
  cp5.addTextfield("Player's name")
     .setPosition((width - PLAYER_NAME_BOX_WIDTH)/2, height/3 + 20)
     .setSize(PLAYER_NAME_BOX_WIDTH, PLAYER_NAME_BOX_HEIGHT)
     .setFont(font)
     .setAutoClear(false)
     ;
  
  // setup submit button     
  cp5.addBang("submit")
     .setPosition((width - SUBMIT_BOX_WIDTH)/2, height/3 + PLAYER_NAME_BOX_HEIGHT + 40)
     .setSize(SUBMIT_BOX_WIDTH,SUBMIT_BOX_HEIGHT)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;    
     
     sw = new StopWatchTimer();
     
     txtTimer = cp5.addTextlabel("label")
                    .setText("")
                    .setPosition(50,30)
                    .setColorValue(0xffffffff)
                    .setFont(createFont("Georgia",20))
                    ;
  textFont(font); 
}

/* 
 * Description: to check if the collision between 2 asteroid happens or not
 * Input: Asteroid a, b
 * Output: true if collision happens, false if not
 */
boolean isAstCollided(Asteroid a, Asteroid b) {
  if (a.isDestroyed == true || b.isDestroyed == true) return false;
  if ((a.xPos + a.x_size < b.xPos) ||
      (b.xPos + b.x_size < a.xPos) ||
      (a.yPos + a.y_size < b.yPos) ||
      (b.yPos + b.y_size < a.yPos)) return false;
  return true; 
}

/* 
 *To check the collision between the ship and the asteroids
 */
boolean isAstShipCollided(Asteroid a, Ship s) {
  
  if ((a.xPos + 50 <= s.x) ||
     (a.yPos  + 50 <= s.y) ||
     (s.x  + 50 <= a.xPos) ||
     (s.y  + 50 <= a.yPos)
     ) return false;
  return true; 
}




/* 
 * Description: will be called when the collision between 2 asteroids happens
 * Input: Asteroid a, b
 */
void handleAstCollision(Asteroid a, Asteroid b) {
   // reserve asteroids' coordinates
   float x1 = a.xPos; 
   float y1 = a.yPos;
   float x2 = b.xPos;
   float y2 = b.yPos;
   // destroy current asteroids
   a.destroyed();
   b.destroyed();
   // split it into smaller pieces
   if (a.type != AST_EXTRA_SMALL_SIZE) {
       asteroids.add(new Asteroid(a.type + 1, x1 + a.x_size/2, y1, a.angle - 45));
       asteroids.add(new Asteroid(a.type + 1, x1 - a.x_size/2, y1, a.angle + 35));
   }
   if (b.type != AST_EXTRA_SMALL_SIZE) {
       asteroids.add(new Asteroid(b.type + 1, x2 + b.x_size/2, y2, b.angle - 25));
       asteroids.add(new Asteroid(b.type + 1, x2 - b.x_size/2, y2, b.angle + 75));
   }   
}

/* 
 * Description: response for PLAYER_NAME_REQUEST_STA state
 */ 
void handlePlayerNameRequest() {
      background(0);
      fill(255);
      
      PFont font1 = createFont("Belwe.TTF", 50);
      
      textFont(font1);
      text(GAME_NAME_STR, width/2, height/5);
      
      textSize(30);
      textAlign(CENTER);
      text(ENTER_NAME_STR, width/2, height/3);
}

/* 
 * Description: response for PLAYER_GREETING_STA state
 */ 
void handlePlayerGreeting() {
      cp5.remove("submit");
      cp5.remove("Player's name");
      
      String player_name_str = player.getName();
      
      background(welcome_bg);
      fill(255);
<<<<<<< HEAD
      textSize(40);
      textAlign(CENTER, CENTER);
      
      text(PLAYER_GREETING_STR, 360, 100);
      text(player_name_str, 360, 150);
=======
      textSize(70);
      textAlign(CENTER);
      text(PLAYER_GREETING_STR, width/2, height/3);
      textSize(50);
      text(player_name_str, width/2, height/3 + 60);
>>>>>>> test
      // stop screen for a while
      if(millis()- now >= time_delay) {
        state = GAME_START_STA;
      }
      sw.start();
     
}

/* 
 * Description: response for GAME_START_STA state
 */ 
void handleGameStart() {
  ship.update();
  ship.display(over);
  
  if(timer!=0){
    timer = 59 - sw.getElapsedTimeSecs();
    txtTimer.setText("Time left: " + String.valueOf(timer));
  }
  else{
    sw.stop();
    over=true;
    timer = 0;
    text("Time Up",width/2,height/2-100);
  }
  
  
  // display asteroids
  for (int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).display();
    asteroids.get(i).move();
  }
  
  noLoop();
  // check if there are two asteroid collided with each other or not
  for (int i = 0; i < asteroids.size(); ++i) {
     for (int j = i+1; j < asteroids.size(); ++j) {      
       if (isAstCollided(asteroids.get(i), asteroids.get(j))) {          
           handleAstCollision(asteroids.get(i), asteroids.get(j));           
       }
     }
  }
  
  // Check for the collision between asteriod and ship
  if(over==false){
    for (int i = 0; i < asteroids.size(); ++i) {
      if (isAstShipCollided(asteroids.get(i), ship)) {
        //text("Collision",100,100);
        over = true;
        sw.stop();
    }
  }
  }
  
  
  loop();

}

/* 
 * Description: draw function, will be called continuously implicitly
 */
void draw() {
  switch (state) {
    case PLAYER_NAME_REQUEST_STA:
      handlePlayerNameRequest();
      break;
      
   case PLAYER_GREETING_STA:
      handlePlayerGreeting();
      break;
      
   case GAME_START_STA:
      handleGameStart();
  }
}


void keyPressed() {
  ship.mapMovement(keyCode, true);
}
 
void keyReleased() {
  ship.mapMovement(keyCode, false);
}

/* 
 * Description: handle event when Submit button is pushed
 */
public void submit() {
  String player_name_str = "";
  state = PLAYER_GREETING_STA;  
  // get the player's name
  player_name_str = cp5.get(Textfield.class,"Player's name").getText();
<<<<<<< HEAD
  print(player_name_str);
  
  player = new Player(player_name_str,0);
  
=======
>>>>>>> test
  now = millis();
  time_delay = WELCOME_DELAY_TIME;
}

