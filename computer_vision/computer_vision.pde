import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencv;
Capture cam;

void setup() 
{
  size(640, 480);  
  cam = new Capture(this, 640, 480);
  cam.start();
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}

void draw() 
{
  if(cam.available()) 
  {
    cam.read(); 
    image(cam,0,0); 
    opencv.loadImage(cam);
    Rectangle[] faces = opencv.detect();
    noFill();
    stroke(255,255,255);
    for(int i =0; i<faces.length; i=i+1)
    {
      rect(faces[i].x,faces[i].y,faces[i].width,faces[i].height);
    }
  } 
}
