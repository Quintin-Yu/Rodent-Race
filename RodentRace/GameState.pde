/**
 *@author Johnathan Claasen
 */
//This class is used to check the current state of the game and uses this to decide which classes or states to create for the game.

class GameState {
  //create objects and variables.
  Selector selector;
  MainMenu mainMenu;
  Credits credits;
  PlayGame pg = new PlayGame();
  HighScore highScore;
  EndScore endScore;
  NameSelection nameSelection;
  //SoundBank soundBank;
  int stateOfGame;
  String gameStateName;
  Images images = new Images();


  //Construct the gamestate
  GameState(int stateOfGame) {
    this.stateOfGame = stateOfGame;
    credits = new Credits();
    selector = new Selector(0);
    endScore = new EndScore(90, 40, 345, 200);
    mainMenu = new MainMenu();
    highScore = new HighScore();
    nameSelection = new NameSelection();
    //soundBank  = new SoundBank();
  }

  void draw() {
    update();
  }

  void update() {
    //soundBank.update();
    //Check which state the game is in
    switch(stateOfGame) {
      //If stateOfGame = 0 start the Main Menu
    case 0:
      gameStateName = "Main Menu";
      mainMenu.inMainMenu = true;
      mainMenu.drawMenu();
      //println(stateOfGame);
      break;

      //If stateOfGame = 1 start the game
    case 1:
      gameStateName = "Play Game";
      pg.draw();

      ////Play music if not enabled
      //if (!gameMusic.isPlaying()) {
      //  gameMusic.rewind();
      //  gameMusic.play();
      //}
      //print(gameStateName);
      break;

      //If stateOfGame = 2 start the Credits
    case 2: 
      gameStateName = "Credits ";
      credits.inCredits = true;
      credits.draw();
      break;

      //If stateOfGame = 3 Show the Score Board.
    case 3: 
      gameStateName = "High Score ";
      highScore.draw();
      break;

      //If stateOfGame = 4 Show the Level Selection.
    case 4:
      gameStateName = "Level Selection ";
      break;

      //If stateOfGame = 5 Show the Character Selection.
    case 5:
      gameStateName = "Character Selection ";
      selector.inSelector = true;
      selector.draw();
      break;

    case 6:
      gameStateName = "Paused";
      break;

    case 7: 
      gameStateName = "Score";
      endScore.draw();
      break;

    case 8: 
      gameStateName = "Name Selection";
      nameSelection.draw();
      break;
    }
  }
}
