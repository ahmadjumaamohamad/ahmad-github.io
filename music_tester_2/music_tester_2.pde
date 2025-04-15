import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Dynamic Programming v Static
PImage photo;
//Library - Minim
Minim minim;
int numberOfSongs = 8;
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
int currentSong = numberOfSongs - numberOfSongs;
//Global Variables
int appWidth, appHeight;
float musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight;
//
float displayMenuX, displaMenuY, displayMenuWidth, displayMenuHeight;
//
//float X,Y, Extent;
//float X,Y, Width, Height;
//
float loopOnceX,loopOnceY, loopOnceExtent;
float loopInfiniteX, loopInfiniteY, loopInfiniteExtent;

float previousX, previousY, previousExtent;
float pauseX, pauseY, pauseWidth, pauseHeight;
float nextX, nextY, nextExtent;
float X,Y, Width, Height;

float soundEffectsX, soundEffectsY, soundEffectsWidth, soundEffectsHeight;
Boolean musicButtonOFF=false;
//
void setup() {

  //photo = loadImage("pause-button.png");
  //background(204,0,0);
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  musicMenuX = displayWidth*0/10;
  musicMenuY = displayHeight*1/10;
  musicMenuWidth = displayWidth*2/10;
  musicMenuHeight = displayHeight*0.9/10;
  //
  //
 // pauseX = musicMenuX + musicMenuWidth*15/20;
 // pauseY = musicMenuY + musicMenuHeight*15/20;
//  pauseWidth = musicMenuX +musicMenuHeight*25/10;
  //pauseHeight = musicMenuY + musicMenuWidth*1/1000;
  
  nextX = musicMenuX + musicMenuWidth*11/12;
  nextY = musicMenuY + musicMenuHeight*1/2;
  nextExtent = musicMenuX + musicMenuWidth*14/100;
  
  previousX = musicMenuX + musicMenuWidth*7/12;
  previousY = musicMenuY + musicMenuHeight*1/2;
  previousExtent = musicMenuX + musicMenuWidth*14/100;
  
  loopInfiniteX = musicMenuX + musicMenuWidth*3/12;
  loopInfiniteY = musicMenuY + musicMenuHeight*1/2;
  loopInfiniteExtent = musicMenuX + musicMenuWidth*14/100;
  
  loopOnceX = musicMenuX + musicMenuWidth*1/12;
  loopOnceY = musicMenuY + musicMenuHeight*1/2;
  loopOnceExtent = musicMenuX + musicMenuWidth*14/100;
  //rect(X, Y Width, Height);
  rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  
  //rect(pauseX, pauseY, pauseWidth, pauseHeight);
  circle(nextX, nextY, nextExtent);
  circle(previousX, previousY, previousExtent);
  
  circle(loopOnceX,loopOnceY, loopOnceExtent);
  circle(loopInfiniteX, loopInfiniteY, loopInfiniteExtent);
  //circle();

  //music loading 
  String musicPathway = "Music/";
  String Cycles = "Cycles";
  String fileExtension_mp3 = ".mp3";
  
  String musicDirectory = ".../.../.../.../" + musicPathway;
  String file = musicDirectory + Cycles + fileExtension_mp3;
  //playList[ currentSong ] = minim.loadFile( file ); // Error: Verify library installed, sketch / inport libarary.
  println( file );
  //Music testing
} //End setup
//
void draw() {
//image(photo, pauseX, pauseY, pauseWidth, pauseHeight);
} //End draw
//
void mousePressed() {} //End mousePressed
//
void keyPressed() {} //End keyPressed
//
// End Main Program
