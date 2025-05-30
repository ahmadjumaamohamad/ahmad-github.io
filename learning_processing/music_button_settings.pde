void pauseContinueButton(){
  if ( playList[currentSong].isPlaying() ) {
    println("I am paused");
    playList[currentSong].pause();
    stopButtonTimer = second(); //Returns 0-59
}
  else {
    playList[currentSong].play();
    println("I am playing");
      }
}
void goForward(){
  if ( (stopTimeStamp!=0) && (second() <= stopTimeStamp) ) {
        playList[currentSong].rewind();
        //Reset PAUSE Button
        stopTimeStamp=0; //ERROR: inifinite loop of stopTimeStamp not being set, thus always stopped
        println("I am stopped");
}
