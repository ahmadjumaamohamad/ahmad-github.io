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

float onOffMenuX, onOffMenuY, onOffMenuM, onOffMenuN, onOffMenuA, onOffMenuB;

float musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight;
float displayMenuX, displaMenuY, displayMenuWidth, displayMenuHeight;
float lineX, lineY, lineWidth, lineHeight;
//float X, Y, Extent;
float menuX, menuY, menuWidth, menuHeight;
//
float loopOnceX,loopOnceY, loopOnceExtent;
float loopInfiniteX, loopInfiniteY, loopInfiniteExtent;

float previousX, previousY, previousExtent;
float pauseX, pauseY, pauseExtent;
float nextX, nextY, nextExtent;
//float X,Y, Width, Height;

float soundEffectsX, soundEffectsY, soundEffectsWidth, soundEffectsHeight;
Boolean musicButtonOFF=false;
Boolean deactiveateAutoPlay=false;
//
void setup() {
  fullScreen();
  background(25);
  
  appWidth = displayWidth;
  appHeight = displayHeight;
  
  onOffMenuX = displayWidth*0.05/10;
  onOffMenuY = displayHeight*2.1/10;
  onOffMenuM = displayWidth*0.05/10;
  onOffMenuN = displayHeight*2.4/10;
  onOffMenuA = displayWidth*0.2/10;
  onOffMenuB = displayHeight*2.265/10;
  
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
  
  //rect(X, Y Width, Height);
  //rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  fill(200);
  //rect(menuX, menuY, menuWidth, menuHeight);
  triangle(onOffMenuX, onOffMenuY, onOffMenuM, onOffMenuN, onOffMenuA, onOffMenuB);


 
  //circle();

  //music loading 
  String musicPathway = "Music/";
  String Cycles = "Cycles";
  String fileExtension_mp3 = ".mp3";
  
  String musicDirectory = "../" + musicPathway;
  String file = musicDirectory + Cycles + fileExtension_mp3;
  println( file );
 // playList[ currentSong ] = minim.loadFile( file ); // Error: Verify library installed, sketch / inport libarary.
  //Music testing
  


} //End setup


void draw() {
  
  if ( playList[currentSong].isPlaying()==false && deactiveateAutoPlay==false){
    playList[currentSong].loop(0);
  }


  if ( musicButtonOFF==false ) rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  if ( musicButtonOFF==true && mouseX>musicMenuX && mouseX<musicMenuX+musicMenuWidth && mouseY>musicMenuY && mouseY<musicMenuY+musicMenuHeight ) {

  rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  rect(lineX, lineY, lineWidth, lineHeight);
  circle(pauseX, pauseY, pauseExtent);
  circle(nextX, nextY, nextExtent);
  circle(previousX, previousY, previousExtent);
  
  circle(loopOnceX,loopOnceY, loopOnceExtent);
  circle(loopInfiniteX, loopInfiniteY, loopInfiniteExtent);
  }
//
}
void mouseClicked(){

} //End draw onOffButtonX, onOffButtonY, onOffButtonM, onOffButtonN, onOffButtonA, onOffButtonB;
void mousePressed() {
   // if ( mouseX>onOffMenuX && mouseX<onOffButtonM+onOffButtonN && mouseY>onOffButtonA && mouseY<onOffButtonY+onOffButtonHeight) {
 //   if ( musicButtonOFF==false ) {
  //    musicMenuWidth=displayWidth*1.8/10;
  //    musicButtonOFF=true;
   // } else if ( mouseX>onOffButtonX && mouseX<onOffButtonX+onOffButt && mouseY>onOffButtonY && mouseY<onOffButtonY+onOffButtonHeight) {
      
 //   musicButtonOFF=true;
 // }
 //    else {
  //    ;
  //    musicButtonOFF=true;
  //  }
 // }
 
} //End mousePressed


void mouseMoved(){

  
}
//
void keyPressed() {} //End keyPressed
//
// End Main Program
