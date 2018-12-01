// ********************
// Space Invaders Game - Final Project
// Main game class
// The purpose of the game is to shoot down as many enemy ships as possible 
// and at the same time, not to let the enemies to destroy the player's ship. 
// Player initially is given three lives. The enemies are coming in waves. Each time
// the player destroys all ships in a single wave it is being granted one extra live.
// Each consecutive wave of enemy ships is harder to kill as each of enemy ships is getting
// an extra live too.
// Game controls for the player are Left and Right arrows to move the ship and SHIFT key to shoot.
// 
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************


// Importing sound library.
import processing.sound.*;


// Declaring game objects. 
GameMenue gameMenue;
Game game;

// Declaring game state.
String gameState;

// Declaring game font.
PFont gameFont;


// Declaring individual sound files. 
SoundFile gameMusic = null;
SoundFile menuMusic = null;
SoundFile laserSound = null;
SoundFile laserSound2 = null;
SoundFile buttonSound = null;
SoundFile expSound = null;
SoundFile expSound2 = null;


// Game setup.
void setup() {

  // Creating the font
  gameFont = createFont("Krungthep", 32);
  textFont(gameFont);

  // Setting the screen.
  background(0);
  size(600, 800, FX2D);

  // Initializing the sounds.
  laserSound = new SoundFile(this, "laser3.wav");
  laserSound2 = new SoundFile(this, "laser1.wav");
  buttonSound = new SoundFile(this, "button.aif");
  expSound = new SoundFile(this, "exp3.wav");
  expSound2 = new SoundFile(this, "exp2.wav");

  // Initializing main game objects (game menue and game play).
  gameState = "START";
  gameMenue = new GameMenue();
  game = new Game();
}


// Draw loop.
void draw() { 
  background(0);

  // Controlling the music in menue and game play.
  if (gameState != "PLAY") {
    if (gameMusic != null) {
      gameMusic.stop();
      gameMusic = null;
    }
    if (menuMusic == null) {
      menuMusic = new SoundFile(this, "intro.mp3");
      menuMusic.loop();
    }
  } else {
    if (menuMusic != null) {
      menuMusic.stop();
      menuMusic = null;
    }
    if (gameMusic == null) {
      gameMusic = new SoundFile(this, "gamePlay.mp3");
      gameMusic.loop();
    }
  }

  // Drawing various states of the game and game menue.
  if (gameState == "START") {
    gameMenue.startGame();
  } else if (gameState == "LOSE") {
    gameMenue.loseGame();
  } else if (gameState == "CHOOSE") {
    gameMenue.choosePlayer();
  } else if (gameState == "BEGIN") {
    gameMenue.beginGame();
  } else if (gameState == "PLAY") {
    game.draw();
  }
}