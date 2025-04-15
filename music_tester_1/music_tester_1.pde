import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
 
//Dynamic Programming v Static
float c;
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
float pauseX, pauseY, pauseExtent;
float nextX, nextY, nextExtent;
//float X,Y, Width, Height;

float soundEffectsX, soundEffectsY, soundEffectsWidth, soundEffectsHeight;
Boolean musicButtonOFF=false;
//
void setup() {
  fullScreen();
  background(176,224,230);
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  musicMenuX = displayWidth*0/10;
  musicMenuY = displayHeight*1/10;
  musicMenuWidth = displayWidth*2/10;
  musicMenuHeight = displayHeight*0.9/10;
  //
  pauseX = musicMenuX + musicMenuWidth*15/20;
  pauseY = musicMenuY + musicMenuHeight*1/2;
  pauseExtent = musicMenuX + musicMenuWidth*12/100;
  
  nextX = musicMenuX + musicMenuWidth*10.6/12;
  nextY = musicMenuY + musicMenuHeight*1/2;
  nextExtent = musicMenuX + musicMenuWidth*10/100;
  
  previousX = musicMenuX + musicMenuWidth*7.4/12;
  previousY = musicMenuY + musicMenuHeight*1/2;
  previousExtent = musicMenuX + musicMenuWidth*10/100;

  loopInfiniteX = musicMenuX + musicMenuWidth*1/2;
  loopInfiniteY = musicMenuY + musicMenuHeight*1/2;
  loopInfiniteExtent = musicMenuX + musicMenuWidth*12/100;
  
  loopOnceX = musicMenuX + musicMenuWidth*1/2;
  loopOnceY = musicMenuY + musicMenuHeight*1/2;
  loopOnceExtent = musicMenuX + musicMenuWidth*12/100;
  //rect(X, Y Width, Height);
  //rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  
  circle(pauseX, pauseY, pauseExtent);
  circle(nextX, nextY, nextExtent);
  circle(previousX, previousY, previousExtent);
  
  //circle(loopOnceX,loopOnceY, loopOnceExtent);
  //circle(loopInfiniteX, loopInfiniteY, loopInfiniteExtent);
  //circle();

  //music loading 
  String musicPathway = "Music/";
  String Cycles = "Cycles";
  String fileExtension_mp3 = ".mp3";
  
  String musicDirectory = "../../../../" + musicPathway;
  String file = musicDirectory + Cycles + fileExtension_mp3;
 // playList[ currentSong ] = minim.loadfile( file ); // Error: Verify library installed, sketch / inport libarary.
  println( file );
  //Music testing
  

   rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
} //End setup


void draw() {   

   

} //End draw
//
void mousePressed() {} //End mousePressed
//
void keyPressed() {} //End keyPressed
//
// End Main Program
