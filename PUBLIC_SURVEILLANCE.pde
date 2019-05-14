import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  frameRate(15);
  fullScreen(SPAN);
  video = new Capture(this, 1920/2, 1080/2);
  opencv = new OpenCV(this, 1920/2, 1080/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  

  video.start();

}
//glitch video
void mousePressed() {
  loadPixels();
  for( int i=0; i<pixels.length; i++)
    pixels[i] = color( 0,0,225 );
  updatePixels();
}


void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );


  noFill();
  filter(GRAY);
  stroke(0, 0, 255);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
 


  }
}

void captureEvent(Capture c) {
  c.read();
}
