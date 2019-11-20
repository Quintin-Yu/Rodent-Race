/**
 *@author Bas Pijls
 */
//This class is a graphic that was first used in the original beta version of Rodent Race. 

class DrawHamster {

  void draw() {
    //Draw the hamster in the center of the screen
    stroke(1);
    strokeWeight(2);
    translate(width/2, height/2);
    fill(200, 150, 100);
    ellipse(-100, -100, 120, 100);
    ellipse(100, -100, 120, 100);
    fill(200, 200, 100);
    ellipse(-100, -100, 100, 80);
    ellipse(100, -100, 100, 80);
    fill(200, 150, 100);
    ellipse(0, 0, 300, 250);

    strokeWeight(10);
    fill(50);
    ellipse(-80, -50, 60, 60);
    ellipse(80, -50, 60, 60);
    fill(255);
    ellipse(-70, -60, 10, 10);
    ellipse(90, -60, 10, 10);
    ellipse(-90, -40, 30, 30);
    ellipse(70, -40, 30, 30);

    strokeWeight(2);
    fill(150);
    ellipse(0, 10, 50, 50);
    //noStroke();
    ellipse(-30, 30, 90, 70);
    ellipse(30, 30, 90, 70);
  }
}
