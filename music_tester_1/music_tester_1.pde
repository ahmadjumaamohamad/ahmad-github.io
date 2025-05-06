PImage photo;

void setup() {
  size(400, 400);
  photo = loadImage("neon.gif");
}

void draw() {
  image(photo, 0, 0);
}
