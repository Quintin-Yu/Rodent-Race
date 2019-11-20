/**
 *@author Jesse Egmond
 */
class Tile {
  float xPosition, yPosition, widthTile, heightTile;
  color fillColor;
  PImage tileImage;
  int tileKind;
  boolean wallTile = false, floorTile = false;

  Tile(PImage tileImage, float newX, float newY, float newWidth, float newHeight, int tileKind) {
    this.tileImage = tileImage;
    this.tileKind = tileKind;
    this.widthTile = newWidth;
    this.heightTile = newHeight;
    whichTile(tileKind);
    xPosition = newX;
    yPosition = newY;
  }

  void whichTile(int tileKind) {
    switch (tileKind) {
    case 1: 
      wallTile = true;
      break;
    case 2: 
      floorTile = true;
    }
  }
  void update() {

    if (wallTile) {
      collisionP1();
      collisionP2();
    }
  }

  //tekent de tile 
  void draw() {
    imageMode(CORNER);
    image(tileImage, xPosition, yPosition, widthTile, heightTile);
  }

  /**
   *kijkt of er collsion is met lead1 en de wall tile
   */
  boolean collisionDetectionLead1() {
    if ((lead.leadBallX + lead.leadSize/2) > xPosition && 
      (lead.leadBallX + lead.leadSize/2) < (xPosition + tileSize) && 
      (lead.leadBallY + lead.leadSize/2) > yPosition && 
      (lead.leadBallY + lead.leadSize/2) < (yPosition + tileSize)) { 
      return true;
    } else {
      return false;
    }
  }

  /**
   *kijkt of er collsion is met lead 2 en de wall tile
   */
  boolean collisionDetectionLead2() {
    if ((lead2.leadBallX + lead2.leadSize/2) > xPosition && 
      (lead2.leadBallX + lead2.leadSize/2) < (xPosition + tileSize) && 
      (lead2.leadBallY + lead2.leadSize/2) > yPosition && 
      (lead2.leadBallY + lead2.leadSize/2) < (yPosition + tileSize)) { 
      return true;
    } else {
      return false;
    }
  }

  /**
   *kijkt of er collsion is met player1 en de wall tile
   */
  boolean collisionDetectionPlayer1() {
    if ((player.location.x + player.playerSize/2) > xPosition && 
      (player.location.x + player.playerSize/2) < (xPosition + tileSize) && 
      (player.location.y + player.playerSize/2) > yPosition && 
      (player.location.y+ player.playerSize/2) < (yPosition + tileSize)) { 
      return true;
    } else {
      return false;
    }
  }

  /**
   *kijkt of er collsion is met player2 en de wall tile
   */
  boolean collisionDetectionPlayer2() {
    if ((player2.location.x + player2.playerSize/2) > xPosition && 
      (player2.location.x + player2.playerSize/2) < (xPosition + tileSize) && 
      (player2.location.y + player2.playerSize/2) > yPosition && 
      (player2.location.y+ player2.playerSize/2) < (yPosition + tileSize)) { 
      return true;
    } else {
      return false;
    }
  }

  /**
   *wat er gebeurt met Player 1 / lead 1 na collision
   */
  void collisionP1() {
    //als player 1 op een walltile komt dan:
    if (collisionDetectionPlayer1()) { 

      //de player wordt op zijn laatste positie gezet
      player.location.x = player.pxWas;
      player.location.y = player.pyWas;
    }


    if (collisionDetectionLead1()) {
      lead.leadBallY = player.pyWas;
      lead.leadBallX = player.pxWas;
      //naar onder
      lead.leadBallY += 5;

      if (collisionDetectionLead1()) {
        lead.leadBallY = player.pyWas;
        lead.leadBallX = player.pxWas;
        //naar rechts
        lead.leadBallX += 5;

        if (collisionDetectionLead1()) {
          lead.leadBallY = player.pyWas;
          lead.leadBallX = player.pxWas;
          //naar links
          lead.leadBallX -= 5;

          if (collisionDetectionLead1()) {
            lead.leadBallY = player.pyWas;
            lead.leadBallX = player.pxWas;
            //naar links
            lead.leadBallY -= 5;
          }
        }
      }
    }
  }

  /**
   *wat er gebeurt met Player 1 / lead 1 na collision
   */
  void collisionP2() {
    //als player 1 op een walltile komt dan:
    if (collisionDetectionPlayer2()) { 

      //de player wordt op zijn laatste positie gezet
      player2.location.x = player2.p2xWas;
      player2.location.y = player2.p2yWas;
    }


    if (collisionDetectionLead2()) {
      lead2.leadBallY = player2.p2yWas;
      lead2.leadBallX = player2.p2xWas;
      //naar onder
      lead2.leadBallY += 5;

      if (collisionDetectionLead2()) {
        lead2.leadBallY = player2.p2yWas;
        lead2.leadBallX = player2.p2xWas;
        //naar boven
        lead2.leadBallY -= 5;

        if (collisionDetectionLead2()) {
          lead2.leadBallY = player2.p2yWas;
          lead2.leadBallX = player2.p2xWas;
          //naar links
          lead2.leadBallX -= 5;

          if (collisionDetectionLead2()) {
            lead2.leadBallY = player2.p2yWas;
            lead2.leadBallX = player2.p2xWas;
            //naar rechts
            lead2.leadBallX += 5;
          }
        }
      }
    }
  }
}
