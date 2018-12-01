// ********************
// Space Invaders Game - Final Project
//
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************

// Class Enemy defines an enemy ship which uses Spaceship as a base class
// and extends its functionality.

class Enemy extends SpaceShip {


  // Constructor.
  Enemy(int xpos, int ypos, int tempPixelsize, int tempLives) {
    pixelsize = tempPixelsize;
    x = xpos;
    y = ypos;

    // A string array that represents the design of the enemy ship.
    sprite = new String[5];
    sprite[0] = "1011101";
    sprite[1] = "0101010";
    sprite[2] = "1111111";
    sprite[3] = "0101010";
    sprite[4] = "1000001";

    // Determines the amount of remaing lives of the enemy ship.
    lives = tempLives;
  }

  // Updates the state of the object.
  void updateObj() {

    // Moves the enemy ship once every 20 frames.
    if (frameCount%20 == 0) {
      x += game.direction * game.gridsize;
    }
    if (game.incy == true) {
      y += game.gridsize / 2;
    }

    // The ship shoots a bullet with a cetain probability defined below.
    int limit = 1800;
    float r = random(0, limit);
    if (r > limit-1) {
      game.bullets.add(new Bullet(x, y, pixelsize, true));
      laserSound2.play(1, random(0.4, 0.9));
    }
  }

  // Checks if the object was het by a bullet.
  boolean collisionWithBullet() {
    for (int i = 0; i < game.bullets.size(); i++) {
      Bullet bullet = game.bullets.get(i);
      if (!bullet.fromEnemy && bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
        game.bullets.remove(i);
        return true;
      }
    }
    return false;
  }

  // Keeps the enemy ship inside the game screen.
  boolean outside() {
    if (x + (game.direction * game.gridsize) < 0 || x + (game.direction * game.gridsize) > width - game.gridsize) {
      return true;
    } else {
      return false;
    }
  }
}