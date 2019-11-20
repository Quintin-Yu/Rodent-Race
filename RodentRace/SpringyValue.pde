/**
 *@author Bas Pijls
 */
//This class is used for the spring effect of the player attached to the lead ball.
class SpringyValue {

  float p0, p, v, a, k, c, m;

  //Constructor
  SpringyValue() {
    p0 = 0;
    p = 125;
    v = 0;
    a = 0;
    k = 1;
    c = 1;
    m = 1;
  }

  void update(float dt) {

    k = 8;
    c = 2.5;
    m = 1;
    a = (-k*(p-p0) - c*v)/m;
    v += a * dt;
    p += v * dt;
  }
}
