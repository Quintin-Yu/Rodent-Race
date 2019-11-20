/**
 *@author Quintin Yu
 *Source Bas Pijls
 */
//Maakt de player character
class Player {

  int playerNum;
  int movementNum;
  PVector location, velocity, acceleration;
  float topspeed, playerSize, charSize;
  boolean isJumping = false;
  boolean isJumping2 = false; 
  //slaat de locatie van de player op (jes)
  float pxWas, pyWas, p2xWas, p2yWas;
  SpringyValue x, y;
  Images images;
  Cooldown cooldownJump;
  Cooldown cooldownJump2;

  Player(int spawnLocationX, int spawnLocationY, int playerNumber) {
    movementNum = 1;
    this.pxWas = spawnLocationX;
    this.pyWas = spawnLocationY;
    this.p2xWas = spawnLocationX;
    this.p2yWas = spawnLocationY;
    this.playerNum = playerNumber;
    // Start in the center
    location = new PVector(spawnLocationX * tileSize, spawnLocationY * tileSize);
    velocity = new PVector(0, 0);
    topspeed = 5;

    images = new Images();

    //Zorgt dat de player ball een veer effect krijgt.
    x = new SpringyValue();
    y = new SpringyValue();
    x.p0 = location.x;
    y.p0 = location.y;
    playerSize = 35;
    charSize = 33;

    cooldownJump = new Cooldown(1500);
    cooldownJump2 = new Cooldown(1500);
  }

  void update() {
    //Zorgt ervoor dat de played de lead ball volgt.
    if (playerNum == 1) {
      //slaat de locatie op van de player in pxWas en pyWas van player 1 (jes)
      pxWas = location.x;
      pyWas = location.y;

      x.p0 = lead.leadBallX;
      y.p0 = lead.leadBallY;
      location.set( x.p, y.p);
    }

    if (playerNum == 2) {
      //slaat de locatie op van de player in pxWas en pyWas van player 2 (jes)
      p2xWas = location.x;
      p2yWas = location.y;

      x.p0 = lead2.leadBallX;
      y.p0 = lead2.leadBallY;
      location.set( x.p, y.p);
    }
    location.set( x.p, y.p);
    x.update(1/60.0);
    y.update(1/60.0);

    cooldownJump.update();
    cooldownJump2.update();

    if (cooldownJump.isActive()) {
      isJumping = true;
      playerSize = 48;
      charSize = 44;
      //println(cooldownJump.duration);
    } else {
      isJumping = false;
      playerSize = 35;
      charSize = 33;
    }

    if (cooldownJump2.isActive()) {
      isJumping2 = true;
      player2.playerSize = 48;
      player2.charSize = 44;
      //println(cooldownJump2.duration);
    } else {
      isJumping2 = false;
      player2.playerSize = 35;
      player2.charSize = 33;
    }
  }

  //float angle = 0.0;

  //Player ball
  void display() {

    if (playerNum == 1) {
      fill(0, 255, 0);
    }

    if (playerNum == 2) {
      fill(0, 255, 255);
    }

    textSize(24);
    text("P" + playerNum, location.x, location.y-15);

    //The popMatrix makes it so only the images rotate and not the entirety of the screen.
    pushMatrix();
    {
      translate(x.p, y.p);
      rotate(atan2(y.v, x.v)+PI/2);
      pushMatrix();
      {
        translate(-x.p, -y.p);

        noStroke();
        fill(127);

        imageMode(CENTER);
        tint(255, 255);
        image(images.characters[gameState.selector.charNum], location.x, location.y, charSize, charSize);
        tint(255, 100);
        image(images.hamsterBall, location.x, location.y, playerSize, playerSize);
        popMatrix();
      }
    }
    popMatrix();
  }
}
