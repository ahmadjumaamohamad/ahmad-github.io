/**
 * Button. 
 * 
 * Click on one of the colored shapes in the 
 * center of the image to change the color of 
 * the background. 
 */
int appWidth, appHeight;
float loopOnceX,loopOnceY, loopOnceExtent;   // Diameter of circle
color circleColor, baseColor;
color circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

void setup() {
  size(640, 360);

  appWidth = displayWidth;
  appHeight = displayHeight;
  
  loopOnceX = displayWidth*1/10;
  loopOnceY = displayHeight*1/10;
  loopOnceExtent = displayWidth*1/10;
  
  circleColor = color(255);
  circleHighlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;

  
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
  stroke(255);
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  circle(loopOnceX,loopOnceY, loopOnceExtent);
}

void update(float x, float y) {
  if (overCircle(loopOnceX,loopOnceY, loopOnceExtent) ) {
    circleOver = true;
  } else {
    circleOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
  }
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
