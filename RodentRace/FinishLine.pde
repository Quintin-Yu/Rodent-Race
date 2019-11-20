/*
*@Author Bowen Schlahmilch
 */
//This class create the finishline used to save laps and time taken.

class FinishLine {
  //Declare the variables
  int currentLap = 0;
  int maxLap = 3;
  float xPos1, yPos1, xPos2, yPos2;
  boolean isRaceFinished = false;
  //boolean hasCollided = false;
  boolean checkPoint1 = false;
  boolean checkPoint2 = false;
  boolean finishLine = false;

  CheckPoint[] checkPoints = new CheckPoint[3];


  //Finish line constructor
  FinishLine(float xPos1, float yPos1, float xPos2, float yPos2) {
    this.xPos1 = xPos1;
    this.yPos1 = yPos1;
    this.xPos2 = xPos2;
    this.yPos2 = yPos2;
  }

  void display() {
    checkPoints[0] = new CheckPoint(1350, 590, 1350, 350);
    checkPoints[1] = new CheckPoint(2000, 590, 2000, 350);

    stroke(255);
    strokeWeight(20);
    line(xPos1, yPos1, xPos2, yPos2);
    fill(255);
    //line(1350, 590, 1350, 350);
    //line(2000, 590, 2000, 350);
  }

  void lapDsplay() {
    if (currentLap != 3) {
      text((currentLap + 1) + " / " + maxLap, player.location.x / 2 + player2.location.x / 2, player.location.y / 2 + player2.location.y / 2 - height / 2 + 80);
    }
  }

  void update() {
    //all the statements so that the finishline will work properly
    if (checkPoints[0].collidesWithPlayer(player) == true) {
      checkPoint1 = true;
      checkPoint2 = false;
    }

    if (checkPoints[1].collidesWithPlayer(player) == true) {
      if (checkPoint1 == true) {
        checkPoint1 = false;
        checkPoint2 = true;
        finishLine = true;
      }
    }

    if (collidesWithPlayer(player) == true) {
      if (checkPoint1 == true) {
        if (checkPoint2 == false) {
          checkPoint1 = false;
        }
      }
    }
    //When the player collides with the finish line increase current lap and set the collision boolean to true
    if ( finishLine == true) {
      if (collidesWithPlayer(player)) {
        checkPoint2 = false;
        checkPoint1 = false;

        //If 10 frames have passed increase lap and reset collision
        if (frameCount %1 <= 0 ) {
          timer.resetTimer();
          currentLap++;
          finishLine = false;
        }

        //if current lap is 3 the race ends and the timer will set the stoptime
        if (currentLap == 3) {
          isRaceFinished = true;
          gameState.endScore.rowAdded = false;
          if (isRaceFinished) {
            timer.stopTimer();
            finishLine = false;
          }
        }
      }
    }
  }

  //Collision detection used for detecting if the player has collided with the finish line.
  boolean collidesWithPlayer(Player aPlayer) {
    if ((xPos1 < aPlayer.location.x + aPlayer.playerSize/2 || xPos2 < aPlayer.location.x + aPlayer.playerSize/2) && 
      (xPos1 > aPlayer.location.x - aPlayer.playerSize/2 || xPos2 > aPlayer.location.x - aPlayer.playerSize/2) && 
      (yPos1 < aPlayer.location.y + aPlayer.playerSize/2 || yPos2 < aPlayer.location.y + aPlayer.playerSize/2) && 
      (yPos1 > aPlayer.location.y - aPlayer.playerSize/2 || yPos2 > aPlayer.location.y - aPlayer.playerSize/2))
    {
      return true;
    } else {
      return false;
    }
  }
}
