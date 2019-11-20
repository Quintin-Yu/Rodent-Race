/**
 *@author Jesse Egmond
 *Source Bas Pijls
 */

float tileSize = 50;
int wall = 1, floor = 2;

//int spawnXPosition = 20;
//int spawnYPosition = 20;

void loadLevel(String levelImageName) {
  //laad het plaatje van de map in
  PImage levelImage = loadImage(levelImageName);

  //gaat door alle pixels van het plaatje heen
  for (int iX = 0; iX < levelImage.width; iX++) {
    for (int iY = 0; iY < levelImage.height; iY++) {
      //calulate the cordiante based on the pixel postition and the tile size. 
      float spawnX = iX * tileSize;
      float spawnY = iY * tileSize;

      //voor de kleur rood word een wallTile geplaatst
      if (levelImage.get(iX, iY) == color(255, 0, 0)) {
        //plaatst een muur type
        Tile tile = new Tile(gameState.images.tiles[3], spawnX, spawnY, tileSize, tileSize, wall); 
        tiles.add(tile);
      } 

      //colour black = path
      if (levelImage.get(iX, iY) == color(0, 0, 0)) {
        Tile tile = new Tile(gameState.images.tiles[5], spawnX, spawnY, tileSize, tileSize, floor); 
        tiles.add(tile);
      }

      //colour wit = path + geeft aan waar de speedpad moet
      if (levelImage.get(iX, iY) == color(255, 255, 255)) {
        print("Speedpad X: "+ iX + " SpeedPad Y: " + iY);
        Tile tile = new Tile(gameState.images.tiles[5], spawnX, spawnY, tileSize, tileSize, floor); 
        tiles.add(tile);
      }

      //colour gray = wall
      if (levelImage.get(iX, iY) == color(160, 160, 160)) {
        //plaatst een muur type
        Tile tile = new Tile(gameState.images.tiles[6], spawnX, spawnY, tileSize, tileSize, wall); 
        tiles.add(tile);
      } 

      //colour green = wall Grass
      if (levelImage.get(iX, iY) == color(100, 255, 0)) {
        //plaatst een muur type
        Tile tile = new Tile(gameState.images.tiles[7], spawnX, spawnY, tileSize, tileSize, wall); 
        tiles.add(tile);
      } 

      //colour blue = wall Grass + Flower
      if (levelImage.get(iX, iY) == color(0, 200, 255)) {
        //plaatst een muur type
        Tile tile = new Tile(gameState.images.tiles[8], spawnX, spawnY, tileSize, tileSize, wall); 
        tiles.add(tile);
      } 

      //colour purple = wall Grass + Flower
      if (levelImage.get(iX, iY) == color(255, 0, 250)) {
        //plaatst een muur type
        Tile tile = new Tile(gameState.images.tiles[9], spawnX, spawnY, tileSize, tileSize, wall); 
        tiles.add(tile);
      }


      if (levelImage.get(iX, iY) == color(#603913)) {
        Tile tile = new Tile(gameState.images.tiles[5], spawnX, spawnY, tileSize, tileSize, floor); 
        tiles.add(tile);
      }
    }
  }
}
