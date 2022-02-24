import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
int n=0;

void setup()
{
  size(1000, 1000,P3D);
  noStroke();
  rectMode(CENTER);
  minim = new Minim(this);
  mySound = minim.loadFile("dk.mp3");
  mySound.play();
}

void draw()
{
  background(0);
  translate(width/2,height/2);
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  
  {
    rotateX(n*-PI/6*0.05);
    rotateY(n*-PI/6*0.05);
    rotateZ(n*-PI/6*0.05);
    fill(random(255),random(255),random(255));
    rect(i,0,mySound.left.get(i)*50,mySound.left.get(i)*150);
  }
  n=n+1;
}

//mute out
void keyPressed()
{
  if ( key == 'm'|| key == 'M' )
  {
    if ( mySound.isMuted() )
    {
      mySound.unmute();
    }
    else
    {
      mySound.mute();
    }
  }
}

void stop()
{
  mySound.close();
  minim.stop();
  super.stop();
}
