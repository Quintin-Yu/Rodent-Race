/**
 *@author Quintin Yu
 */

//This class is used to load in images. 
class Images {
  PImage[] background = new PImage[5];
  PImage[] tiles = new PImage[10];
  PImage hamsterBall = new PImage();
  PImage[] buttons = new PImage[3];
  PImage[] pickUps = new PImage[3];
  PImage[] characters = new PImage[4];
  PImage startArrow = new PImage();


  Images() {
    characters[0] = loadImage("./Rodents/SquirrelUp.png");
    characters[1] = loadImage("./Rodents/ChinchillaUp.png");
    characters[2] = loadImage("./Rodents/Duck.png");

    hamsterBall = loadImage("./Ball/playerUp.png");

    buttons[0] = loadImage("./Buttons/play.png");
    buttons[1] = loadImage("./Buttons/highscores.png");
    buttons[2] = loadImage("./Buttons/credits.png");

    pickUps[0] = loadImage("./PickUp/Inventory.png");
    pickUps[1] = loadImage("./PickUp/Backpack.png");
    pickUps[2] = loadImage("./PickUp/Strenght.png");

    background[0] = loadImage("./Background/MainMenu.png");
    background[1] = loadImage("./Background/Credits.jpg");
    background[2] = loadImage("./Background/CharSelection.png");
    background[3] = loadImage("./Background/highScore.jpg");
    background[4] = loadImage("./Background/Clock.png");


    tiles[0] = loadImage("./Background/Tiles/Finish.png");
    tiles[1] = loadImage("./Background/Tiles/Speedpad.png");
    tiles[2] = loadImage("./Background/Tiles/Barrier.png");
    tiles[3] = loadImage("./Background/Tiles/WallTile.png");
    tiles[4] = loadImage("./Background/Tiles/FloorTile.png");
    tiles[5] = loadImage("./Background/Tiles/tizeta_FloorTile.png");
    tiles[6] = loadImage("./Background/Tiles/textureStone.png");
    tiles[7] = loadImage("./Background/Tiles/Grass.png");
    tiles[8] = loadImage("./Background/Tiles/Grass_Flower.png");
    tiles[9] = loadImage("./Background/Tiles/Grass_Flower2.png");

    startArrow = loadImage("./Background/StartArrow.jpg");
  }
}
