/**
 *@author Quintin Yu
 *Source Bas Pijls
 */

//This class is used to check how ling a actuib nat take.
class Cooldown {

  int lastFrameTime;
  int lastFrameduration;
  int currentFrameTime;
  int duration;
  int maxDuration;

  Cooldown(int maxDuration) {
    lastFrameTime = 0;
    lastFrameduration = 0;
    currentFrameTime = 0;
    duration = 0;
    this.maxDuration = maxDuration;
  }

  //Calculates the current time that has passed in milli seconds for the duration of a surtain thing.
  void update() {
    currentFrameTime = millis();
    lastFrameduration = currentFrameTime - lastFrameTime;

    if (duration > 0)
      duration -= lastFrameduration;

    lastFrameTime = currentFrameTime;
  }

  //Checks if the timer is active.
  boolean isActive() {
    return duration > 0;
  }
  //Trigger sets the duration an actioon may take to the maxDuration set in the constructor for this class.
  void trigger() {
    duration = maxDuration;
  }
  //When the duration is over it is reset to 0
  void durationReset() {
    duration = 0;
  }
}
