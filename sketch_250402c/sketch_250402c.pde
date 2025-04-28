import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
 
//Dynamic Programming v Static

//Library - Minim
Minim minim;
int numberOfSongs = 8;
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
int currentSong = numberOfSongs - numberOfSongs;
//Global Variables
int appWidth, appHeight;
//music button
float offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB;
float onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB;
//music menu
float musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight;
float displayMenuX, displayMenuY, displayMenuWidth, displayMenuHeight;
float lineX, lineY, lineWidth, lineHeight;
float menuX, menuY, menuWidth, menuHeight;
float loopOnceX,loopOnceY, loopOnceExtent;
float loopInfiniteX, loopInfiniteY, loopInfiniteExtent;
float previousX, previousY, previousExtent;
float pauseX, pauseY, pauseExtent;
float nextX, nextY, nextExtent;

float soundEffectsX, soundEffectsY, soundEffectsWidth, soundEffectsHeight;

//float X,Y, Width, Height;
//float X, Y, Extent;


Boolean musicButtonOFF=false;
Boolean deactiveateAutoPlay=false;
//
void setup() {
  // Fullscreen display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  background(0);

  // UI Layout Setup
  onMenuX = displayWidth*0.05/10;
  onMenuY = displayHeight*2.1/10;
  onMenuM = displayWidth*0.05/10;
  onMenuN = displayHeight*2.4/10;
  onMenuA = displayWidth*0.2/10;
  onMenuB = displayHeight*2.265/10;
  
  offMenuX = displayWidth*0.05/10;
  offMenuY = displayHeight*2.1/10;
  offMenuM = displayWidth*0.05/10;
  offMenuN = displayHeight*2.4/10;
  offMenuA = displayWidth*0.2/10;
  offMenuB = displayHeight*2.265/10;
  
  musicMenuX = displayWidth*0/10;
  musicMenuY = displayHeight*1/10;
  musicMenuWidth = displayWidth*1.8/10;
  musicMenuHeight = displayHeight*0.9/10;
  
  lineX = musicMenuX + musicMenuWidth*0.5/10;
  lineY = musicMenuY + musicMenuHeight*8.5/10;
  lineWidth = musicMenuX + musicMenuWidth*9/10;
  lineHeight = musicMenuY + musicMenuHeight*-10/10;
  //
  pauseX = musicMenuX + musicMenuWidth*14.5/20;
  pauseY = musicMenuY + musicMenuHeight*1/2;
  pauseExtent = musicMenuX + musicMenuWidth*14/100;
  
  nextX = musicMenuX + musicMenuWidth*10.4/12;
  nextY = musicMenuY + musicMenuHeight*1/2;
  nextExtent = musicMenuX + musicMenuWidth*13/100;
  
  previousX = musicMenuX + musicMenuWidth*6.97/12;
  previousY = musicMenuY + musicMenuHeight*1/2;
  previousExtent = musicMenuX + musicMenuWidth*13/100;

  loopInfiniteX = musicMenuX + musicMenuWidth*3.5/10;
  loopInfiniteY = musicMenuY + musicMenuHeight*1/2;
  loopInfiniteExtent = musicMenuX + musicMenuWidth*14/100;
  
  loopOnceX = musicMenuX + musicMenuWidth*1.7/10;
  loopOnceY = musicMenuY + musicMenuHeight*1/2;
  loopOnceExtent = musicMenuX + musicMenuWidth*14/100;
  
  soundEffectsX = musicMenuX + musicMenuWidth;
  soundEffectsY = musicMenuY + musicMenuHeight;
  soundEffectsWidth = musicMenuX + musicMenuWidth * 1/2;
  soundEffectsHeight = musicMenuY + musicMenuHeight * 1/2;

  displayMenuX = appWidth * 1/9;
  displayMenuY = appHeight * 1/3;
  displayMenuWidth = appWidth * 1/4;
  displayMenuHeight = appWidth * 1/4;

  // Load music
  minim = new Minim(this);
  String musicPathway = "Music/";
  String songName = "Cycles";
  String fileExtension = ".mp3";
  String musicDirectory = "../../" + musicPathway;
  String filePath = musicDirectory + songName + fileExtension;

  playList[currentSong] = minim.loadFile(filePath);
  println("Loaded: " + filePath);
  
  
  
  
  
  
  
  
  
  
  
  
  
  rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
}

void draw() {
  background(0);

  // Draw triangle button if not OFF, or if hovered over
  // Display menu
 ellipse(mouseX, mouseY, 5, 5);
 
 
 triangle(offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
 /*
   if (!musicButtonOFF || 
     (musicButtonOFF && mouseX > musicMenuX && mouseX < musicMenuX + musicMenuWidth &&
      mouseY > musicMenuY && mouseY < musicMenuY + musicMenuHeight)) {
    fill(255, 0, 0); // red
    drawTriangleButton(offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
  }
*/
}

boolean pointInTriangle(float px, float py, float x1, float y1, float x2, float y2, float x3, float y3) {
  float areaTotal = triangleArea(x1, y1, x2, y2, x3, y3);
  float area1 = triangleArea(px, py, x2, y2, x3, y3);
  float area2 = triangleArea(x1, y1, px, py, x3, y3);
  float area3 = triangleArea(x1, y1, x2, y2, px, py);
  
  float sumAreas = area1 + area2 + area3;
  
  return abs(areaTotal - sumAreas) < 0.01; // Small tolerance
}
float triangleArea(float x1, float y1, float x2, float y2, float x3, float y3) {
  return 0.5 * abs(x1 * (y2 - y3) +
                   x2 * (y3 - y1) +
                   x3 * (y1 - y2));
}

// Draws the play-style triangle button
/*void drawTriangleButton(float x, float y, float w, float h, float n, float m) {
  float x1 = x;
  float y1 = y;
  float x2 = w;
  float y2 = h;
  float x3 = n;
  float y3 = m;
  triangle(x1, y1, x2, y2, x3, y3);
}*/

// Utility: point inside triangle using area comparison

// Helper: calculate area of triangle




void mousePressed() {
 /* boolean inside = pointInTriangle(mouseX, mouseY, offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
  
     if (inside && musicButtonOFF && !musicButtonOFF) {
       
    musicMenuWidth = displayWidth;
    musicButtonOFF = true;
  } else {
    fill(255, 0, 0, 150); // Semi-transparent red
  }*/

  if (pointInTriangle(mouseX, mouseY, offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB)) {
    musicMenuWidth = displayWidth;
      musicButtonOFF = true; // Toggle state

    if (musicButtonOFF) {
      musicMenuWidth = appWidth; // Expand
    } else {
      musicMenuWidth = appWidth * 1/10; // Collapse
    }
  }

  if (mouseX > musicMenuX && mouseX < musicMenuX + musicMenuWidth && mouseY > musicMenuY && mouseY < musicMenuY + musicMenuHeight) {
    if (!musicButtonOFF) {
      musicMenuWidth = displayWidth;
      musicButtonOFF = true;
    } else {
      musicMenuWidth = displayWidth * 1/10;
      musicButtonOFF = true;
    }
  }
}


void keyPressed() {
  // Optional: toggle play/pause on spacebar
  if (key == ' ') {
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].rewind();
      playList[currentSong].play();
    }
  }
}
