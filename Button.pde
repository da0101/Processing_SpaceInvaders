// ********************
// Space Invaders Game - Final Project
//
// CART 253-B
// Due 13 December, 2017
// 
// Submitted by Danil Ulmashev
// Student ID 27033389
// ********************

// Class button is used to draw button in the game menue. 

class Button {

  // Position and size of the button.
  int x, y, sizex, sizey;

  // Text on the button.
  String text;


  // Constructor.
  Button(int tempX, int tempY, String tempText) {
    x = tempX;
    y = tempY;
    sizex = 200;
    sizey = 50;
    text = tempText;
  }

  // Drawing the button.
  void draw() {
    rectMode(CENTER);
    fill(200, 50);
    stroke(100);
    rect(x, y, sizex, sizey, 20);
    textAlign(CENTER, CENTER);
    textSize(28);
    fill(255);
    text(text, x, y - 4);
  }

  // Checking if buttin is pressed.
  boolean buttonPressed() {
    if (mousePressed && mouseX < x+sizex/2 && mouseX > x - sizex/2 && mouseY < y+sizey/2 && mouseY > y - sizey/2) {
      buttonSound.play();
      return true;
    }
    return false;
  }
}