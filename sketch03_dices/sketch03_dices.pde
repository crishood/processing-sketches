void setup() {
  size(displayWidth, displayHeight);
}

int framesToSave = 120; 
int framesSaved = 0; 

void draw() {
  frameRate(24);
  float totalWidth = 6 * 100;
  float startX = (width - totalWidth) / 2;
  background(#7AFFB8);
  for (int i = 0; i < 6; i++) {
    dice(startX + i * 100, height / 2, 80);
  }
   if (framesSaved < framesToSave) {
    saveFrame("frames/dice-####.png");
    framesSaved++;
  }

}

void dice(float posX, float posY, float size) {
  int diceValue = int(random(1, 7));
  float spacing = size / 4;
  noFill();
  rectMode(CENTER);
    stroke(#002147);
  strokeWeight(4);
  rect(posX, posY, size, size, size / 5);

  drawDots(posX, posY, diceValue, spacing);
}

void drawDots(float posX, float posY,  int diceValue, float spacing) {
  push();
  noStroke();
  switch (diceValue) {
    case 1:
      drawDot(posX, posY);
      break;
    case 2:
      drawDot(posX - spacing, posY - spacing);
      drawDot(posX + spacing, posY + spacing);
      break;
    case 3:
      drawDot(posX - spacing, posY - spacing);
      drawDot(posX, posY);
      drawDot(posX + spacing, posY + spacing);
      break;
    case 4:
      drawDot(posX - spacing, posY - spacing);
      drawDot(posX + spacing, posY - spacing);
      drawDot(posX - spacing, posY + spacing);
      drawDot(posX + spacing, posY + spacing);
      break;
    case 5:
      drawDot(posX - spacing, posY - spacing);
      drawDot(posX + spacing, posY - spacing);
      drawDot(posX, posY);
      drawDot(posX - spacing, posY + spacing);
      drawDot(posX + spacing, posY + spacing);
      break;
    case 6:
      drawDot(posX - spacing, posY - spacing);
      drawDot(posX + spacing, posY - spacing);
      drawDot(posX - spacing, posY);
      drawDot(posX + spacing, posY);
      drawDot(posX - spacing, posY + spacing);
      drawDot(posX + spacing, posY + spacing);
      break;
  }
  pop();
}

void drawDot(float x, float y) {
  fill(#002147);
  ellipse(x, y, 10, 10);
}

void settings() {
  fullScreen();
    pixelDensity(2);
}
