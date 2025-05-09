boolean isCircle = true;

void setup() {
  size(400, 400);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw() {
  background(255);
  fill(100, 150, 200);
  
  if (isCircle) {
    ellipse(width / 2, height / 2, 100, 100);
  } else {
    rect(width / 2, height / 2, 100, 100);
  }
}

void mousePressed() {
  isCircle = !isCircle;
}
