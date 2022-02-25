import processing.sound.*;

Amplitude amp;
AudioIn in;

void setup() {
  size(640, 360);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}      

void draw() 
{
  
  noStroke();
  fill(color(255,255,255,10));
  rect(0,0,width,height);
  fill(color(0,0,0));
  circle(width/2,height/2,amp.analyze()*500.0);
}

void mousePressed()
{
  fill(color(0,0,0));
  circle(mouseX,mouseY,100);
}
