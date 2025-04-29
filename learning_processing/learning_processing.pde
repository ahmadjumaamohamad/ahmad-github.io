// Triangle vertices
int appWidth, appHeight;

float musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight;
float displayMenuX, displaMenuY, displayMenuWidth, displayMenuHeight;

float onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB;
float offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB;
Boolean musicButtonOFF=false;

void setup() {
  fullScreen();
  background(176,224,230);
  
  
  appWidth = displayWidth;
  appHeight = displayHeight;
  
  /*musicMenuX = displayWidth*0/10;
  musicMenuY = displayHeight*1/10;
  musicMenuWidth = displayWidth*2/10;
  musicMenuHeight = displayHeight*0.9/10;*/
  // UI Layout Setup
  offMenuX = displayWidth*1/10;
  offMenuY = displayHeight*2.1/10;
  offMenuM = displayWidth*1/10;
  offMenuN = displayHeight*2.4/10;
  offMenuA = displayWidth*1.1/10;
  offMenuB = displayHeight*2.265/10;
  
  onMenuX = displayWidth*0.05/10;
  onMenuY = displayHeight*2.1/10;
  onMenuM = displayWidth*0.05/10;
  onMenuN = displayHeight*2.4/10;
  onMenuA = displayWidth*0.2/10;
  onMenuB = displayHeight*2.265/10;
  
  // Define triangle points (you can adjust)

  
  
}

void draw() {
  
  
  // Check if mouse is inside
  boolean inside = pointInTriangle(mouseX, mouseY, onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
  //boolean change = pointInTriangle(mouseX, mouseY, offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
  // Set color based on inside or outside
  if ( musicButtonOFF==false ) triangle(onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
  if ( musicButtonOFF==true && inside) {
    triangle(offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
     rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  }
  stroke(0);
  strokeWeight(2);
  
  // Draw triangle
  //triangle(x1, y1, x2, y2, x3, y3);
  //triangle(onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
  //triangle(offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
  

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
boolean inside = pointInTriangle(mouseX, mouseY, onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
  
  if (inside) {
    musicMenuX = displayWidth*0/10;
    musicMenuY = displayHeight*2/10;
    musicMenuWidth = displayWidth*1.85/10;
    musicMenuHeight = displayHeight*0.5/10;
    
    offMenuX = displayWidth*1.9/10;
    offMenuY = displayHeight*2.1/10;
    offMenuM = displayWidth*1.9/10;
    offMenuN = displayHeight*2.4/10;
    offMenuA = displayWidth*2.05/10;
    offMenuB = displayHeight*2.265/10;
    musicButtonOFF = true; 
  }// Toggle stat
   else {
    musicButtonOFF=true;
    }
  

 
  
}
