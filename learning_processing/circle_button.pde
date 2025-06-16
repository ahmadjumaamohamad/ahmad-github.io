/**
 * Button. 
 * 
 * Click on one of the colored shapes in the 
 * center of the image to change the color of 
 * the background. 
 */
boolean rectOver = false;
boolean circleOver = false;
float currentSize;


float expandCircle(float diameter){
  return diameter * 1.03;
}
boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
