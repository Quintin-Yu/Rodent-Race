/*
*@Author Bowen Schlahmilch
 */
class HighScore {
  //The amount of scores shown in the highscore screen
  final static int N = 5;
  Table table;

  void setup() {
    fullScreen();
  }

  void draw() {

    drawHighScoreTable();
    //Show the highscore
    table = null;
    table = loadTable("data/Scores.csv", "header");
    for (int i=0; i<N; i++) {
      TableRow newRow = table.getRow(i);
      fill(255);
      textAlign(LEFT);
      textSize(60);
      text("ID   Name      Time", 590, 370);
      text(i+1 + "    " + newRow.getString("names"), 590, 430+60*i);
      text(newRow.getFloat("times"), 970, 430+60*i);
      text("Press v to go back to", 590, 750);
      text("the startscreen", 590, 810);
    }
  }

  //load the background
  void drawHighScoreTable() {
    gameState.images.background[3].resize(width, height);
    background(gameState.images.background[3]);
  }
}
