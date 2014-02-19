/**
* sprint1
*/

import controlP5.*;

// static size for objects
static final int SCREEN_HEIGHT = 400;
static final int SCREEN_WIDTH = 700;
static final int PLAYER_NAME_BOX_HEIGHT = 40;
static final int PLAYER_NAME_BOX_WIDTH = 200;
static final int SUBMIT_BOX_HEIGHT = 40;
static final int SUBMIT_BOX_WIDTH = 80;
static final int SPACESHIP_HEIGHT = 42;
static final int SPACESHIP_WIDTH = 65;

// Program status
static final int PLAYER_NAME_REQUEST_STA = 0;
static final int PLAYER_GREETING_STA = 1;
static final int GAME_START_STA = 2;

// static strings
static final String ENTER_NAME_STR = "Please enter your name"; 
static final String PLAYER_GREETING_STR = "WELCOME TO THE ADVENTURE";

static final int WELCOME_DELAY_TIME = 2000;

String player_name_str = "";

int state = 0;
ControlP5 cp5;
int now, time_delay;
PImage spaceship, space_bg, welcome_bg;

void setup() {
  size(SCREEN_WIDTH,SCREEN_HEIGHT);
  initForPlayerNameRequest();
  spaceship = loadImage("spaceship.png"); 
  space_bg = loadImage("space_background.png");
  welcome_bg = loadImage("welcome_background.png");
}

void initForPlayerNameRequest() {
     
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
                 
  cp5.addTextfield("Player's name")
     .setPosition((SCREEN_WIDTH - PLAYER_NAME_BOX_WIDTH)/2, 120)
     .setSize(PLAYER_NAME_BOX_WIDTH,PLAYER_NAME_BOX_HEIGHT)
     .setFont(font)
     .setAutoClear(false)
     ;
       
  cp5.addBang("submit")
     .setPosition((SCREEN_WIDTH - SUBMIT_BOX_WIDTH)/2,180)
     .setSize(SUBMIT_BOX_WIDTH,SUBMIT_BOX_HEIGHT)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;    
     
  textFont(font); 
}
 
void handlePlayerNameRequest() {
      background(0);
      fill(255);
      textAlign(CENTER);
      text(ENTER_NAME_STR, 360, 100);
}

void handlePlayerGreeting() {
      cp5.remove("submit");
      cp5.remove("Player's name");
      background(welcome_bg);
      fill(255);
      textSize(40);
      textAlign(CENTER, CENTER);
      text(PLAYER_GREETING_STR, 360, 100);
      text(player_name_str, 360, 150);
      // stop screen for a while
      if(millis()- now >= time_delay) {
        state = GAME_START_STA;
      } 
}

void handleGameStart() {
     background(space_bg);
//     translate((SCREEN_WIDTH - SPACESHIP_WIDTH)/2, SCREEN_HEIGHT - SPACESHIP_HEIGHT - 30);
//     rotate(PI/2);
//     translate(-(SCREEN_WIDTH - SPACESHIP_WIDTH)/2, -(SCREEN_HEIGHT - SPACESHIP_HEIGHT - 30));
     image(spaceship, (SCREEN_WIDTH - SPACESHIP_WIDTH)/2, SCREEN_HEIGHT - SPACESHIP_HEIGHT - 30);
}

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



public void submit() {
  state = PLAYER_GREETING_STA;  
  player_name_str = cp5.get(Textfield.class,"Player's name").getText();
  print(player_name_str);
  now = millis();
  time_delay = WELCOME_DELAY_TIME;
}

