void setup() {
  size(400, 400);
  background(255);
  translate(width / 2, height / 2);
  stroke(0);
  noFill();
  ellipse(0, 0, 300, 100); // Draw the original circle
  rectMode(CENTER);
 // rect(0, 0, 200, 200); // Draw the target square

  stroke(255, 0, 0);
  for (float angle = 0; angle < TWO_PI; angle += 0.1) {
    float r = 100; // Radius of the circle
    float x = r * cos(angle);
    float y = r * sin(angle);
    PVector mapped = circleToSquare(x, y, r);
    point(mapped.x, mapped.y);
  }
}

PVector circleToSquare(float x, float y, float r) {
  float nx = x / r;
  float ny = y / r;
  float absX = abs(nx);
  float absY = abs(ny);
  float maxComponent = max(absX, absY);
  if (maxComponent == 0) return new PVector(0, 0);
  float scale = 1 / maxComponent;
  return new PVector(nx * scale * r, ny * scale * r);
}
