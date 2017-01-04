int stepSize = 10;
int diameter = 1;
int size = 1080;
int numWalkers = 20;
int center = size / 2;
int circleSize = 200;
int xTranslate = 0;
int yTranslate = 0;


Walker[] myWalkers = new Walker[numWalkers];

void setup() {
  frameRate(300);
  size(1080, 1080);
  background(255, 252, 247);
  
  for (int i = 0; i < numWalkers; i++) {
    float x = i * (width / numWalkers);
    float y = center;
    
    myWalkers[i] = new Walker(x, y);
  }
}

void draw() {
 
  noFill();
  stroke(63, 51, 109, 10);
  strokeWeight(0.1);
  beginShape();
  for (int i = 0; i < numWalkers; i++) {
    myWalkers[i].update();
  }
  endShape();
}

void keyPressed() {
  if (key == 'p') {
    saveFrame();
  }
}

class Walker {
  float yPos, xPos, originalYPos;
  int counter = 0;
  
  Walker(float x, float y) {
    xPos = x;
    yPos = y;
    originalYPos = y;
  }
  
  void drawCurrent() {
    curveVertex(xPos, yPos);
  }
  
  void update() {
    
    counter += 1;
    
    if (xPos >= width) {
      xPos = 0;
      yPos = originalYPos;
    }
    
    float rand = random(0, width);
    
    if (rand < xPos) {
      yPos += random(-8, 8);
    }
    
    curveVertex(xPos, yPos);
    
    /*fill(color(h, s, b, 255));
    noStroke();
    ellipse(xPos, yPos, diameter, diameter);*/
  }
}