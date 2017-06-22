/*============================================================================
# Variables
==============================================================================*/
import codeanticode.syphon.*;
SyphonServer server;

float randomNumber;
float smoothNumber;
PImage img, img2;
int imageSize = 500;

/*============================================================================
# Syphon Settings
==============================================================================*/
void settings() {
  size(370,400, P3D);
  PJOGL.profile=1;
  smooth(8);
}

/*============================================================================
# One Time Setup
==============================================================================*/
void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  background(0);
  noStroke();
  frameRate(5);
  
  //img = loadImage("data.png");
  img2 = loadImage("http://www.onapples.com/uploads/varieties/3y3v9tyf8h96.png");
  img = loadImage("https://upload.wikimedia.org/wikipedia/commons/1/16/Rainbow_trout_transparent.png");
  
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  
}



/*============================================================================
# Running on a Loop
==============================================================================*/
void draw() {
  randomNumber = random(255);
  smoothNumber = abs(
    int(
      sin(
        frameCount * 0.005
      ) * 256
    )
  );
  translate(width/2, height/2, smoothNumber);
  
  rotateX(frameCount * 0.2);
  rotateY(frameCount * 0.1);
  tint(smoothNumber, smoothNumber, 255, smoothNumber);
  image(
    img2, 
    random(width), 
    random(height),
    smoothNumber, 
    smoothNumber
  );
  rotateX(frameCount * -0.02);
  rotateY(frameCount * -0.01);
  tint(smoothNumber, smoothNumber, 255, smoothNumber);
  image(
    img, 
    random(width), 
    random(height), 
    smoothNumber, 
    smoothNumber
  );
  
  // Leave this at the end to send the frames to the stream
  server.sendScreen();
}