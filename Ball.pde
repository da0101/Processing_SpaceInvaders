// ********************
// Space Invaders Game - Final Project
//
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************

// Class ball defines the explosion that happens when bullet hits enemy ship.

class Ball {

  // Variables for position and velocity.
  float x;
  float y;
  float vx;
  float vy;
  float size, value;

  // Constructor.
  Ball(int xpos, int ypos) {
    x = xpos;
    y = ypos;


    // Creating particles at explosion that spread out in random directions. 
    size =  random(-7, 7);
    value = random(0, 5);

    // Angle theta determines the direction of the flying particle.
    float theta = random(TWO_PI);
    float speed = random(-6, 6);

    // Determine vertical and horizontal speed trigonometrically by angle theta.
    vx = (cos(theta)*speed) + size;
    vy = (sin(theta)*-speed) + value;
  }


  // Drawing the ball particle.
  void draw() {
    noStroke();
    fill(255);
    rect(x, y, size, size, random(20));
    update();
  }

  // Updating position.
  void update() {
    x += vx;
    y += vy;
  }

  // Checks if ball particle is outside the screen.
  boolean outside() {
    return (x > width || x < 0 || y > height || y < 0);
  }
}