// Click within the image to change 
// the value of the rectangle
float offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB;
int value = 0;
void setup(){
  fullScreen();
  background(25);
  //appWidth = displayWidth;
 // appHeight = displayHeight;
  
  offMenuX = displayWidth*0.05/10;
  offMenuY = displayHeight*2.1/10;
  offMenuM = displayWidth*0.05/10;
  offMenuN = displayHeight*2.4/10;
  offMenuA = displayWidth*0.2/10;
  offMenuB = displayHeight*2.265/10;
  float triangleArea = offMenuX
  
}
void draw() {
  fill(value);
  triangle(offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
  
}

void mousePressed() {
  if ( mouseX>offMenuX+offMenuM && mouseX<offMenuX+offMenuY && mouseY>musicMenuY && mouseY<musicMenuY+musicMenuHeight) {
    if ( musicButtonOFF==false ) {
      musicMenuWidth=displayWidth;
      musicButtonOFF=true;
    } else {
      musicMenuWidth=displayWidth*1/10;
      musicButtonOFF=true;
    }
  }
}
