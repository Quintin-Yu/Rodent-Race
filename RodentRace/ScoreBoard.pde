/**
 *@author Johnathan Claasen
 */
//This class is used to create the scoreboard during the race for players to see their current times.

class ScoreBoard {

  int textSize;
  float scoreBoardSizeX, scoreBoardSizeY;
  float textPlayersPosX, textPlayersPosY;
  String scoreString = "Score Board!";
  boolean isScoreBoardShowing = false;

  //Constructor
  ScoreBoard() {
    textSize = 14;
    scoreBoardSizeX = 200;
    scoreBoardSizeY = 200;
    textPlayersPosX = 280;
    textPlayersPosY = 50;
  }

  void drawScoreBoard() {
    //Create the board Background;

    fill(255, 255, 255);
    rect( player.location.x / 2 + player2.location.x / 2 + width / 2 - scoreBoardSizeX
      , player.location.y / 2 + player2.location.y / 2 - height / 2, scoreBoardSizeX, scoreBoardSizeY);
    fill(255, 200, 200);
    rect( player.location.x / 2 + player2.location.x / 2 + width / 2 - scoreBoardSizeX
      , player.location.y / 2 + player2.location.y / 2 - height / 2 + 5, scoreBoardSizeX-10, scoreBoardSizeY-10);

    //Set Text Color
    fill(0);
    textSize(textSize);
    text(scoreString, player.location.x / 2 + player2.location.x / 2 + width / 2 - scoreBoardSizeX / 2
      , player.location.y / 2 + player2.location.y / 2 - height / 2 + 40);
    text("Lap1: " + timer.lapTimes[0], player.location.x / 2 + player2.location.x / 2 + width / 2 - scoreBoardSizeX / 2
      , player.location.y / 2 + player2.location.y / 2 - height / 2 + 60);
    text("Lap2: " +timer.lapTimes[1], player.location.x / 2 + player2.location.x / 2 + width / 2 - scoreBoardSizeX / 2
      , player.location.y / 2 + player2.location.y / 2 - height / 2 + 80);
    text("Lap3: " +timer.lapTimes[2], player.location.x / 2 + player2.location.x / 2 + width / 2 - scoreBoardSizeX / 2
      , player.location.y / 2 + player2.location.y / 2 - height / 2 + 100);
    text("Total time taken: " + (timer.lapTimes[0] + timer.lapTimes[1] + timer.lapTimes[2]), player.location.x / 2 + player2.location.x / 2 + width / 2 - scoreBoardSizeX / 2
      , player.location.y / 2 + player2.location.y / 2 - height / 2 + 120);
  }
}
