/**
 *@author Johnathan Claasen and Bowen Schlahmilch
 */

class EndScore {
  int scoreScreenSize, scoreScreenHeight, scoreScreenWidth, scoreScreenPosX, scoreScreenPosY;

  Table table;
  String name = "";
  boolean rowAdded = false;
  int N = HighScore.N;

  EndScore(int scoreScreenPosX, int scoreScreenPosY, int scoreScreenWidth, int scoreScreenHeight) {
    this.scoreScreenWidth = scoreScreenWidth;
    this.scoreScreenHeight = scoreScreenHeight;
    this.scoreScreenPosX = scoreScreenPosX;
    this.scoreScreenPosY = scoreScreenPosY;
  }

  void draw() {
    // load the table
    table = null;
    table = loadTable("data/Scores.csv", "header");
    // success?
    if (table!=null) {
      if (rowAdded == false) {
        table.setFloat(table.getRowCount(), "times", (timer.lapTimes[0] + timer.lapTimes[1] + timer.lapTimes[2]));
        rowAdded = true;
      }
    } else { 
      // fail: 
      // first run, make table 
      table = new Table();
      table.addColumn("times");
      table.addColumn("names");
      for (int i = 0; i<N; i++) {
        TableRow newRow = table.addRow();
        newRow.setString("times", "");
        newRow.setString("names", name);
      }
    }
    saveScores();
    drawScoreScreen();
  }
  void saveScores() {
    // save the table
    saveTable(table, "data/Scores.csv");
  }

  void drawScoreScreen() {
    //Create the board Background;
    stroke(5);
    fill(255, 255, 255);
    rect(scoreScreenPosX, scoreScreenPosY, scoreScreenWidth, scoreScreenHeight);
    //Draw the inner face of the ScoreBoard

    fill(57, 135, 234);
    rect(scoreScreenPosX, scoreScreenPosY, scoreScreenWidth, scoreScreenHeight);

    fill(0, 0, 0);
    rect(110, 60, 300, 160);

    fill(255, 200, 200);
    textSize(14);
    textAlign(LEFT);
    text("Lap 1:" + timer.lapTimes[0], scoreScreenPosX + 30, scoreScreenPosY + 45);
    text("Lap 2:" + timer.lapTimes[1], scoreScreenPosX + 30, scoreScreenPosY + 65);
    text("Lap 3:" + timer.lapTimes[2], scoreScreenPosX + 30, scoreScreenPosY + 85);
    text("Total time taken: " + (timer.lapTimes[0] + timer.lapTimes[1] + timer.lapTimes[2]), scoreScreenPosX + 30, scoreScreenPosY + 120);
    text("Press r to return to menu", scoreScreenPosX + 30, scoreScreenPosY + 150);
  }
}
