/**
 *@author Quintin Yu
 */
class Selector {
  boolean inSelector = true;
  int charNum, earWidth, earHeight, faceWidth, faceHeight, rodentSize, ballSize;
  float posX, posY;
  String[] text = new String[2];
  Images images;

  Selector( int charNum) {
    posX = width / 2;
    posY = height /2;
    ballSize = 240;
    rodentSize = 220;
    earWidth = 120;
    earHeight = 100;
    faceWidth = 300;
    faceHeight = 250;
    this.charNum = charNum;

    images = new Images();

    text[0] = "Squirrel";
    text[1] = "Chinchilla";
  }

  void draw() {
    if (inSelector) {
      gameState.images.background[2].resize(width, height);
      background(gameState.images.background[2]);
      boxes();
      display();
    }
  }

  //loads in the characters you can select and givees you extra directions on how to switch character.
  void display() {  
    fill(0);
    imageMode(CENTER);
    textAlign(CENTER);
    textSize(60);
    text(text[charNum], posX, 300);
    imageMode(CENTER);
    tint(255, 220);
    image(images.characters[charNum], posX, posY, rodentSize, rodentSize);
    tint(255, 150);
    image(images.hamsterBall, posX, posY, ballSize, ballSize);
    textSize(30);
    textAlign(RIGHT);
    text("◄ = previous\ncharacter", posX - rodentSize, posY);
    textAlign(LEFT);
    text("► = next\ncharacter", posX + rodentSize, posY);
  }

  //Loads in the background
  void boxes() {
    noStroke();
    fill(255, 0, 0);
    //Draws Ears
    ellipseMode(CENTER);
    ellipse(posX - rodentSize / 2.2, posY - rodentSize / 2.3, earWidth, earHeight);
    ellipseMode(CENTER);
    ellipse(posX + rodentSize / 2.2, posY - rodentSize / 2.3, earWidth, earHeight);
    ellipse(posX, posY, faceWidth, faceHeight);
  }
}
