/**
 *@author Johnathan Claasen, Jesse Egmond
 */
//This class is used once the gamestate has been changed to play game. Once this hapen it creates all of the objects needed for PlayGame to use.
//This is also where the game is updated and displayed.

//Create the classes once PlayGame has been instantiated.
Player player;
Player player2;
Lead lead;
Lead lead2;
Timer timer;
ScoreBoard scoreBoard;
SpeedPad speedPadDown;
SpeedPad speedPadUp;
SpeedPad speedPadLeft;
FinishLine finishLine;
PickUp pickUp;
Tile tile;

//
Vehicle vehicle;
Path path;

float scale = 1;

SpeedPad speedPadDown2;
SpeedPad speedPadRight2;
SpeedPad speedPadUp2;

//Constructor of the play game class
class PlayGame {

  ArrayList<PVector> points;
  float speedPadLvlSize = tileSize + 20;
  boolean isGamePlaying;

  PlayGame() {
    isGamePlaying = false;

    speedPadDown = new SpeedPad(700, 850, speedPadLvlSize, true, 25, false);
    speedPadUp = new SpeedPad(3450, 3250, speedPadLvlSize, true, -25, false);
    speedPadLeft = new SpeedPad(3150, 100, speedPadLvlSize, false, -25, false);

    speedPadDown2 = new SpeedPad(900, 2500, speedPadLvlSize, true, 25, false);

    speedPadRight2 = new SpeedPad(2050, 3150, speedPadLvlSize, false, 25, false);
    speedPadUp2 = new SpeedPad(950, 100, speedPadLvlSize, true, -25, false);    


    scoreBoard = new ScoreBoard();
    timer = new Timer(4);
    pickUp = new PickUp(50, 50, 700, 800);
    finishLine = new FinishLine(1700, 590, 1700, 350);
    player = new Player(35, 9, 1);
    player.playerNum = 1;

    lead = new Lead(35, 9);

    player.x.p = lead.leadBallX;
    player.y.p = lead.leadBallY;

    //Player2
    player2 = new Player(35, 10, 2);
    player2.playerNum = 2;
    lead2 = new Lead(36, 9);

    player2.x.p = lead2.leadBallX;
    player2.y.p = lead2.leadBallY;

    vehicle = new Vehicle(new PVector(0, height/2), 2, 0.04);
    newPath();
  }

  void draw() {
    update();
    drawGame();
    //println(frameRate);
  }

  //Draw the Game
  void drawGame() {

    background(0);
    tint(255);
    //voor de tiles
    noStroke();
    //voor elke tile in de array van tiles wordt deze getekend. 
    for (Tile tile : tiles) {
      tile.draw();
    }



    speedPadUp.display();
    speedPadDown.display();
    speedPadLeft.display();

    speedPadDown2.display();    
    speedPadRight2.display();
    speedPadUp.display();

    pickUp.draw();

    //Draw the timer to the screen
    timer.drawTimer();

    //Draw Tutorial to the center of the screen
    if (timer.isCountingDown) {
    } else {
    }

    //Draw the player
    lead.display();
    player.display();
    lead2.display();
    player2.display();
    finishLine.display();
    image(gameState.images.startArrow, 1800, 480, 50, 50);
    vehicle.display();
    //path.display();
    //If the scoreboard is showing draw the scoreboard.
    if (scoreBoard.isScoreBoardShowing) {
      scoreBoard.drawScoreBoard();
    }

    //Draw the ScoreBoard on end game
    if (finishLine.isRaceFinished) {
      gameState.stateOfGame = 7;
      //gameState.endScore.draw();
    }
  }

  void update() {
    float distance = dist(player.location.x, player.location.y, player2.location.x, player2.location.y);

    //Changes the scale / zoom based on the distance
    scale = max(0.3, 1 - distance/4000);
    //scale = max(0.3, 1 - (distance - distance%100)/4000);

    //Places the camera between the two players at all times. No matter what scale the game is in.
    translate((-player.location.x * scale / 2) - (player2.location.x * scale / 2) + width / 2
      , (-player.location.y * scale / 2) - (player2.location.y * scale / 2) + height / 2);

    scale(scale);

    timer.update();
    if (timer.isCountingDown) {
    } else {
      //If the timer count down has finished update the game objects

      player.update();
      player2.update();
      lead.update();
      lead2.update();

      speedPadDown.collisionSpeedPad();
      speedPadUp.collisionSpeedPad();
      speedPadLeft.collisionSpeedPad();

      speedPadDown2.collisionSpeedPad();
      speedPadRight2.collisionSpeedPad();
      speedPadUp2.collisionSpeedPad();


      vehicle.update();
      vehicle.follow(path);
      vehicle.run();
      vehicle.borders(path);



      finishLine.update();
      //update alle tiles in de tile array
      for (Tile tile : tiles) {
        tile.update();
      }
    }
  }


  //Calculate the path to add to the vehicle list.
  void newPath() {

    path = new Path();


    for (int x = 0; x < map.width; x++) {
      for (int y = 0; y < map.height; y++) {
        if (map.get(x, y) == color(#603913)) {

          float xPos = x * tileSize;
          float yPos = y * tileSize;
          //println("FUCK IT" + x, y);


          path.addPoint(xPos, yPos);


          //arraylist points sorteert Pvectors
          //For loop sorteert op distance
          //double for dichtbijzijnde 
          //PVectors toevoegen aan path. 


          // A path is a series of connected points
          // A more sophisticated path might be a curve
        }
      }
    }

    //sortCheckPointDistance(points);
    vehicle.calculateCheckPoints();

    //path.addPoint(random(0, width/2), random(0, height));
    //path.addPoint(random(width/2, width), random(0, height));
    //path.addPoint(width+20, height/2);
  }
}
