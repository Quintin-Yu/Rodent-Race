/**
 *@author Johnathan Claasen
 */
//This class is used to create the credits screen. This is where we loop through all the people that are responsible for the creation of RodentRace and draw this to the screen.

class Credits {
  boolean inCredits = true;
  float x, y, margin = 20, ySpeed = 1;
  ArrayList<String> credits = new ArrayList<String>();

  //Construct the credits class.
  Credits() {
    String[] creators = {"Johnathan Claasen ", "Jesse Egmond ", "Timo Omta ", "Bowen Schlahmilch ", "Quintin Yu "};
    String[] roles = {"Developer ", "Artist ", "Musician "};
    String[] specialThanks = {"All the Artwork creators and GOOGLE! ", "Bas Pijls(Hamster) ", "Kenny's assets! ", "Samantha van Zandwijk (aka Eekhoorn)", 
      "'Handpainted Stone Tile Textures' by PamNawi", "licensed CC-BY4.0 or CC0:", "https://opengameart.org/content/handpainted-stone-tile-textures", 
      "'Terracotta/beige stone tile floor 256px' by Tiziana", "licensed LGPL 2.1, LGPL 3.0 or CC-BY 3.0:", "https://opengameart.org/content/terracottabeige-stone-tile-floor-256px" };

    //For all of the items in the 3 arrays add each item to credits.
    for (int i = 0; i < creators.length; i++) {
      credits.add(creators[i]);
      //print(credits.get(i));
    }

    for (int i = 0; i < roles.length; i++) {
      credits.add(roles[i]);
    }

    for (int i = 0; i < specialThanks.length; i++) {
      credits.add(specialThanks[i]);
    }
  }

  void draw() {
    if (inCredits) {
      gameState.images.background[1].resize(width, height);
      background(gameState.images.background[1]);
      update();
      drawCredits();
    }
  }

  //Draw the credits
  void drawCredits() {
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Credits!", width / 2, height - (y + 50));
    textSize(18);

    //For all the credit items draw to screen and move them
    for (int i = 0; i< credits.size(); i++) {
      text(credits.get(i), width / 2, height - y + (i * margin));
    }
  }

  void update() {
    y += ySpeed;
  }
}
