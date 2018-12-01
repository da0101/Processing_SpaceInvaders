// ********************
// Space Invaders Game - Final Project
//
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************

// class Star defines the star at the background.

class Star {

  // Variables for the position and the speed of the star.
  float x, y, dx, dy;

  // Constructor. 
  Star() {
    reset();
  }

  // Drawing and updating the star.
  void draw() {
    show();
    update();
  }

  // Drawing the star.
  void show() {
    strokeWeight(2);
    stroke(200, random(20, 200));
    rectMode(CENTER);
    rect(x, y, dx, dy);
  }

  // Updating the position according to the speed and reseting the star if it went out of the screen.
  void update() {
    x += dx;
    y += dy;
    if (y > height || y < 0 || x > width || x < 0) {
      reset();
    }
  }

  // Reseting the star to a random location and speed.
  void reset() {
    x = random(0, width);
    y = random(0, height);
    dx = random(0);
    dy = random(1, 5);
  }
}