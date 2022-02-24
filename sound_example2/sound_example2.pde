import processing.sound.*;
Amplitude amp;
AudioIn in;

void setup() 
{
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
  fill(color(0,0,0,10));
  rect(0,0,width,height);
  fill(color(255,255,255));
  circle(width/2,height/2,10+(amp.analyze()*1500.0));
  //println(amp.analyze());
}
