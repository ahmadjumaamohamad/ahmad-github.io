import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
int numberOfSongs = 8;
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
int currentSong = numberOfSongs - numberOfSongs;
//Global Variables
int appWidth, appHeight;
//music menu
float offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB;
float onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB;
float musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight;
//music button
float cx = musicMenuX;
float cy = musicMenuY;
float cw = musicMenuWidth;
float ch = musicMenuHeight;

float lineX, lineY, lineWidth, lineHeight;
float loopOnceX,loopOnceY, loopOnceExtent;
float loopInfiniteX, loopInfiniteY, loopInfiniteExtent;
float previousX, previousY, previousExtent;
float pauseX, pauseY, pauseExtent;
float nextX, nextY, nextExtent;

float soundEffectsX, soundEffectsY, soundEffectsWidth, soundEffectsHeight;
float exitX, exiteY, exiteWidth, exiteHeight;
//images;
PImage[] images;
int totalImages = 10; 

float rectX, rectY, rectW, rectH;
//float X,Y, Width, Height;
//float X, Y, Extent;

Boolean deactiveateAutoPlay=false;
boolean musicButtonOFF = false;
// Global variables
  // Diameter of circle

void setup() {
  fullScreen();
  background(176, 224, 230);

  appWidth = displayWidth;
  appHeight = displayHeight;

  exitX = displayWidth*9.6/10;
  exiteY = displayHeight*0/10;
  exiteWidth = displayWidth*0.40/10;
  exiteHeight = displayHeight*0.5/10;

  onMenuX = displayWidth * 0.05 / 10;
  onMenuY = displayHeight * 2.1 / 10;
  onMenuM = onMenuX;
  onMenuN = displayHeight * 2.4 / 10;
  onMenuA = displayWidth * 0.2 / 10;
  onMenuB = displayHeight * 2.265 / 10;

  offMenuX = displayWidth * 1 / 10;
  offMenuY = displayHeight * 2.1 / 10;
  offMenuM = offMenuX;
  offMenuN = displayHeight * 2.4 / 10;
  offMenuA = displayWidth * 1.1 / 10;
  offMenuB = displayHeight * 2.265 / 10;
 
  //img
  String path = sketchPath("image");
  File folder = new File(path);
  String[] filenames = folder.list((dir, name) -> name.endsWith(".png"));
  
  images = new PImage[filenames.length];
  
  for (int i = 0; i < filenames.length; i++) {
    images[i] = loadImage(filenames[i]);
  }
//gif
  frames = new PImage[totalFrames];
  for (int i = 0; i < totalFrames; i++) {
    String filename = "frame_" + (i + 1) + "_delay-0.04s.png";
    frames[i] = loadImage(filename);
  }

  // Load music
  minim = new Minim(this);
  String musicPathway = "Music/";
  String songName = "Cycles";
  String fileExtension = ".mp3";
  String musicDirectory = "../../" + musicPathway;
  String filePath = musicDirectory + songName + fileExtension;

  playList[currentSong] = minim.loadFile(filePath);
  println("Loaded: " + filePath);
  fill(220,220,220);
  rect(exitX, exiteY, exiteWidth, exiteHeight);

}

void draw() {
  //background(176, 224, 230); // Redraw background to avoid overdraw
  PImage frameToDisplay = getNextFrame();
  update(mouseX, mouseY);
  stroke(0);
  strokeWeight(2);
  fill(255, 255, 255);

  //image(frameToDisplay, x, y, width, height);  
  if (!musicButtonOFF) {
    // Draw ON triangle
    triangle(onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
  }
  else if (musicButtonOFF) {
    strokeWeight(6);
    rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
    image(frameToDisplay,musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
    strokeWeight(2);
    rect(lineX, lineY, lineWidth, lineHeight);

    image(images[4], loopOnceX - loopOnceExtent / 2, loopOnceY - loopOnceExtent / 2, loopOnceExtent, loopOnceExtent);
    image(images[5], loopInfiniteX - loopInfiniteExtent / 2, loopInfiniteY - loopInfiniteExtent / 2, loopInfiniteExtent, loopInfiniteExtent);
    image(images[1], nextX - nextExtent / 2, nextY - nextExtent / 2, nextExtent, nextExtent);
    image(images[2], pauseX - pauseExtent / 2, pauseY - pauseExtent / 2, pauseExtent, pauseExtent);
    image(images[3], previousX - previousExtent / 2, previousY - previousExtent / 2, previousExtent, previousExtent);
    
    // Show OFF triangle
    triangle(offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
  }
}

// Mouse interaction
void mousePressed() {
  boolean clickedOn = pointInTriangle(mouseX, mouseY, onMenuX, onMenuY, onMenuM, onMenuN, onMenuA, onMenuB);
  boolean clickedOff = pointInTriangle(mouseX, mouseY, offMenuX, offMenuY, offMenuM, offMenuN, offMenuA, offMenuB);
  
  if (clickedOn) {
    // Activate music menu
    musicMenuX = displayWidth * 0 / 10;
    musicMenuY = displayHeight * 2 / 10;
    musicMenuWidth = displayWidth * 1.7 / 10;
    musicMenuHeight = displayHeight * 0.54 / 10;

    // Update triangle for OFF button
    offMenuX = displayWidth * 1.75 / 10;
    offMenuY = displayHeight * 2.1 / 10;
    offMenuM = offMenuX;
    offMenuN = displayHeight * 2.4 / 10;
    offMenuA = displayWidth * 1.9 / 10;
    offMenuB = displayHeight * 2.265 / 10;

    // Update music button layout positions
    cx = musicMenuX;
    cy = musicMenuY;
    cw = musicMenuWidth;
    ch = musicMenuHeight;

    lineX = cx + cw * 0.02;
    lineY = cy + ch * 0.84;
    lineWidth = cw * 0.95;
    lineHeight = ch * 0.1;

    pauseX = cx + cw * 0.725;
    pauseY = cy + ch * 0.447;
    pauseExtent = cw * 0.109;

    nextX = cx + cw * 0.87;
    nextY = cy + ch * 0.46;
    nextExtent = cw * 0.102;

    previousX = cx + cw * 0.58;
    previousY = cy + ch * 0.46;
    previousExtent = cw * 0.102;

    loopInfiniteX = cx + cw * 0.35;
    loopInfiniteY = cy + ch * 0.45;
    loopInfiniteExtent = cw * 0.1;

    loopOnceX = cx + cw * 0.20;
    loopOnceY = cy + ch * 0.45;
    loopOnceExtent = cw * 0.107;

    soundEffectsX = cx + cw;
    soundEffectsY = cy + ch;
    soundEffectsWidth = cw * 0.5;
    soundEffectsHeight = ch * 0.5;

    musicButtonOFF = true;
  } 
  else if (clickedOff) {
    // Deactivate music menu
    musicButtonOFF = false;
  }

}
void keyPressed()  {
  if (key == 'Q'){
    exit();
  }
}


// Utility: check if a point is inside a triangle
boolean pointInTriangle(float px, float py, float x1, float y1, float x2, float y2,float x3, float y3) {
  float areaTotal = triangleArea(x1, y1, x2, y2, x3, y3);
  float area1 = triangleArea(px, py, x2, y2, x3, y3);
  float area2 = triangleArea(x1, y1, px, py, x3, y3);
  float area3 = triangleArea(x1, y1, x2, y2, px, py);

  float sumAreas = area1 + area2 + area3;
  return abs(areaTotal - sumAreas) < 0.01;
}

// Helper: compute area of triangle
float triangleArea(float x1, float y1, float x2, float y2, float x3, float y3) {
  return 0.5 * abs(x1 * (y2 - y3) +
                   x2 * (y3 - y1) +
                   x3 * (y1 - y2));
}
