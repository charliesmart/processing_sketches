int stepSize = 10;
int diameter = 2;
int size = 640;
int numWalkers = 30;


Walker[] myWalkers = new Walker[numWalkers];

void setup() {
  frameRate(300);
  size(640, 640);
  background(255, 252, 247);
  colorMode(HSB, 360, 100, 100);
  
  for (int i = 0; i < numWalkers; i++) {
    int x = (int) random(0, size);
    int y = (int) random(0, size);
    
    myWalkers[i] = new Walker(x, y);
  }
}

void draw() {
  for (int i = 0; i < numWalkers; i++) {
    myWalkers[i].update();
  }
}

class Walker {
  int yPos, xPos;
  int h = 224;
  int s = 17;
  int b = 83;
  int counter = 0;
  
  Walker(int x, int y) {
    xPos = x;
    yPos = y;
  }
  
  void update() {
    
    counter += 1;
    
    if (counter == 500) {
      s += 1;
      b -= 1;
      counter = 0;
    }
    
    xPos += (int) random(0, 3) - 1;
    yPos += (int) random(0, 3) - 1;
    
    if (xPos < 0) {
      xPos = width;
    } else if (xPos > width) {
      xPos = 0;
    }
    
    if (yPos < 0) {
      yPos = height;
    } else if (yPos > height) {
      yPos = 0;
    }
    
    fill(color(h, s, b, 30));
    noStroke();
    ellipse(xPos, yPos, diameter, diameter);
  }
}