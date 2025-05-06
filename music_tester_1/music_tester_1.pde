PImage[] frames;
int totalFrames = 10;  // Change this to match your number of frames
int currentFrame = 0;
int frameDelay = 5;  // Change this to control speed
int frameCounter = 0;

void setup() {
  size(800, 600);  // Match your frame size
  frames = new PImage[totalFrames];
  
  for (int i = 0; i < totalFrames; i++) {
    String filename = "frame_" + nf(i + 1) + "_delay-0.04s.png";
    frames[i] = loadImage(filename);
  }
}

void draw() {
  background(0);
  image(frames[currentFrame], 0, 0, width, height);
  
  frameCounter++;
  if (frameCounter >= frameDelay) {
    currentFrame = (currentFrame + 1) % totalFrames;
    frameCounter = 0;
  }
}
