PImage[] frames; 
int totalFrames = 164;
int currentFrame = 0;
float frameDelay = 2;
int frameCounter = 0;

void setup() {
  size(800, 600);
  frames = new PImage[totalFrames];

  for (int i = 0; i < totalFrames; i++) {
    String filename = "" + (i + 1) + "_delay-0.04s.png";
    frames[i] = loadImage(filename);
  }
}

// Update frame logic and return the current frame image
PImage getNextFrame() {
  frameCounter++;
  if (frameCounter >= frameDelay) {
    currentFrame = (currentFrame + 1) % totalFrames;
    frameCounter = 0;
  }
  return frames[currentFrame];
}

void draw() {
  background(0);
  PImage frameToDisplay = getNextFrame();
  image(frameToDisplay, 0, 0, width, height);
}
