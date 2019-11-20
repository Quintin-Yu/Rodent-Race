/**
 *@author Bowen Schlahmilch(met hulp van Johnathan Claasen)
 */
class CheckPoint {

  float xPosStart, yPosStart, xPosEind, yPosEind;
  //Making the checkpoint
  CheckPoint(float xPosStart, float yPosStart, float xPosEind, float yPosEind) {
    this.xPosStart = xPosStart;
    this.yPosStart = yPosStart;
    this.xPosEind = xPosEind;
    this.yPosEind = yPosEind;

    line(xPosStart, yPosStart, xPosEind, yPosEind);
  }

  //Collision for the checkpoints
  boolean collidesWithPlayer(Player aPlayer) {
    if ((xPosStart< aPlayer.location.x + aPlayer.playerSize/2 || xPosEind < aPlayer.location.x + aPlayer.playerSize/2) && 
      (xPosStart > aPlayer.location.x - aPlayer.playerSize/2 || xPosEind > aPlayer.location.x - aPlayer.playerSize/2) && 
      (yPosStart < aPlayer.location.y + aPlayer.playerSize/2 || yPosEind < aPlayer.location.y + aPlayer.playerSize/2) && 
      (yPosStart > aPlayer.location.y - aPlayer.playerSize/2 || yPosEind > aPlayer.location.y - aPlayer.playerSize/2)) {
      return true;
    } else {
      return false;
    }
  }
}
