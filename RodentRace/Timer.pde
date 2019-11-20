/**
 *@author Johnathan Claasen
 */
//This class is instantiated once the PlayGame has been created. When this happens the Timer starts and the countdown begins.
//The Time is used to keep track of the current time, lap time and tim taken to finish the race.

class Timer {

  float time;
  boolean isCountingDown = true;
  float lapTimes[] = new float[3];

  //Constructor
  Timer(float setTime) {
    time = setTime;
    textSize(60);
  }

  //Get the time
  float getTime() {
    return(time);
  }

  //Method used to count up.
  void countUp() {
    time += 1/frameRate;
  }

  //Method used for counting down 
  void countDown() {
    if (time <= 0) {
      time = 0;
      isCountingDown = false;
    } else {
      time -= 1/frameRate;
    }
  }

  //Method for resetting the timer after every lap.
  void resetTimer() {
    addLapTime(finishLine.currentLap, time);
    time = 0;
  }

  //Stop the Timer and print the time per lap taken and total time.
  void stopTimer() {
    println("Lap 1: " + lapTimes[0]);
    println("Lap 2: " + lapTimes[1]);
    println("Lap 3: " + lapTimes[2]);
    //Calculate the total time
    println("Total time taken: " + (lapTimes[0] + lapTimes[1] + lapTimes[2]));
  }

  //Draw the timer or the screen
  void drawTimer() {
    if (isCountingDown) {
      //Countdown timer position while counting down

      float backGroundSizeX = 500;
      float backGroundSizeY = 100;

      fill(50);
      stroke(1);
      rect(player.location.x - backGroundSizeX / 2, player.location.y, backGroundSizeX, backGroundSizeY);
      fill(255, 250, 127, 255);
      textSize(50);
      textAlign(CENTER);
      text("Move = ☺▼▲►◄☺", player.location.x, player.location.y + backGroundSizeY / 2);

      if (time <= 0) {
        textSize(60);
        fill(0, 255, 0);      
        text("GO!", width, player.location.y - height / 2);
      } else {
        //Countdown timer position while counting up
        textSize(30);
        fill(255, 0, 0); 
        text(timer.getTime(), player.location.x, player.location.y + backGroundSizeY - 20);
      }
    } else {
      drawCurrentTimer();
    }
  }

  void drawCurrentTimer() {
    if (finishLine.currentLap != 3) {
      fill(0);
      textSize(25);
      tint(255, 255);
      imageMode(CENTER);
      image(gameState.images.background[4], player.location.x / 2 + player2.location.x / 2, player.location.y / 2 + player2.location.y / 2 - height / 2 + 50, 150, 150);

      text(timer.getTime(), player.location.x / 2 + player2.location.x / 2, player.location.y / 2 + player2.location.y / 2 - height / 2 + 40);
      finishLine.lapDsplay();
    }
  }

  void update() {
    if (isCountingDown) {
      countDown();
    }
    if (!isCountingDown) {
      countUp();
    }
  }

  void addLapTime(int currentLap, float lapTime) {
    if (!finishLine.isRaceFinished) {
      //currentLap -=1;
      lapTimes[currentLap] = lapTime;
      println("Lap: " + (currentLap + 1) + " LapTime: " +  lapTime );
    }
  }
}
