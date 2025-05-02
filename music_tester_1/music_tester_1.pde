PImage img;
float rectX, rectY, rectW, rectH;

void setup() {
  size(400, 400);
  img = loadImage("loopImage.JPG"); // Place image in the "data" folder
  rectX = 100;
  rectY = 100;
  rectW = 200;
  rectH = 150;
}

void draw() {
  background(255);

  // Resize image to fit rectangle area
  PImage cropped = img.get();  // Duplicate image
  cropped.resize((int)rectW, (int)rectH);

  // Draw image as the rectangle
  image(cropped, rectX, rectY);
}
