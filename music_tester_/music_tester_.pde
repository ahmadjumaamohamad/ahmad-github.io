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

float musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight;
float displayMenuX, displaMenuY, displayMenuWidth, displayMenuHeight;
float soundEffectsX, soundEffectsY, soundEffectsWidth, soundEffectsHeight;
Boolean musicButtonOFF=false;

void setup() {
  //Display
  fullScreen();
  background(0);
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  musicMenuX = displayWidth*1/10;
  musicMenuY = displayHeight*9/10;
  musicMenuWidth = displayWidth*1/10;
  musicMenuHeight = displayHeight*1/10;
  //
  soundEffectsX = musicMenuX + musicMenuWidth;
  soundEffectsY = musicMenuY + musicMenuHeight;
  soundEffectsWidth = musicMenuX + musicMenuWidth*1/2;
  soundEffectsHeight = musicMenuY + musicMenuHeight*1/2;
  //
  displayMenuX = displayWidth*1/9;
  displaMenuY = displayWidth*1/3;
  displayMenuWidth = displayWidth*1/4;
  displayMenuHeight = displayWidth*1/4;

  //rect(soundEffectsX, soundEffectsY, soundEffectsWidth, soundEffectsHeight);
  //rect(X, Y, Width, Height);
  //rect(X, Y, Width, Height);
  //rect(X, Y, Width, Height);
  rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  rect(displayMenuX, displaMenuY, displayMenuWidth, displayMenuHeight);
  //music loading

  minim = new Minim(this);
  String musicPathway = "Music/";
  String Cycles = "Cycles";
  String fileExtension_mp3 = ".mp3";

  String musicDirectory = "../../../../" + musicPathway;
  String file = musicDirectory + Cycles + fileExtension_mp3;
  playList[ currentSong ] = minim.loadFile( file ); // Error: Verify library installed, sketch / inport libarary.
  println( file );
  //Music testing
  // playList[ currentSong ].play();
} //End setup
//
void draw() {
  if ( musicButtonOFF==false ) rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  if ( musicButtonOFF==true && mouseX>musicMenuX && mouseX<musicMenuX+musicMenuWidth && mouseY>musicMenuY && mouseY<musicMenuY+musicMenuHeight ) {

    rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  }
} //End draw
//
void mousePressed() {
  if ( mouseX>musicMenuX && mouseX<musicMenuX+musicMenuWidth && mouseY>musicMenuY && mouseY<musicMenuY+musicMenuHeight) {
    if ( musicButtonOFF==false ) {
      musicMenuWidth=displayWidth;
      musicButtonOFF=true;
    } else {
      musicMenuWidth=displayWidth*1/10;
      musicButtonOFF=true;
    }
  }
} //End mousePressed
//
void keyPressed() {
} //End keyPressed

// End Main Program
