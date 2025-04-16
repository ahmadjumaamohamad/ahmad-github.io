import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Dynamic Programming v Static
//
//Library - Minim
Minim minim;
int numberOfSongs = 1;
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
int currentSong = numberOfSongs - numberOfSongs;
//Global Variables


int appWidth, appHeight;
float musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight;
//
void setup() {
  //Display
  fullScreen();
  appWidth = width;
  appHeight = height;
  //
  minim = new Minim(this);
  String musicPathway = "Music/";
  String songName = "Cycles";
  String fileExtension = ".mp3";
  String musicDirectory = "../../../" + musicPathway;
  String filePath = musicDirectory + songName + fileExtension;
  println("Loaded: " + filePath);
  
  playList[currentSong] = minim.loadFile(filePath);
  //playList[currentSong].play();  
  musicMenuX = displayWidth*1/4;
  musicMenuY = displayHeight*1/4;
  musicMenuWidth = displayWidth*1/2;
  musicMenuHeight = displayHeight*1/2;
  //
  //rect(X, Y Width, Height);
  rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  //
  
  
 
  
  
  
} //End setup
//
void draw() {} //End draw
//
void mousePressed() {} //End mousePressed
//
void keyPressed() {
 // if ( key == 'K' || key == 'k') playList[currentSong].loop(0);
  //if ( key == 'L' || key == 'l') playList[currentSong].rewind();
  //if ( key == 'J' || key == 'j') playList[currentSong].pause();
  
    
  

} //End keyPressed
//
// End Main Program
