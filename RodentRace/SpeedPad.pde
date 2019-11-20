/**
 *@author Jesse Egmond
 *
 * Creates the Speedpad
 */

class SpeedPad { 

  boolean rechts = false, links = false, boven = false, beneden = false, evil = false;
  boolean directionUD;
  float ajustSpeed;
  float speedPadX, speedPadY, speedPadSize;

  /*
  Constructor info:
   
   directionUD:
   (true) - de speedpad is voor naar boven of naar beneden
   (false) - de speedpad is voor naar link of naar rechts
   
   ajustSpeed:
   (positief getal) - UD = beneden | LR = rechts
   (negatief getal) - UD = boven | LR = links
   
   Evil: 
   (true) - hinderd de speler. SpeedPad richting is rood
   (false) - hinderd de speler niet. SpeedPad richting is wit
   */
  SpeedPad(float speedPadX, float speedPadY, float speedPadSize, boolean directionUD, float ajustSpeed, boolean evil) {
    this.speedPadX = speedPadX;
    this.speedPadY = speedPadY;
    this.speedPadSize = speedPadSize;
    this.directionUD = directionUD;
    this.ajustSpeed = ajustSpeed;
    this.evil = evil; 

    directionDetection(directionUD, ajustSpeed);
  }

  void directionDetection(boolean directionUD, float ajustSpeed) {
    //boven: true = UD & negatief = boven
    if (directionUD == true && ajustSpeed < 0) {
      this.boven = true;
    }

    //beneden: true = UD & positef: beneden
    if (directionUD == true && ajustSpeed > 0) {
      this.beneden = true;
    }

    //links: false = LR & negatief = links
    if (directionUD == false && ajustSpeed < 0) {
      this.links = true;
    }

    //rechts: false = LR & positief = rechts
    if (directionUD == false && ajustSpeed > 0) {
      this.rechts = true;
    }
  }

  void drawDirection() {
    if (boven) {
      if (evil) {
        //rood
        fill(255, 0, 0);
      } else {
        //wit
        fill(255, 255, 255);
      }
      triangle(speedPadX, speedPadY + speedPadSize, speedPadX + speedPadSize, speedPadY + speedPadSize, speedPadX + speedPadSize/2, speedPadY + speedPadSize/2);
    }

    if (beneden) {
      if (evil) {
        //rood
        fill(255, 0, 0);
      } else {
        //wit
        fill(255, 255, 255);
      }
      triangle(speedPadX, speedPadY, speedPadX + speedPadSize, speedPadY, speedPadX + speedPadSize/2, speedPadY + speedPadSize/2);
    }

    if (links) {
      if (evil) {
        //rood
        fill(255, 0, 0);
      } else {
        //wit
        fill(255, 255, 255);
      }
      triangle(speedPadX + speedPadSize, speedPadY, speedPadX + speedPadSize, speedPadY + speedPadSize, speedPadX + speedPadSize/2, speedPadY + speedPadSize/2);
    }

    if (rechts) {
      if (evil) {
        //rood
        fill(255, 0, 0);
      } else {
        //wit
        fill(255, 255, 255);
      }
      triangle(speedPadX, speedPadY, speedPadX, speedPadY + speedPadSize, speedPadX + speedPadSize/2, speedPadY + speedPadSize/2);
    }
  }

  void display() {
    //draws the speedpad
    noStroke();
    //blauw, kleur van de speedpad zelf
    fill(74, 134, 216);
    rect(speedPadX, speedPadY, speedPadSize, speedPadSize, 7);
    //geeft aan in welke richting de speedpad de player versnelt.
    drawDirection();
  }

  void collisionSpeedPad() {
    //collision tussen speler en speedpad (player 1)
    if (player.location.x > speedPadX && 
      player.location.x < (speedPadX + speedPadSize) && 
      player.location.y > speedPadY && 
      player.location.y < (speedPadY + speedPadSize)) {

      if (directionUD) {
        speedPlayerUD(ajustSpeed);
      } else {
        speedPlayerLR(ajustSpeed);
      }
    }

    //collision tussen speler en speedpad (player 2)
    if (player2.location.x > speedPadX && player2.location.x < (speedPadX + speedPadSize) && player2.location.y > speedPadY && player2.location.y < (speedPadY + speedPadSize)) {
      if (directionUD) {
        speedPlayer2UD(ajustSpeed);
      } else {
        speedPlayer2LR(ajustSpeed);
      }
    }
  }

  //als de speedpad naar boven of beneden gaat dan:
  void speedPlayerUD(float ajustSpeed) {
    //de leadball wordt geteleporteerd (y) waardoor de speler een versnelling krijgt (player 1)
    lead.leadBallY += ajustSpeed;
  }

  void speedPlayer2UD(float ajustSpeed) {
    //de leadball wordt geteleporteerd (y) waardoor de speler een versnelling krijgt (player2)
    lead2.leadBallY += ajustSpeed;
  }

  //als de speedpad naar links of rechts gaat dan:
  void speedPlayerLR(float ajustSpeed) {
    //de leadball wordt geteleporteerd (x) waardoor de speler een versnelling krijgt (player 1)
    lead.leadBallX += ajustSpeed;
  }

  void speedPlayer2LR(float ajustSpeed) {
    //de leadball wordt geteleporteerd (x) waardoor de speler een versnelling krijgt (player 2)
    lead2.leadBallX += ajustSpeed;
  }
}
