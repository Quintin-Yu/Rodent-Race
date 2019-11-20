/**
 *@author Bowen Schlahmilch
 */

class NameSelection {

  int[] score; // a string of letters
  int pos;     // currently edited letter
  Table table;

  NameSelection() {
    score = newScore(score);
  }

  // set a score to AAAA
  int[] newScore(int[] thisScore) {
    thisScore = new int[5];
    for (int i=0; i<thisScore.length; i++) {
      thisScore[i] = 65;
    }
    return thisScore;
  }

  void draw() {
    drawNameSelection();
    for (int i=0; i<score.length; i++) {
      if (i==pos) {
        fill(255, 0, 0, 255);
      } else {
        fill(0);
      }
      textAlign(CENTER);
      textSize(50);
      text(char(score[i])+"", width / 2 - 150 + 75 * i, 650);
    }
    fill(0);
    text("Enter your name here:", width / 2, 550);

    textSize(30);
    text("▼▲ To select the letter\n ◄ ► to switch between letters", width / 2, 800);
  }

  void drawNameSelection() {
    gameState.images.background[0].resize(width, height);
    background(gameState.images.background[0]);
  }

  void saveScores() {
    saveTable(table, "data/Scores.csv");
  }
}
