/**
 *@author Johnathan Claasen
 *@auhtor Quintin Yu 
 *@auhtor Timotheus Omta
 *@auhtor Bowen Schlahmilch
 *@auhtor Jesse Egmond
 */
//This class is used to create the keybindings that are used in Rodent Race.
//A lot of the conditions are checked by using the gameState to decide what buttons can be pressed at what stages of the game.

boolean xPressed = false;
boolean rowAdded = false;
Table table;

void keyPressed() {
  if (gameState.stateOfGame == 1) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        lead.left = lead.leadSpeedLeftRight;
        player.movementNum = 3;
      }

      if (keyCode == RIGHT) {
        lead.right = lead.leadSpeedLeftRight;
        player.movementNum = 1;
      }

      if (keyCode == UP) {
        lead.up = lead.leadSpeedUpDown;
        player.movementNum = 0;
      }

      if (keyCode == DOWN) {
        lead.down = lead.leadSpeedUpDown;
        player.movementNum = 2;
      }
    }
    //w
    if (keyCode == 87 ) {
      lead2.up = lead2.leadSpeedUpDown;
      player2.movementNum = 0;
    }
    //a
    if (keyCode == 83) {
      lead2.down = lead2.leadSpeedUpDown;
      player2.movementNum = 2;
    }
    //s
    if (keyCode == 65) {
      lead2.left = lead2.leadSpeedLeftRight;
      player2.movementNum = 3;
    }
    //d
    if (keyCode == 68) {
      lead2.right = lead2.leadSpeedLeftRight;
      player2.movementNum = 1;
      println("d");
    }
  }

  if (gameState.stateOfGame == 1) {
    //Used for Pausing the game
    if (key == 'p') {
      if (gameState.pg.isGamePlaying) {
        gameState.pg.isGamePlaying = false;
        noLoop();
      } else {
        gameState.pg.isGamePlaying = true;
        loop();
      }
    }
    if (player.isJumping == false) {
      if (key == 'j') {
        player.cooldownJump.trigger();
      }
    }

    if (player.isJumping2 == false) {
      if (key == 'k') {
        player2.cooldownJump2.trigger();
      }
    }

    // player one uses his/her pickup
    if (key == 'u') {
      if (pickUp.pickUpNum == 1) {
        pickUp.cooldownSpeed.trigger();
        pickUp.pickUpNum = 0;
      }
    }

    if (key == 'i') {
      if (pickUp.pickUpNum2 == 1) {
        pickUp.cooldownSpeed2.trigger();
        pickUp.pickUpNum2 = 0;
      }
    }
  }

  if (gameState.stateOfGame == 3) {
    if (key == 'v') {
      gameState.stateOfGame = 0;
    }
  }

  if (xPressed == false) {
    if (gameState.stateOfGame == 7) {
      if (key == 'x') {
        gameState.stateOfGame = 8 ;
        xPressed = true;
      }
    }
  }

  if (gameState.stateOfGame == 8) {
    if (key == 'z') {
      gameState.stateOfGame = 3;
    }
  }

  if (key == 'r') {
    scoreBoard.isScoreBoardShowing = true;
  }

  if (gameState.stateOfGame == 5) {
    //Goes to the previous Character
    if (keyCode == LEFT) {
      gameState.selector.charNum --;
      if (gameState.selector.charNum < 0) {
        gameState.selector.charNum = 1;
      }
    }

    //Goes to the next Character
    if (keyCode == RIGHT) {
      gameState.selector.charNum ++;
      if (gameState.selector.charNum > 1) {
        gameState.selector.charNum = 0;
      }
    }
  }

  //C starts the Credits
  if (gameState.stateOfGame == 0) {
    //  if (key == 'c') {
    //    gameState.stateOfGame = 2;
    //  }

    //if (key == 'x') {
    //  gameState.stateOfGame = 7;
    //}

    if (keyCode == UP) {
      gameState.mainMenu.buttonNum --; 
      if (gameState.mainMenu.buttonNum < 1) {
        gameState.mainMenu.buttonNum = 3;
      }
    }

    if (keyCode == DOWN) {
      gameState.mainMenu.buttonNum ++; 
      if (gameState.mainMenu.buttonNum > 3) {
        gameState.mainMenu.buttonNum = 1;
      }
    }
    if (xPressed == false) {
      if (key == 'x') {
        if (gameState.mainMenu.buttonNum == 1) {
          gameState.stateOfGame = 5;
        } else if (gameState.mainMenu.buttonNum == 2) {
          gameState.stateOfGame = 3;
        } else if (gameState.mainMenu.buttonNum == 3) {
          gameState.stateOfGame = 2  ;
        }
        xPressed = true;
      }
    }
  }

  //S starts the Character Selection
  //if (gameState.stateOfGame == 0) {
  //  if (key == 's') {
  //    gameState.stateOfGame = 5;
  //  }
  //}
  //X starts the game
  if (xPressed == false) {
    if (gameState.stateOfGame == 5) {
      if (key == 'x') {
        //isGameRunning = true;
        xPressed = true;
        gameState.mainMenu.inMainMenu = false;
        gameState.stateOfGame = 1;
        gameState.pg = new PlayGame();
      }
    }
  }

  //V Returns to the main menu from the Credit screen
  if (gameState.stateOfGame == 2 || gameState.stateOfGame == 5 || gameState.stateOfGame == 3) {
    if (key == 'v') {
      gameState.credits.inCredits = false;
      gameState.credits.y = 0;
      gameState.stateOfGame = 0;
    }
  }

  if (gameState.stateOfGame == 7) {
    if (key == 's') {
      gameState.stateOfGame = 0;
    }
  }
  if ( gameState.stateOfGame == 8) {
    // change edit position
    if (keyCode == LEFT) {
      gameState.nameSelection.pos--;
      if (gameState.nameSelection.pos < 0) {
        gameState.nameSelection.pos = 4;
      }
    }
    if (keyCode == RIGHT) {
      gameState.nameSelection.pos++;
      if (gameState.nameSelection.pos > 4) {
        gameState.nameSelection.pos = 0;
      }
    }

    // change letter value
    if (keyCode == UP) { 
      gameState.nameSelection.score[gameState.nameSelection.pos]--;
      if (gameState.nameSelection.score[gameState.nameSelection.pos] < 65) {
        gameState.nameSelection.score[gameState.nameSelection.pos] = 90;
      }
    }
    if (keyCode == DOWN) { 
      gameState.nameSelection.score[gameState.nameSelection.pos]++;
      if (gameState.nameSelection.score[gameState.nameSelection.pos] > 90) {
        gameState.nameSelection.score[gameState.nameSelection.pos] = 65;
      }
    }

    if (xPressed == false) {
      if (key == 'x') {
        xPressed = true;
        String name = "";
        name = str(char(gameState.nameSelection.score[0]))+ str(char(gameState.nameSelection.score[1])) + str(char(gameState.nameSelection.score[2])) + str(char(gameState.nameSelection.score[3])) + str(char(gameState.nameSelection.score[4]));
        print(name);
        for (int i = 0; i<HighScore.N; i++) {
          gameState.nameSelection.score[i] = 65;
        }
        table = null;
        table = loadTable("data/Scores.csv", "header");
        // success?
        if (table!=null) {
          if (rowAdded == false) {
            table.setString(table.getRowCount()-1, "names", name);
            rowAdded = true;
            table.sort(0);
          }
        }
        saveTable(table, "data/Scores.csv");
        rowAdded = false;
        gameState.stateOfGame = 3;
      }
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      lead.left = 0;
    }
    if (keyCode == RIGHT) {
      lead.right = 0;
    }
    if (keyCode == UP) {
      lead.up = 0;
    }
    if (keyCode == DOWN) {
      lead.down = 0;
    }
  }

  if (keyCode == 65) {
    lead2.left = 0;
    println("W WAS RELEASED");
  }
  if (keyCode == 68) {
    lead2.right = 0;
    println("A WAS RELEASED");
  }
  if (keyCode == 87) {
    lead2.up = 0;
    println("S WAS RELEASED");
  }
  if (keyCode == 83) {
    lead2.down = 0;
    println("D WAS RELEASED");
  }


  if (key == 'r') {
    scoreBoard.isScoreBoardShowing = false;
  }

  if (key == 'x') {
    xPressed = false;
  }
}
