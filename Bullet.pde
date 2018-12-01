// ********************
// Space Invaders Game - Final Project
//
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************

// Class Bullet defines the bullet Player and Enemies are shooting at eachother.

class Bullet {

  // Position and size of the bullet.
  int x, y, size;

  // Determines the direction of the bullet.
  boolean fromEnemy = false;


  // Constructor.
  Bullet(int xpos, int ypos, int tempSize, boolean fromEnemyTmp) {
    x = xpos;
    y = ypos;
    size = tempSize;
    fromEnemy = fromEnemyTmp;
  }


  // Updating position and drawing the bulltet.
  void draw() {
    fill(255);
    rect(x, y, size, size);
    if (!fromEnemy) {
      y -= size;
    } else {
      y += size;
    }
  }
}