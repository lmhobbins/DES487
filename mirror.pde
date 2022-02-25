import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup(){
size(640, 480);
video = new Capture(this, 640, 480);
video.start();
opencv = new OpenCV(this, 640, 480);
opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}

void draw(){
opencv.loadImage(video);
image(video, 0, 0);
Rectangle[] faces = opencv.detect();
noFill();
stroke(color(255,0,0));
int maxH = -1;
for(int i = 0; i < faces.length; i++){
if(faces[i].height > maxH) maxH = faces[i].height;
rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
}
if(maxH > 640) maxH = 640;
if(maxH > 0){
float n = maxH / 640.0;
println(n);
filter(BLUR, round(n*50.0));

}
}

void captureEvent(Capture c){
c.read();

}