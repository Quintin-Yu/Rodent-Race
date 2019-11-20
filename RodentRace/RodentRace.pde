/**
 *@author Johnathan Claasen
 */
//This class is used to Create the gameState and instantiate the gamestate number to 0 which creates the mainMenu

boolean debug = true;
//import ddf.minim.*;
GameState gameState;
//Minim minim;
//AudioPlayer gameMusic;
PImage map = new PImage();
ArrayList<Tile> tiles;

void setup() {
  //fullScreen(P3D);
  size(1600, 900, P3D);
  frameRate(60);
  gameState = new GameState(0);
  tiles = new ArrayList<Tile>();
  loadLevel("./Maps/Level1.png");
  map = loadImage("./Maps/Level1Path.png");


  //minim = new Minim(this);
  //gameMusic = minim.loadFile("./Arcade.wav");
}

void update() {
  gameState.update();
}


void draw() {
  update();
}
