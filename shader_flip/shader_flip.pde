// The world pixel by pixel 2020
// Daniel Rozin
// use fragment shader to do a flip live video


import processing.video.*;

float angle;
Capture video;
PShader myFragShader;

void setup() {
  size(1280, 960, P2D);
  frameRate(30);             
  myFragShader = loadShader("FragShaderFlip.glsl");
  video = new Capture(this,width, height);
  video.start();
}
void captureEvent(Capture c) {
  c.read();
}

void draw() {
  image(video,0,0);
  shader(myFragShader);
  println (frameRate);
}
