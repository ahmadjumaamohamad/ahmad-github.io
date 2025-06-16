void checkForSongEnd() {
  if (!playList[currentSong].isPlaying() && playList[currentSong].position() > 0) {
    if (playMode == 1) {
      playRandomSong();  // Play random continuously
    } else if (playMode == 2) {
      currentSong = (currentSong + 1) % numberOfSongs;
      playList[currentSong].rewind();
      playList[currentSong].play();
    } else if (playMode == 3) {
      // Do nothing – play once only
    }
  }
}
void playRandomSong() {
  int randomIndex = currentSong;
  while (randomIndex == currentSong && numberOfSongs > 1) {
    randomIndex = int(random(numberOfSongs));
  }
  currentSong = randomIndex;
  playList[currentSong].rewind();
  playList[currentSong].play();
}
void nextSong()
{
  // Stop current song
  if (playList[currentSong].isPlaying()) {
    playList[currentSong].pause();
    playList[currentSong].rewind();
  }

  // Move to next song (wrap around)
  currentSong = (currentSong + 1) % numberOfSongs;
  playList[currentSong].rewind();
  playList[currentSong].play();
  println("Now playing next song: " + currentSong);
}

void previousSong()
{
    // Stop current song
  playList[currentSong].pause();
  playList[currentSong].rewind();
      // Move to previous song (wrap around)
  currentSong = (currentSong - 1 + numberOfSongs) % numberOfSongs;
  playList[currentSong].rewind();
  playList[currentSong].play();
  println("Now playing previous song: " + currentSong);
}
void cycleButton(){
    playMode = (playMode % 3) + 1;  // Cycles 1→2→3→1...

  if (playMode == 0) {
    println("▶ Mode 1: Play Random Continuously");
    playRandomSong();  // Random, continues randomly
  } 
  else if (playMode == 1) {
    println("▶ Mode 2: Autoplay Sequential");
    autoPlayEnabled = true;
    playList[currentSong].rewind();
    playList[currentSong].play();
  } 
  else if (playMode == 2) {
    println("▶ Mode 3: Play Once Only");
    autoPlayEnabled = false;
    playList[currentSong].rewind();
    playList[currentSong].play();
  }
}
void forward(){
      if (playList[currentSong].isPlaying() || playList[currentSong].position() < playList[currentSong].length()) {
      int newPosition = playList[currentSong].position() + 10000; // 10,000 milliseconds = 10 seconds
      if (newPosition < playList[currentSong].length()) {
        playList[currentSong].cue(newPosition); // Jump to new position
      } else {
        playList[currentSong].rewind(); // If it exceeds length, restart the song
        playList[currentSong].pause();  // Or stop playing
        println("Reached end of song.");
      }
      println("Forwarded 10 seconds.");
}
}
void backWard(){
if (playList[currentSong].isPlaying() || playList[currentSong].position() < playList[currentSong].length()) {
   int newPosition = playList[currentSong].position() - 10000; // 10,000 milliseconds = 10 seconds
if (newPosition < playList[currentSong].length()) {
   playList[currentSong].cue(newPosition); // Jump to new position
} else {
      playList[currentSong].rewind(); // If it exceeds length, restart the song
      playList[currentSong].pause();  // Or stop playing
      println("Reached end of song.");
      }
      println("Backward 10 seconds.");
    }
}
void stopButton() {
  if (playList[currentSong].isPlaying()) {
    playList[currentSong].pause();
    playList[currentSong].rewind();
  }

else {
   playList[currentSong].play();
   println("I am playing");
 }
}
