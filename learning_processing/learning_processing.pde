// Triangle vertices
int appWidth, appHeight;
float x1, y1, x2, y2, x3, y3;

float onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB;
float offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB;
Boolean musicButtonOFF=false;

void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  background(55);

  // UI Layout Setup
  offMenuX = displayWidth*0.7/10;
  offMenuY = displayHeight*2.2/10;
  offMenuM = displayWidth*0.06/10;
  offMenuN = displayHeight*2.5/10;
  offMenuA = displayWidth*0.3/10;
  offMenuB = displayHeight*2.3/10;
  
  onMenuX = displayWidth*0.05/10;
  onMenuY = displayHeight*2.1/10;
  onMenuM = displayWidth*0.05/10;
  onMenuN = displayHeight*2.4/10;
  onMenuA = displayWidth*0.2/10;
  onMenuB = displayHeight*2.265/10;
  
  // Define triangle points (you can adjust)
  x1 = width * 0.2;
  y1 = height * 0.2;
  x2 = width * 0.3;
  y2 = height * 0.5;
  x3 = width * 0.5;
  y3 = height * 0.3;
  
  triangle(onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
}

void draw() {
  
  
  // Check if mouse is inside
  boolean inside = pointInTriangle(mouseX, mouseY, onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
  
  // Set color based on inside or outside
  if (inside) {
     triangle(offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);// Semi-transparent green
  } else {
    triangle(onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB); // Semi-transparent red
  }
  stroke(0);
  strokeWeight(2);
  
  // Draw triangle
  //triangle(x1, y1, x2, y2, x3, y3);
  triangle(onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
  // Draw mouse point
  fill(0);
  noStroke();
 // ellipse(mouseX, mouseY, 10, 10);
  
  // Show status

}

// Utility: check if point is inside triangle
boolean pointInTriangle(float px, float py, float x1, float y1, float x2, float y2, float x3, float y3) {
  float areaTotal = triangleArea(x1, y1, x2, y2, x3, y3);
  float area1 = triangleArea(px, py, x2, y2, x3, y3);
  float area2 = triangleArea(x1, y1, px, py, x3, y3);
  float area3 = triangleArea(x1, y1, x2, y2, px, py);
  
  float sumAreas = area1 + area2 + area3;
  
  return abs(areaTotal - sumAreas) < 0.01; // Small tolerance
}

// Helper: area of triangle
float triangleArea(float x1, float y1, float x2, float y2, float x3, float y3) {
  return 0.5 * abs(x1 * (y2 - y3) +
                   x2 * (y3 - y1) +
                   x3 * (y1 - y2));
}


void mousePressed() {
 /* boolean inside = pointInTriangle(mouseX, mouseY, offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
  
     if (inside && musicButtonOFF && !musicButtonOFF) {
       
    musicMenuWidth = displayWidth;
    musicButtonOFF = true;
  } else {
    fill(255, 0, 0, 150); // Semi-transparent red
  }*/

  if (pointInTriangle(mouseX, mouseY, offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB)) {
    onMenuX = displayWidth;
      musicButtonOFF = true; // Toggle state

    if (musicButtonOFF) {
      onMenuX = appWidth; // Expand
    } else {
      onMenuX = appWidth * 1/10; // Collapse
    }
  }

 
  
}
