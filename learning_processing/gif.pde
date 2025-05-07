PImage[] frames; 
int totalFrames = 39;
int currentFrame = 0;
float frameDelay = 2;
int frameCounter = 0;

// Update frame logic and return the current frame image
PImage getNextFrame() {
  frameCounter++;
  if (frameCounter >= frameDelay) {
    currentFrame = (currentFrame + 1) % totalFrames;
    frameCounter = 0;
  }
  return frames[currentFrame];
}
