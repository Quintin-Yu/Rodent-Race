/**
 *@author Johnathan Claasen
 */
//This class is used to create the main menu of Rodent Race. This is where the game starts and displays playgame, Highscores and the credits. 
//Also it checks which which button is currently selected for the player to see.

class MainMenu {
  //Main menu variables
  int buttonHeight, buttonWidth, buttonNum;
  float menuPosX, menuPosY, menuSizeX, menuSizeY;
  boolean inMainMenu = true;
  Images images;

  //Constructor for the main menu
  MainMenu() {
    buttonHeight = 90;
    buttonWidth = 200;
    buttonNum = 1;
    menuSizeX = 300;
    menuSizeY = 50;
    menuPosX = width - menuSizeX;
    menuPosY = height/2 - 200;
    images = new Images();
  }

  //Draw the main Menu
  void drawMenu() {
    if (inMainMenu) {
      gameState.images.background[0].resize(width, height);
      background(gameState.images.background[0]);
      drawList();
      drawSelection();
      drawControls();
    }
  }

  //Draw the Menu selection items
  void drawList() {
    imageMode(CENTER);
    tint(255, 220);
    image(images.buttons[0], width / 2, height / 2 + 25, buttonWidth, buttonHeight);
    image(images.buttons[1], width / 2, height / 2 + buttonHeight + 50, buttonWidth, buttonHeight);
    image(images.buttons[2], width / 2, height / 2 + buttonHeight * 2 + 75, buttonWidth, buttonHeight);
    fill(0, 255, 0);
    textSize(60);
    textAlign(LEFT);
    text("Press x to continue", width/2 - 350, height-100);
  }

  void drawSelection() {
    fill(255, 0, 0);
    noStroke();
    if (buttonNum == 1) {
      ellipse(width / 2 - buttonWidth + 50, height / 2 + 25, 50, 50);
    }
    if (buttonNum == 2) {
      ellipse(width / 2 - buttonWidth  + 50, height / 2 + buttonHeight + 50, 50, 50);
    }
    if (buttonNum == 3) {
      ellipse(width / 2 - buttonWidth  + 50, height / 2 + buttonHeight * 2 + 75, 50, 50);
    }
    fill(255);
  }

  //Display the controls for the player to use.
  void drawControls() {
    image(images.buttons[1], 0, 0);
    fill(255);
    rect(100, 500, 200, 200);
  }
}
