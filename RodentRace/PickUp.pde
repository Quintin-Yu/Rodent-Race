/**
 *@author Timo Omta
 */

//This class creates the pickups used as boosts.
class PickUp {
  int rad1, rad2, pickUpNum, pickUpNum2, duration = 2000;
  float pickUpX, pickUpY, xDiff, yDiff, disSquared;
  boolean isCollected = false;
  boolean isCollected2 = false;

  Cooldown cooldownSpeed;
  Cooldown cooldownSpeed2;

  Cooldown pickUpRespawn;

  //--->

  void stopPickUp() {
    if (duration != 0) {

      duration--;
      //println("Duration left! " + duration);
    } else {
      duration = 0;
    }
  }


  //Constructor
  PickUp(int rad1, int rad2, float x2, float y2) {
    this.rad1 = rad1;
    this.rad2 = rad2;
    this.pickUpX = x2;
    this.pickUpY = y2;
    duration = 5;

    cooldownSpeed = new Cooldown(2000);
    cooldownSpeed2 = new Cooldown(2000);
    pickUpRespawn = new Cooldown(5000);
  }

  void draw() {
    display();
    update();
  }

  //Draw the Pickup
  void display() {
    stopPickUp();
    if (!isCollected && !isCollected2) {
      fill(255, 255, 0);
      ellipse(pickUpX, pickUpY, rad2, rad2);
    }
  }

  void update() {     
    xDiff = pickUpX - player.location.x;
    yDiff = pickUpY - player.location.y;
    disSquared = xDiff * xDiff + yDiff * yDiff;

    //Detect collision and if collided pickup the object.
    if (disSquared <= ( rad1 + rad2)/2 * (rad1 + rad2)/2) {
      isCollected = true;
      pickUpNum = 1;
    }

    xDiff = pickUpX - player2.location.x;
    yDiff = pickUpY - player2.location.y;
    disSquared = xDiff * xDiff + yDiff * yDiff;

    //Detect collision and if collided pickup the object.
    if (disSquared <= ( rad1 + rad2)/2 * (rad1 + rad2)/2) {
      isCollected2 = true;
      pickUpNum2 = 1;
    }

    pickUpRespawn.update();

    if (isCollected == true || isCollected2 == true) {
      pickUpRespawn.trigger();
    }

    if (pickUpRespawn.isActive()) {
      isCollected = false;
      isCollected2 = false;
      pickUpX = 0;
      pickUpY = 0;
      rad1 = 0;
      rad2 = 0;
    } else {  
      pickUpX = 700;
      pickUpY = 800;
      rad1 = 50;
      rad2 = 50;
    }

    cooldownSpeed.update();
    cooldownSpeed2.update();

    if (cooldownSpeed.isActive()) {
      pickUpNum = 0;
      lead.leadSpeedUpDown = 10;
      lead.leadSpeedLeftRight = 10;
    } else {
      lead.leadSpeedUpDown = 4.5;
      lead.leadSpeedLeftRight = 4.5;
    }

    if (cooldownSpeed2.isActive()) {
      pickUpNum2 = 0;
      lead2.leadSpeedUpDown = 10;
      lead2.leadSpeedLeftRight = 10;
    } else {
      lead2.leadSpeedUpDown = 4.5;
      lead2.leadSpeedLeftRight = 4.5;
    }
  }
}
