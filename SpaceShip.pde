// ********************
// Space Invaders Game - Final Project
//
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************

// Class SpaceShip is a bas class for the player ship and enemy ship
// and provides basic functionality for drawing the a spaceship on the screen.
class SpaceShip {

  // Variables for position, shape and color of the ship.
  int x, y;
  String sprite[];
  color c = color(255);
  int cTime = 0;
  int lives;
  int pixelsize;


  // Updating the object and drawing it on the screen.
  void draw() {
    updateObj();
    drawSprite();
  }

  // Drawing the ship's shape.
  void drawSprite() {
    if (cTime > 0) {
      cTime--;
      if (cTime % 2 == 0) {
        c = color(255);
      } else {
        c = color(255, 0, 0);
      }
      if (cTime == 0) {
        c = color(255);
      }
    }
    fill(c);

    // Drwing pixels according to the values of the sprite string.
    for (int i = 0; i < sprite.length; i++) {
      String row = (String) sprite[i];
      for (int j = 0; j < row.length(); j++) {
        if (row.charAt(j) == '1') {
          rect(x + (j * pixelsize), y + (i * pixelsize), pixelsize, pixelsize);
        }
      }
    }
  }

  // Updating the object.
  // This methode is used to update player and the enemy ships.
  void updateObj() {
  }

  // Setting the flashing duration. 
  void flashColor(int time) {
    c = color(255, 0, 0);
    cTime = time;
  }
}