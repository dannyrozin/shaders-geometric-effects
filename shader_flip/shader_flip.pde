// The world pixel by pixel 2018
// Daniel Rozin
// use fragment shader to do a blur on live video


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
  angle+=0.01;
  image(video,0,0);
  float x = map(mouseX, 0,width, 0,1);
  float y = map(mouseY, 0,height, 0,1);
  myFragShader.set("mouseX",x);
  myFragShader.set("mouseY",y);
  shader(myFragShader);
  println (frameRate);
}