// ********************
// Space Invaders Game - Final Project
//
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************

// Class game controles the actual game play of the game.

class Game {

  // Variables that controle the game grid, size, score, and other necessary parameters.
  int pixelsize = 5;
  int gridsize  = pixelsize * 7 + 5;
  int score = 0;
  int direction = 1;
  int level = 1;

  // Declaring the Player object (the ship of the player).
  Player player;

  // Declaring Array Lists that hold background srtars, enemy ships, 
  // bullets, and ball particles.
  ArrayList<Star> stars = new ArrayList<Star>(500);
  ArrayList<Enemy> enemies = new ArrayList();
  ArrayList<Bullet> bullets = new ArrayList();
  ArrayList<Ball> balls = new ArrayList();

  // Determines if enemy array should advance (move down) towards the player.
  boolean incy = false;


  // Constructor.
  Game() {

    // Resetting/initializing the game.
    reset();
  }

  // Resetting/initializing the game.
  void reset() {
    stars.clear();
    player = new Player(pixelsize);
    for (int i = 0; i < 130; i++) {
      stars.add(0, new Star());
    }
    score = 0;
    level = 1;
    resetEnemies();
  }

  // Resetting/initializing enemies in the game.
  void resetEnemies() {
    enemies.clear();
    for (int i = 0; i < width/gridsize/2; i++) {
      for (int j = 0; j <= 5; j++) {
        enemies.add(new Enemy(i * gridsize, j * gridsize, pixelsize, level));
      }
    }
  }

  // Drawing the game play
  void draw() {

    // Drawing the background stars.
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.draw();
    }

    // Drawing the player's ship.
    player.draw();

    // Drawing bullets.
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      bullet.draw();
    }

    // Checking if enemy has reached the borders of the screen, and if so, 
    // advancing the enemies towards the player.
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      if (enemy.outside() == true) {
        direction = -direction;
        incy = true;
        break;
      }
    }

    // Checking for each enemy if it colided (was hit) by a bullet.
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      if (enemy.collisionWithBullet()) {      
        if (enemy.lives > 0) {

          // Decreasing the lives after each hit by the bullet.
          enemy.lives--;

          // Flashing the color.
          enemy.flashColor(30);

          // Playing appropriate sound.
          if (enemy.lives > 0) {
            expSound.play(1, random(0.2, 0.8));
          } else {
            expSound2.play(1, random(0.2, 0.8));
          }
        }

        // If enemy has no lives left it gets removed from its Array List and drawing
        // the ecplosion with ball particles.
        if (enemy.lives == 0) {
          enemies.remove(i);

          // Adding 10 points to the score after each successful hit.
          score += (10 * level);

          // Drawing the ecplosion with ball particles.
          for (int j=0; j < random(8); j++) {
            balls.add(new Ball(enemy.x, enemy.y));
          }
        }
      } else {
        enemy.draw();
      }
    }
    incy = false;


    // Creating wave of enemies once the previous one was completely eliminated
    // and as a reward the player gets an extra live.
    if (enemies.size() == 0) {
      level++;
      player.lives++;
      resetEnemies();
    }

    // Drawiing ball particales explosion 
    for (int i = 0; i < balls.size(); i++) {
      Ball ball = balls.get(i);
      ball.draw();
      if (ball.outside()) {
        balls.remove(i);
      }
    }

    // Displaying the game stats.
    drawStats();

    // Checking if player lost all of its lives and if so changing the game state.
    if (player.lives == 0) {
      gameState = "LOSE";
    }
  }

  // Drawing game stats
  // Drawing lives and the score.
  void drawStats() {
    fill(255);
    textSize(18);
    textAlign(LEFT, BOTTOM);
    text("Lives: " + player.lives, 10, height - 2);
    textAlign(RIGHT, BOTTOM);
    text("Score: " + score, width - 10, height - 2);
  }
}