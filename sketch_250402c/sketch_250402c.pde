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
}

void draw() {
  background(0);

  // Draw triangle button if not OFF, or if hovered over
  if (!musicButtonOFF || 
     (musicButtonOFF && mouseX > musicMenuX && mouseX < musicMenuX + musicMenuWidth &&
      mouseY > musicMenuY && mouseY < musicMenuY + musicMenuHeight)) {
    fill(255, 0, 0); // red
    drawTriangleButton(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  }

  // Display menu
  fill(255);
  rect(displayMenuX, displayMenuY, displayMenuWidth, displayMenuHeight);
}

// Draws the play-style triangle button
void drawTriangleButton(float x, float y, float w, float h) {
  float x1 = x + w/2;
  float y1 = y;
  float x2 = x;
  float y2 = y + h;
  float x3 = x + w;
  float y3 = y + h;
  triangle(x1, y1, x2, y2, x3, y3);
}

// Utility: point inside triangle using area comparison
boolean pointInTriangle(float px, float py, float ax, float ay, float bx, float by, float cx, float cy) {
  float areaOrig = abs((bx - ax)*(cy - ay) - (cx - ax)*(by - ay));
  float area1 = abs((ax - px)*(by - py) - (bx - px)*(ay - py));
  float area2 = abs((bx - px)*(cy - py) - (cx - px)*(by - py));
  float area3 = abs((cx - px)*(ay - py) - (ax - px)*(cy - py));
  return (area1 + area2 + area3) <= areaOrig + 0.5;
}

void mousePressed() {
  // Triangle vertices
  float x1 = musicMenuX + musicMenuWidth/2;
  float y1 = musicMenuY;
  float x2 = musicMenuX;
  float y2 = musicMenuY + musicMenuHeight;
  float x3 = musicMenuX + musicMenuWidth;
  float y3 = musicMenuY + musicMenuHeight;

  if (pointInTriangle(mouseX, mouseY, x1, y1, x2, y2, x3, y3)) {
    musicButtonOFF = !musicButtonOFF; // Toggle state

    if (musicButtonOFF) {
      musicMenuWidth = appWidth; // Expand
    } else {
      musicMenuWidth = appWidth * 1/10; // Collapse
    }
  }
    if ( mouseX>musicMenuX && mouseX<musicMenuX+musicMenuWidth && mouseY>musicMenuY && mouseY<musicMenuY+musicMenuHeight) {
    if ( musicButtonOFF==false ) {
      musicMenuWidth=displayWidth;
      musicButtonOFF=true;
    } else {
      musicMenuWidth=displayWidth*1/10;
      musicButtonOFF=true;
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
