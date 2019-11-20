/**
 *@author Quintin Yu
 */

//This class is the front ball that the player follows.
class Lead {
  //Universal variables
  float leadBallX, leadBallY, leadSpeedUpDown, leadSpeedLeftRight, up, down, right, left;
  int leadSize;

  float xWas, yWas;

  //The constructor gives the initial values to the lead ball.
  Lead(int spawnLocationX, int spawnLocationY) {
    leadBallX = spawnLocationX * tileSize;
    leadBallY = spawnLocationY * tileSize;
    leadSpeedUpDown = 4.5;
    leadSpeedLeftRight = 4.5;
    leadSize = 0;
  }

  void display() {
    ellipse(leadBallX, leadBallY, leadSize, leadSize);
  }

  void update() {
    // Determains the movement
    leadBallY += (down - up);
    leadBallX += (right - left);

    xWas = leadBallX;
    yWas = leadBallY;
  }
}
