// ********************
// Space Invaders Game - Final Project
//
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************

// Class Player defines player's ship which uses Spaceship as a base class
// and extends its functionality.

class Player extends SpaceShip {

  boolean canShoot = true;
  int shootdelay = 0;
  boolean changeColor = false;


  // Constructor.
  Player(int tempPixelsize) {
    pixelsize = tempPixelsize;
    x = width/2;
    y = height - (10 * pixelsize);
    setTypeOne();
    lives = 3;
  }

  // Setting type 1 of the player's ship.
  void setTypeOne() {
    sprite    = new String[5];
    sprite[0] = "0010100";
    sprite[1] = "0110110";
    sprite[2] = "1111111";
    sprite[3] = "1111111";
    sprite[4] = "0111110";
  }


  // Setting type 2 of the player's ship.
  void setTypeTwo() {
    sprite    = new String[5];
    sprite[0] = "1001001";
    sprite[1] = "0110110";
    sprite[2] = "0011100";
    sprite[3] = "1110111";
    sprite[4] = "0110110";
  }

  // Updates the state of the object.
  void updateObj() {

    // Determins the game controls of the player's ship.
    if (keyPressed && keyCode == LEFT) {
      x = constrain(x - 4, 0, width);
    }
    if (keyPressed && keyCode == RIGHT) {
      x = constrain(x + 4, 0, width - 7 * pixelsize);
    }

    // Controlling if the playr's ship is shooting.
    if (keyPressed && keyCode == SHIFT && canShoot) {
      game.bullets.add(new Bullet(x+game.gridsize/2-pixelsize, y, pixelsize, false));
      laserSound.play(1, random(0.5, 0.9));
      canShoot = false;
      shootdelay = 0;
    }

    // Sets the interval between each shot.
    shootdelay++;
    if (shootdelay >= 10) {
      canShoot = true;
    }

    // Checks collision with enemy or bullet.
    if (collisionWithEnemy() || collisionWithBullet()) {
      if (lives > 0) {

        // Decreasing the lives after each hit by the bullet.
        lives--;

        // Flashing the color and playing appropriate sound.
        flashColor(30);
        if (lives > 0) {
          expSound.play(1, random(0.2, 0.8));
        } else {
          expSound2.play(1, random(0.2, 0.8));
        }
      }
    }
  }

  // Checks of if player's ship collided with the enemy's bullet.
  boolean collisionWithBullet() {
    for (int i = 0; i < game.bullets.size(); i++) {
      Bullet bullet = game.bullets.get(i);
      if (bullet.fromEnemy && bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
        game.bullets.remove(i);
        return true;
      }
    }

    return false;
  }


  // Checks of if player's ship collided with the enemy ship.
  boolean collisionWithEnemy() {
    for (Enemy enemy : game.enemies) {
      float dist = dist(x, y, enemy.x, enemy.y);
      if (dist < 5 * pixelsize) {
        return true;
      }
    }      
    return false;
  }
}